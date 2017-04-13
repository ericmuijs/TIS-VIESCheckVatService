using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;
using VIESCheckVatService;

public partial class UserDefinedFunctions
{
    [Microsoft.SqlServer.Server.SqlFunction]
    public static SqlString VAT_VIES_validity(SqlString country_code, SqlString VAT_number)
    {
        

        try
        {
            VIESCheckVatService.IVIESCheckVatService iCheckVatService =
               VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);

           
            VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(country_code.ToString(), VAT_number.ToString());

            /*Console.Out.WriteLine("Valid: " + vatModel.Valid);
            Console.Out.WriteLine("County Code: " + vatModel.CountryCode);
            Console.Out.WriteLine("VAT Number: " + vatModel.VatNumber);
            Console.Out.WriteLine("Request Date: " + vatModel.RequestDate);
            Console.Out.WriteLine("Org. Name: " + vatModel.Name);
            Console.Out.WriteLine("Org. Address: " + vatModel.Address*/
            // Put your code here
            return new SqlString(vatModel.Name);

        }
        catch (Exception ex)
        {
            return new SqlString(ex.Message);
        }
        
    }
}

