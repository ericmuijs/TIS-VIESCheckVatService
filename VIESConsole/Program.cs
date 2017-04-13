using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VIESCheckVatService;

namespace VIESConsole
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                VIESCheckVatService.IVIESCheckVatService iCheckVatService = VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);

                while (true)
                {
                    Console.WriteLine("VAT Country?");
                    string VAT_country = Console.ReadLine();
                    Console.WriteLine("VAT Number?");
                    string VAT_number = Console.ReadLine();

                    VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(VAT_country, VAT_number);

                    Console.Out.WriteLine("Valid: " + vatModel.Valid);
                    Console.Out.WriteLine("County Code: " + vatModel.CountryCode);
                    Console.Out.WriteLine("VAT Number: " + vatModel.VatNumber);
                    Console.Out.WriteLine("Request Date: " + vatModel.RequestDate);
                    Console.Out.WriteLine("Org. Name: " + vatModel.Name);
                    Console.Out.WriteLine("Org. Address: " + vatModel.Address);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(
                    "The service has responded with an error. " + ex.Message,
                    "Service error occurred");
                Console.ReadKey();

            }
           
        }
    }
}
