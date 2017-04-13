﻿/*
Deployment script for TIS2017_Customs_Data

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "TIS2017_Customs_Data"
:setvar DefaultFilePrefix "TIS2017_Customs_Data"
:setvar DefaultDataPath "F:\MSSQL10_50.PRD\MSSQL\DATA\"
:setvar DefaultLogPath "G:\MSSQL10_50.PRD\MSSQL\Data\"

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
PRINT N'Altering [SQL_Database]...';


GO
ALTER ASSEMBLY [SQL_Database]
    DROP FILE ALL;


GO
ALTER ASSEMBLY [SQL_Database]
    FROM 0x4D5A90000300000004000000FFFF0000B800000000000000400000000000000000000000000000000000000000000000000000000000000000000000800000000E1FBA0E00B409CD21B8014CCD21546869732070726F6772616D2063616E6E6F742062652072756E20696E20444F53206D6F64652E0D0D0A2400000000000000504500004C0103007D4AEF580000000000000000E00022200B013000000A0000000600000000000082290000002000000040000000000010002000000002000004000000000000000600000000000000008000000002000000000000030060850000100000100000000010000010000000000000100000000000000000000000302900004F00000000400000B802000000000000000000000000000000000000006000000C000000F82700001C0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000080000000000000000000000082000004800000000000000000000002E746578740000008809000000200000000A000000020000000000000000000000000000200000602E72737263000000B80200000040000000040000000C0000000000000000000000000000400000402E72656C6F6300000C00000000600000000200000010000000000000000000000000000040000042000000000000000000000000000000006429000000000000480000000200050004220000F405000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001B3003008300000001000011000F00FE16080000016F0500000A0A1201FE1507000001066F0600000A1AFE04130411042C0E001FFE280700000A0B0713052B4C0616186F0800000A0C06186F0900000A0D0016280A00000A1306110608096F0B00000A130711076F0C00000A280D00000A280700000A0B00DE0D13080015280700000A0B00DE000713052B0011052A000110000000004500296E000D0B0000011B300400E900000002000011000F00FE16080000016F0500000A0A1201FE1508000001066F0600000A1AFE04130411042C14007201000070280E00000A0B07130538AC0000000616186F0800000A0C06186F0900000A0D0016280A00000A1306110608096F0B00000A130711076F0C00000A130811082C48001B8D05000001251611076F0F00000AA22517723B000070A2251811076F1000000AA22519723B000070A2251A11076F1100000A8C10000001A2281200000A280E00000A0B002B0D00723F000070280E00000A0B0000DE1D130900724100007011096F1300000A281400000A280E00000A0B00DE000713052B0011052A0000000110000000004B0079C4001D0B0000012202281500000A002A00000042534A4201000100000000000C00000076342E302E33303331390000000005006C000000F0010000237E00005C0200006C02000023537472696E677300000000C804000054000000235553001C0500001000000023475549440000002C050000C800000023426C6F620000000000000002000001471502000900000000FA0133001600000100000010000000020000000300000002000000150000000500000002000000010000000300000000006A010100000000000600F700CB0106001701CB010600CE00B8010F00EB010000060037027B010A00E20097010A000100FA010A003501FA010E00670068000E005D016800060082017B01060041017B010E00520268000E00A500680006004A027B0106009C007B010000000012000000000001000100010010000F0200001500010001005020000000009600360083000100F0200000000096001B008A000200F821000000008618B20106000300000001008C01000001008C010900B20101001100B20106001900B2010A003100B201060029003F01210061005201250039003E022900610048012F0061004801350069007C003A0049002900410051005D00480079000A004C0041003E0263005100930021005100240221005100BE006900610030026E005900870021006100300274002900B201060020002300C2002E000B0091002E0013009A002E001B00B90040002300C20010005100048000000000000000000000000000000000B10000000400000000000000000000007A005400000000000400000000000000000000007A0048000000000001000000A8183F5100000000000068000000000000000053716C496E74313600546F496E743136003C4D6F64756C653E005641545F564945535F494E464F0067657444657461696C564154005641545F564945535F56414C49444954590053797374656D2E44617461006D73636F726C6962006765745F56616C6964004956494553436865636B566174536572766963650067657453657276696365006765745F4D657373616765006765745F4E616D65004461746554696D650053657276696365547970650053514C5F4461746162617365006765745F52657175657374446174650044656275676761626C654174747269627574650053716C46756E6374696F6E41747472696275746500436F6D70696C6174696F6E52656C61786174696F6E734174747269627574650052756E74696D65436F6D7061746962696C6974794174747269627574650053716C537472696E6700546F537472696E6700537562737472696E67006765745F4C656E67746800564945535661744D6F64656C0053514C5F44617461626173652E646C6C0053797374656D00457863657074696F6E005641545F6E756D626572004D6963726F736F66742E53716C5365727665722E536572766572002E63746F720053797374656D2E446961676E6F73746963730053797374656D2E52756E74696D652E436F6D70696C6572536572766963657300446562756767696E674D6F6465730053797374656D2E446174612E53716C54797065730055736572446566696E656446756E6374696F6E73006765745F4164647265737300436F6E636174004F626A656374006F705F496D706C6963697400436F6E766572740056494553436865636B53657276696365466163746F7279000000003921004500520052004F0052003A00200049006E0070007500740020004E0075006D00620065007200200049006E00760061006C006900640000032F000001001121004500520052004F0052003A002000000014A69BED2A7F8943906B849E808C7E67000420010108032000010520010111111007090E111D0E0E02111D12251229122D0320000E03200008050001111D060520020E08080420010E080600011225113906200212290E0E03200002040001060211070A0E11210E0E0211211225122902122D05000111210E04200011410500010E1D1C0500020E0E0E08B77A5C561934E089060001111D1121060001112111210801000800000000001E01000100540216577261704E6F6E457863657074696F6E5468726F777301080100070100000000040100000000000000007D4AEF5800000000020000001C01000014280000140A000052534453CDD19EC798E0E74986EAC0A0E3D3DFBE01000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C6F626A5C44656275675C53514C5F44617461626173652E706462000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005829000000000000000000007229000000200000000000000000000000000000000000000000000064290000000000000000000000005F436F72446C6C4D61696E006D73636F7265652E646C6C0000000000FF2500200010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001001000000018000080000000000000000000000000000001000100000030000080000000000000000000000000000001000000000048000000584000005C02000000000000000000005C0234000000560053005F00560045005200530049004F004E005F0049004E0046004F0000000000BD04EFFE00000100000000000000000000000000000000003F000000000000000400000002000000000000000000000000000000440000000100560061007200460069006C00650049006E0066006F00000000002400040000005400720061006E0073006C006100740069006F006E00000000000000B004BC010000010053007400720069006E006700460069006C00650049006E0066006F0000009801000001003000300030003000300034006200300000002C0002000100460069006C0065004400650073006300720069007000740069006F006E000000000020000000300008000100460069006C006500560065007200730069006F006E000000000030002E0030002E0030002E003000000042001100010049006E007400650072006E0061006C004E0061006D0065000000530051004C005F00440061007400610062006100730065002E0064006C006C00000000002800020001004C006500670061006C0043006F0070007900720069006700680074000000200000004A00110001004F0072006900670069006E0061006C00460069006C0065006E0061006D0065000000530051004C005F00440061007400610062006100730065002E0064006C006C0000000000340008000100500072006F006400750063007400560065007200730069006F006E00000030002E0030002E0030002E003000000038000800010041007300730065006D0062006C0079002000560065007200730069006F006E00000030002E0030002E0030002E00300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000C000000843900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;


GO
ALTER ASSEMBLY [SQL_Database]
    DROP FILE ALL
    ADD FILE FROM 0x4D6963726F736F667420432F432B2B204D534620372E30300D0A1A445300000000020000020000001B000000880000000000000018000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF380000FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0BCA3101380000000010000000100000000000000F00FFFF04000000FFFF03000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA3101380000000010000000100000000000001000FFFF04000000FFFF0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31017D4AEF5801000000CDD19EC798E0E74986EAC0A0E3D3DFBE00000000000000000100000001000000000000000000000000000000DC51330100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF04000000FFFF030000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000BCA310138000000001000000010000000000000FFFFFFFF04000000FFFF030000000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BDEC1618FF5EAA104D87F76F49638334601400000000000000F402F1E0A22E4EA9D76B72B67AE691C82CB24FE6000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000F862513FC607D311905300C04FA302A1C4454B99E9E6D211903F00C04FA302A10B9D865A1166D311BD2A0000F80849BDEC1618FF5EAA104D87F76F49638334601400000000000000C627DF976155E9339C9266B2E871B0317A32753D00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006C010000000000006C010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FEEFFEEF010000004601000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F494E464F2E63730000633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F696E666F2E637300433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F56414C49444954592E637300633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F76616C69646974792E637300070000000000000050000000A0000000F3000000010000005100000000000000050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001BE23001AC00000085181EBD3BB4D2010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000004000000010000000A0000000000000051000000280000001BE23001316D95B95C000000010000005000000051000000650000000000000000000000F3000000280000001BE23001D0B31A225C000000A000000050000000F300000065000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000003A002A11000000000802000000000000830000000000000000000000010000060000000001000000005641545F564945535F56414C494449545900001600031104000000B40100008300000000000000010000000A0024115553797374656D001A0024115553797374656D2E446174612E53716C54797065730000001A0024115556494553436865636B56617453657276696365000000001A00201100000000010000110000000000000000696E7075740000001A002011010000000100001100000000000000006F757470757400002200201102000000010000110000000000000000696E7075745F636F756E7472790000002200201103000000010000110000000000000000696E7075745F6E756D6265720000000016000311400000007C010000270000004500000001000000260020110600000001000011000000000000000069436865636B56617453657276696365000000001E002011070000000100001100000000000000007661744D6F64656C00000000020006001600031140000000B00100000D0000006E0000000100000016002011080000000100001100000000000000006578000002000600020006004E000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004020000040000000C000000010003000406000120000000011301440180DC0181130268160101818A0182200182D0000200060036002A1100000000CC03000000000000E90000000000000000000000020000068300000001000000005641545F564945535F494E464F0000160003110C02000074030000E900000083000000010000001A00201100000000020000110000000000000000696E7075740000001A002011010000000200001100000000000000006F757470757400002200201102000000020000110000000000000000696E7075745F636F756E7472790000002200201103000000020000110000000000000000696E7075745F6E756D6265720000000016000311440200003C03000077000000CE00000001000000260020110600000002000011000000000000000069436865636B56617453657276696365000000001E002011070000000200001100000000000000007661744D6F64656C00000000020006001600031144020000700300001D0000004701000001000000160020110900000002000011000000000000000065780000020006000200060052000404C93FEAC6B359D649BC250902BBABB460000000004D0044003200000004020000040100000C000000010000060406000224000000011301450180F801812F026816010181AA01823502828B018386000002000600F2000000140100000000000001000100830000000000000015000000080100000000000009000080010000000A0000800F0000000B000080170000000D00008022000000EEEFFE80260000000E000080270000000F0000802F0000001000008034000000130000803D000000140000804500000019000080460000001A0000804E0000001B000080590000001D0000806B0000001F0000806E000000200000807000000021000080710000002200008078000000230000807B0000002500008080000000280000800500060009002E0009002A0009001E000000000009000A000D0019000D001B00090036000900320009000A000D0092000D0074000D00360009000A0009001D0009000A000D00190009000A000900170005000600F2000000680100008300000001000100E9000000080000001C0000005C0100000000000009000080010000000A0000800F0000000B000080170000000C00008022000000EEEFFE80260000000D000080270000000E000080320000000F0000803A0000001200008043000000130000804B000000160000804C0000001700008054000000180000805F0000001A00008068000000EEEFFE806C0000001B0000806D0000001C000080B10000001D000080B40000001F000080B500000020000080C000000021000080C100000023000080C400000024000080C600000025000080C700000026000080DE00000027000080E100000029000080E60000002A0000800500060009002E0009002C0009001E000000000009000A000D0035000D001B00090036000900320009000A000D0092000D0074000D002000000000000D000E0011005E000D000E000D000E0011001D000D000E0009000A0009001D0009000A000D002E0009000A000900170005000600F400000010000000A0000000000000000100000000000000100000000000000020000000380000005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF120000000140200005500000001000000210000000100000039000000010000000100000001000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C00000018000000240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001E002511000000000400000001005641545F564945535F56414C4944495459001600291100000000040000000100303630303030303100001A002511000000000C02000001005641545F564945535F494E464F0016002911000000000C020000010030363030303030320000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000FFFFFFFF1A092FF10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000942E31017D4AEF5801000000CDD19EC798E0E74986EAC0A0E3D3DFBEDA0000002F4C696E6B496E666F002F6E616D6573002F7372632F686561646572626C6F636B002F7372632F66696C65732F633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F696E666F2E6373002F7372632F66696C65732F633A5C75736572735C656D75696A735C736F757263655C7265706F735C7469732D76696573636865636B766174736572766963655C766965735F73716C5C7661745F766965735F76616C69646974792E637300050000000A000000010000002E02000000000000110000000700000000000000050000007C000000090000000A00000006000000220000000800000000000000DC5133010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000FFFFFFFF77093101010000000C00008E0D00055F0E000000600000003C0000002C000000B4000000000000000000000016000000190000000000EEC00000000000000000FFFF000000000000FFFFFFFF00000000FFFF0000000000000000000000000B00D003000000000000A40200000200000000000000000000000000000055736572446566696E656446756E6374696F6E730037314141414545380000002DBA2EF10100B5EA00000000830000000000000000007C0000000000000000000100B5EA83000000E90000000000000000007C000000000000000000020002000D01000000000100FFFFFFFF000000006C0100000802000000000000FFFFFFFF00000000FFFFFFFF01000200000002000000000053000000433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F56414C49444954592E637300433A5C55736572735C656D75696A735C536F757263655C5265706F735C5449532D56494553436865636B566174536572766963655C564945535F53514C5C5641545F564945535F494E464F2E6373000000FEEFFEEF010000000100000000010000000000000000000000FFFFFFFFFFFFFFFFFFFF0A00FFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000000000000F000000200000003E01000038000000EB010000380000000000000076010000AC0000005C0000005C0000002800000088060000440200002C0000006C00000003000000150000000600000016000000070000000B0000000C00000008000000090000000A0000000D0000000E0000000F000000100000001100000012000000140000001300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000170000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 AS N'SQL_Database.pdb';


GO
PRINT N'Update complete.';


GO