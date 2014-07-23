// VIES VAT number validation
// Copyright (C) 2009-2014  Antonio Musarra (http://www.dontesta.it/blog)
// 
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

/*
 * Created by SharpDevelop.
 * User: musarra
 * Date: 22/07/2014
 * Time: 15.27
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Web.Services.Protocols;

namespace VIESCheckVatService
{
	/// <summary>
	/// Implementation class of VIESCheckVatService interface
	/// </summary>
	public class VIESCheckVatServiceSOAPImp:IVIESCheckVatService
	{
		/// <summary>
		/// Check the VAT number and return true or false
		/// </summary>
		/// <param name="countryCode">The country code (example: IT)</param>
		/// <param name="vatNumber">The VAT number (example: 0235469854)</param>
		/// <returns></returns>
		public bool checkVAT(string countryCode, string vatNumber)
		{
			return getDetailVAT(countryCode, vatNumber).Valid;
		}
		
		/// <summary>
		/// Check the VAT number and a more detail
		/// </summary>
		/// <param name="countryCode">The country code (example: IT)</param>
		/// <param name="vatNumber">The VAT number (example: 0235469854)</param>
		/// <returns></returns>
		public VIESVatModel getDetailVAT(string countryCode, string vatNumber)
		{
			bool valid;
			string name;
			string address;
			
			ec.europa.eu.checkVatService checkVatService = new ec.europa.eu.checkVatService();
			DateTime requestDate = checkVatService.checkVat(ref countryCode, ref vatNumber,out valid, out name,out address);
			
			VIESVatModel viesVAT = new VIESVatModel(countryCode, vatNumber, requestDate, valid, name, address);
			return viesVAT;
		}
	}
}
