﻿/*
Deployment script for TIS_Tariff

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TIS_Tariff"
:setvar DefaultFilePrefix "TIS_Tariff"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping [dbo].[VAT_VIES_validity]...';


GO
DROP FUNCTION [dbo].[VAT_VIES_validity];


GO
PRINT N'Dropping [SQL_Database]...';


GO
DROP ASSEMBLY [SQL_Database];


GO
PRINT N'Creating [SQL_Database]...';


GO
CREATE ASSEMBLY [SQL_Database]
    AUTHORIZATION [dbo]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103001341EF580000000000000000E00022200B013000000A000000060000000000000E290000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000BC2800004F00000000400000B802000000000000000000000000000000000000006000000C000000842700001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E746578740000001409000000200000000A000000020000000000000000000000000000200000602E72737263000000B80200000040000000040000000C0000000000000000000000000000400000402E72656C6F6300000C0000000060000000020000001000000000000000000000000000004000004200000000000000000000000000000000F0280000000000004800000002000500D4210000B005000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3004006E00000001000011000F00FE16080000016F0500000A0A0616186F0600000A0B0619066F0700000A18596F0600000A0C1203FE15070000010016280800000A1304110407086F0900000A130511056F0A00000A280B00000A280C00000A0D00DE0D13060015280C00000A0D00DE000913072B0011072A000001100000000030002959000D0B0000011B300400CE00000002000011000F00FE16080000016F0500000A0A0616186F0600000A0B0619066F0700000A18596F0600000A0C1203FE15080000010016280800000A1304110407086F0900000A130511056F0A00000A130611062C48001B8D05000001251611056F0D00000AA225177201000070A2251811056F0E00000AA225197201000070A2251A11056F0F00000A8C10000001A2281000000A281100000A0D002B0D007205000070281100000A0D0000DE1D130700720700007011076F1200000A281300000A281100000A0D00DE000913082B0011082A0000011000000000300079A9001D0B0000012202281400000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C000000EC010000237E0000580200006C02000023537472696E677300000000C40400001C00000023555300E0040000100000002347554944000000F0040000C000000023426C6F620000000000000002000001471502000900000000FA0133001600000100000010000000020000000300000002000000140000000500000002000000010000000300000000006A010100000000000600F700CB0106001701CB010600CE00B8010F00EB010000060037027B010A00E20097010A000100FA010A003501FA010E00670068000E005D016800060082017B01060041017B010E00520268000E00A500680006004A027B0106009C007B010000000012000000000001000100010010000F020000150001000100502000000000960036007C000100DC200000000096001B0083000200C821000000008618B20106000300000001008C01000001008C010900B20101001100B20106001900B2010A003100B201060029003F012000610048012400610052012A0069007C002E0049002900350051005D003C0079000A00400039003E0245005100930020005100240220005100BE005C0061003002610041003E026700590087002000610030026D002900B201060020002300BB002E000B008A002E00130093002E001B00B20040002300BB0010004B00048000000000000000000000000000000000B10000000400000000000000000000007300540000000000040000000000000000000000730048000000000001000000A8187B3B000000000000680000000000000000000053716C496E74313600546F496E743136003C4D6F64756C653E005641545F564945535F494E464F0067657444657461696C564154005641545F564945535F56414C49444954590053797374656D2E44617461006D73636F726C6962006765745F56616C6964004956494553436865636B566174536572766963650067657453657276696365006765745F4D657373616765006765745F4E616D65004461746554696D650053657276696365547970650053514C5F4461746162617365006765745F52657175657374446174650044656275676761626C654174747269627574650053716C46756E6374696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C6974794174747269627574650053716C537472696E6700546F537472696E6700537562737472696E67006765745F4C656E67746800564945535661744D6F64656C0053514C5F44617461626173652E646C6C0053797374656D00457863657074696F6E005641545F6E756D626572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F6465730053797374656D2E446174612E53716C54797065730055736572446566696E656446756E6374696F6E73006765745F4164647265737300436F6E636174004F626A656374006F705F496D706C6963697400436F6E766572740056494553436865636B53657276696365466163746F727900000000032F000001001121004500520052004F0052003A00200000000000C6381B051C988B439575FD350427D452000420010108032000010520010111110F07080E0E0E111D12251229122D111D0320000E0520020E0808032000080600011225113906200212290E0E032000020400010602050001111D061007090E0E0E11211225122902122D112104200011410500010E1D1C05000111210E0500020E0E0E08B77A5C561934E089060001111D1121060001112111210801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F7773010801000701000000000401000000000000001341EF5800000000020000001C010000A0270000A0090000525344539D37C88B8A4CD34281FEE4CD74D4CF4D01000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C6F626A5C44656275675C53514C5F44617461626173652E70646200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000E42800000000000000000000FE280000002000000000000000000000000000000000000000000000F0280000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF25002000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000005C02000000000000000000005C0234000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000000000000000000000000000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B004BC010000010053007400720069006E006700460069006C00650049006E0066006F0000009801000001003000300030003000300034006200300000002C0002000100460069006C0065004400650073006300720069007000740069006F006E000000000020000000300008000100460069006C006500560065007200730069006F006E000000000030002E0030002E0030002E003000000042001100010049006E007400650072006E0061006C004E0061006D0065000000530051004C005F00440061007400610062006100730065002E0064006C006C00000000002800020001004C006500670061006C0043006F0070007900720069006700680074000000200000004A00110001004F0072006900670069006E0061006C00460069006C0065006E0061006D0065000000530051004C005F00440061007400610062006100730065002E0064006C006C0000000000340008000100500072006F006400750063007400560065007200730069006F006E00000030002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000030002E0030002E0030002E00300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000103900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
ALTER ASSEMBLY [SQL_Database]
    DROP FILE ALL
    ADD FILE FROM 0x4D6963726F736F667420432F432B2B204D534620372E30300D0A1A445300000000020000020000001B000000880000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF380000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0BCA3101380000000010000000100000000000000F00FFFF04000000FFFF03000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA3101380000000010000000100000000000001000FFFF04000000FFFF0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31011341EF58010000009D37C88B8A4CD34281FEE4CD74D4CF4D00000000000000000100000001000000000000000000000000000000DC51330100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF04000000FFFF030000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF04000000FFFF030000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BDEC1618FF5EAA104D87F76F49638334601400000000000000E257A5D60BFA94ABE8B2EC9CE51A96B02887C57C000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BDEC1618FF5EAA104D87F76F496383346014000000000000004BA8D4F2BCE2CF97C3943A578FC2DF064ADBF59100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003C010000000000003C010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FEEFFEEF010000004601000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F494E464F2E63730000633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F696E666F2E637300433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F56414C49444954592E637300633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F76616C69646974792E637300070000000000000050000000A0000000F3000000010000005100000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001BE23001AC00000036F5BD2036B4D2010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000004000000010000000A0000000000000051000000280000001BE23001675C87515C000000010000005000000051000000650000000000000000000000F3000000280000001BE230015C9154D85C000000A000000050000000F300000065000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000003A002A110000000004020000000000006E0000000000000000000000010000060000000001000000005641545F564945535F56414C494449545900001600031104000000B40100006E00000000000000010000000A0024115553797374656D001A0024115553797374656D2E446174612E53716C54797065730000001A0024115556494553436865636B56617453657276696365000000001A00201100000000010000110000000000000000696E7075740000002200201101000000010000110000000000000000696E7075745F636F756E7472790000002200201102000000010000110000000000000000696E7075745F6E756D626572000000001A002011030000000100001100000000000000006F7574707574000016000311400000007C010000270000003000000001000000260020110400000001000011000000000000000069436865636B56617453657276696365000000001E002011050000000100001100000000000000007661744D6F64656C00000000020006001600031140000000B00100000D000000590000000100000016002011060000000100001100000000000000006578000002000600020006004A000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004020000040000000C00000001000300040600001C0000000113014201790180CA0181330181C901827916010200060036002A1100000000C403000000000000CE0000000000000000000000020000066E00000001000000005641545F564945535F494E464F0000160003110802000070030000CE0000006E000000010000001A00201100000000020000110000000000000000696E7075740000002200201101000000020000110000000000000000696E7075745F636F756E7472790000002200201102000000020000110000000000000000696E7075745F6E756D626572000000001A002011030000000200001100000000000000006F75747075740000160003114002000038030000770000009E00000001000000260020110400000002000011000000000000000069436865636B56617453657276696365000000001E002011050000000200001100000000000000007661744D6F64656C000000000200060016000311400200006C0300001D000000170100000100000016002011070000000200001100000000000000006578000002000600020006004E000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004020000040100000C0000000100000604060001200000000113014201790180C301812D0181B802820E01830916010002000600F2000000D800000000000000010001006E0000000000000010000000CC0000000000000009000080010000000A0000800F0000000B000080180000000C000080280000000E0000803000000011000080310000001200008039000000130000804400000015000080560000001700008059000000180000805B000000190000805C0000001A000080630000001B000080660000001D0000806B000000200000800500060009002E00090036000900440009002A0009000A000D0092000D0074000D00360009000A0009001D0009000A000D00190009000A000900170005000600F20000002C0100006E00000001000100CE0000000800000017000000200100000000000009000080010000000A0000800F0000000B000080180000000C000080280000000E00008030000000110000803100000012000080390000001300008044000000150000804D000000EEEFFE80510000001600008052000000170000809600000018000080990000001A0000809A0000001B000080A50000001C000080A60000001E000080A90000001F000080AB00000020000080AC00000021000080C300000022000080C600000024000080CB000000250000800500060009002E00090036000900440009002C0009000A000D0092000D0074000D002000000000000D000E0011005E000D000E000D000E0011001D000D000E0009000A0009001D0009000A000D002E0009000A000900170005000600F400000010000000A00000000000000001000000000000001000000000000000200000003800000054000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF120000000140200005500000001000000210000000100000039000000010000000100000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C00000018000000240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E002511000000000400000001005641545F564945535F56414C4944495459001600291100000000040000000100303630303030303100001A002511000000000802000001005641545F564945535F494E464F00160029110000000008020000010030363030303030320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000066656080FFFFFFFF1A092FF10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31011341EF58010000009D37C88B8A4CD34281FEE4CD74D4CF4DDA0000002F4C696E6B496E666F002F6E616D6573002F7372632F686561646572626C6F636B002F7372632F66696C65732F633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F696E666F2E6373002F7372632F66696C65732F633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F76616C69646974792E637300050000000A000000010000002E02000000000000110000000700000000000000050000007C000000090000000A00000006000000220000000800000000000000DC5133010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF77093101010000000C00008E0D00055F0E000000600000003C0000002C000000B4000000000000000000000016000000190000000000EEC00000000000000000FFFF000000000000FFFFFFFF00000000FFFF0000000000000000000000000B00C8030000000000002C0200000200000000000000000000000000000055736572446566696E656446756E6374696F6E730037314141414545380000002DBA2EF10100E97F000000006E000000000000000000F27F00000000000000000100E97F6E000000CE000000000000000000F27F0000000000000000020002000D01000000000100FFFFFFFF000000003C0100000802000000000000FFFFFFFF00000000FFFFFFFF01000200000002000000000053000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F56414C49444954592E637300433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F494E464F2E6373000000FEEFFEEF010000000100000000010000000000000000000000FFFFFFFFFFFFFFFFFFFF0A00FFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000F000000200000003E01000038000000EB010000380000000000000076010000AC0000005C0000005C0000002800000008060000440200002C0000006C00000003000000150000000600000016000000070000000B0000000C00000008000000090000000A0000000D0000000E0000000F000000100000001100000012000000140000001300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 AS N'SQL_Database.pdb';


GO
PRINT N'Creating [dbo].[VAT_VIES_VALIDITY]...';


GO
CREATE FUNCTION [dbo].[VAT_VIES_VALIDITY]
(@VAT_number NVARCHAR (MAX) NULL)
RETURNS SMALLINT
AS
 EXTERNAL NAME [SQL_Database].[UserDefinedFunctions].[VAT_VIES_VALIDITY]


GO
PRINT N'Creating [dbo].[VAT_VIES_INFO]...';


GO
CREATE FUNCTION [dbo].[VAT_VIES_INFO]
(@VAT_number NVARCHAR (MAX) NULL)
RETURNS NVARCHAR (MAX)
AS
 EXTERNAL NAME [SQL_Database].[UserDefinedFunctions].[VAT_VIES_INFO]


GO
PRINT N'Update complete.';


GO
