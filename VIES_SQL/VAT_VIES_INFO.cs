using System;
using System.Data.SqlTypes;
using VIESCheckVatService;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString VAT_VIES_INFO(SqlString VAT_number)
    {
        string input = VAT_number.ToString();
        SqlString output = new SqlString();
        if (input.Length < 4)
        {
            output = "!ERROR: Input Number Invalid";
            return output;
        }

        string input_country = input.Substring(0, 2);
        string input_number = input.Substring(2);        

        try
        {
            VIESCheckVatService.IVIESCheckVatService iCheckVatService = VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);
            VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(input_country, input_number);

            if (vatModel.Valid)
            {
                output = vatModel.Name + "/" + vatModel.Address + "/" + vatModel.RequestDate;
            }
            else
            {
                output = "";
            }

        }
        catch (Exception ex)
        {
            output = "!ERROR: " + ex.Message;
        }

        return output;
    }
}
