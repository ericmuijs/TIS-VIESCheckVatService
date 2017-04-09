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
        string output = country_code.ToString() + VAT_number.ToString();
        // Put your code here
        return new SqlString(output);
    }
}

