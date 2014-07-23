VIES Check Vat: C# Client Example
===================

You can verify the validity of a VAT number issued by any Member State by the European Information Exchange System (VIES) system for validation of VAT numbers. For more information on this service please visit [VIES VAT number validation](http://ec.europa.eu/taxation_customs/vies/)

The VIES has publicly exposed this service through the SOAP protocol. The service is called checkVatService and the WSDL document is located at the following address [WSDL checkVatService](http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl).

This C# project implements a simple SOAP client to use the VIES services.

The project is divided into two sub-projects:
* **VIESCheckVatService** : Contains the SOAP proxy class and some interfaces and classes of boundary.
* **VIESCheckVatServiceClient** : It contains a simple Windows application that uses the service via the VIES SOAP client.

Figure 1 shows the classes and interfaces created to interact with the service. In detail:
* **IVIESCheckVatService** : Generically defines the interface for interaction with the services VIES.
* **VIESCheckVatServicesSOAPImpl** : Class that implements the interface defined above. This class is specific to interact via SOAP.
* **VIESCheckServiceFactory** : Factory class that returns the correct implementation of the client that interacts with the services VIES. The implementation is supported SOAP.
* **VIESVatModel** : This class represents the set of data returned by the service VIES.

![](http://www.dontesta.it/blog/wp-content/uploads/2014/07/VIESCheckVatServiceClassDiagram_1.png "Class Diagram of the VIESCheckVatService")

Figure 1. Class Diagram of the VIESCheckVatService