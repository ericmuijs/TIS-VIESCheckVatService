VIES Check Vat: C# Client Example
===================

### 1. Overview
You can verify the validity of a VAT number issued by any Member State by the European Information Exchange System (VIES) system for validation of VAT numbers. For more information on this service please visit [VIES VAT number validation](http://ec.europa.eu/taxation_customs/vies/)

The VIES has publicly exposed this service through the SOAP protocol. The service is called checkVatService and the WSDL document is located at the following address [WSDL checkVatService](http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl).

This C# project implements a simple SOAP client to use the VIES services.

### 2. Project details
The project is divided into two sub-projects:
* **VIESCheckVatService** : Contains the SOAP proxy class and some interfaces and classes of boundary.
* **VIESCheckVatServiceClient** : It contains a simple Windows application that uses the service via the VIES SOAP client.

Figure 1 shows the classes and interfaces created to interact with the service. In detail:
* **IVIESCheckVatService** : Generically defines the interface for interaction with the services VIES.
* **VIESCheckVatServicesSOAPImpl** : Class that implements the interface defined above. This class is specific to interact via SOAP.
* **VIESCheckServiceFactory** : Factory class that returns the correct implementation of the client that interacts with the services VIES. The implementation is supported SOAP.
* **VIESVatModel** : This class represents the set of data returned by the service VIES.

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClassDiagram_1.png "Class Diagram of the VIESCheckVatService")

**Figure 1. Class Diagram of the VIESCheckVatService**


Please find below an example of C # code that shows the use of the VIES service.

```C#
VIESCheckVatService.IVIESCheckVatService iCheckVatService =
    VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);

VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT("IT", "01983251678");

Console.Out.WriteLine("Valid: " + vatModel.Valid);
Console.Out.WriteLine("County Code: " + vatModel.CountryCode);
Console.Out.WriteLine("VAT Number: " + vatModel.VatNumber);
Console.Out.WriteLine("Request Date: " + vatModel.RequestDate);
Console.Out.WriteLine("Org. Name: " + vatModel.Name);
Console.Out.WriteLine("Org. Address: " + vatModel.Address);

```
**Source Code 1. Example C# client code that use VIES service**

The following figures show the windows application (available in the project) that interacts with the VIES service.

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClient_1.png)

**Figure 2. Validation VAT number OK**

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClient_2.png)

**Figure 3. Validation VAT number FAILED**

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClient_3.png)

**Figure 4. Validation VAT number field required**

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClient_4.png)

**Figure 5. Validation VAT number FAILED for network problems**

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClient_5.png)

**Figure 6. Validation VAT number FAILED for SOAP Fault**

The project was developed using the [SharpDevelop](http://www.icsharpcode.net/) tool (version 4.4). In addition, the project has been tested and run on the platform. NET 4.

### 3. Notes
To use the service you are invited to read the document [Specific disclaimer for this service](http://ec.europa.eu/taxation_customs/vies/disclaimer.html) issued by the European Commission.

### 4. Resources
