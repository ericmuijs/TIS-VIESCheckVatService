VIES Check Vat: C# Client Example
===================

You can verify the validity of a VAT number issued by any Member State by the European Information Exchange System (VIES) system for validation of VAT numbers. For more information on this service please visit [VIES VAT number validation](http://ec.europa.eu/taxation_customs/vies/)

The VIES has publicly exposed this service through the SOAP protocol. The service is called checkVatService and the WSDL document is located at the following address [WSDL checkVatService](http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl).

This C# project implements a simple SOAP client to use the VIES services.

The project is divided into two sub-projects:
* **VIESCheckVatService** : Contains the SOAP proxy class and some interfaces and classes of boundary.
* **VIESCheckVatServiceClient** : Contiene una semplice applicazione Windows che utilizza il servizio VIES tramite il client SOAP.