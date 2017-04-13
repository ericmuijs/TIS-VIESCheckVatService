using System;
using System.Data.SqlTypes;
using VIESCheckVatService;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlInt16 VAT_VIES_VALIDITY(SqlString VAT_number)
    {
        string input = VAT_number.ToString();
        SqlInt16 output = new SqlInt16();

        if (input.Length < 4)
        {
            output = -2;
            return output;
        }

        string input_country = input.Substring(0, 2);
        string input_number = input.Substring(2);



        try
        {
            VIESCheckVatService.IVIESCheckVatService iCheckVatService = VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);           
            VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(input_country, input_number);

            output = Convert.ToInt16(vatModel.Valid);        
            
        }
        catch (Exception ex)
        {
            output = -1;
        }

        return output;
        
        
    }
}

