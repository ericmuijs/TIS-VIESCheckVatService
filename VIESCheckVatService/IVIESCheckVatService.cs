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
 * Time: 14.16
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;
using System.Collections.Generic;

namespace VIESCheckVatService
{
	/// <summary>
	/// Interface of the European Commission VIES Services
	/// </summary>
	public interface IVIESCheckVatService
	{
		/// <summary>
		/// Check the VAT number and return true or false
		/// </summary>
		/// <param name="countryCode">The country code (example: IT)</param>
		/// <param name="vatNumber">The VAT number (example: 0235469854)</param>
		/// <returns>true if check of the VAT number is OK, false otherwise</returns>
		bool checkVAT(String countryCode, String vatNumber);
		
		/// <summary>
		/// Check the VAT number and a more detail
		/// </summary>
		/// <param name="countryCode">The country code (example: IT)</param>
		/// <param name="vatNumber">The VAT number (example: 0235469854)</param>
		/// <returns>Detail of the VAT model (see @VVIESVatModel)</returns>
		VIESVatModel getDetailVAT(String countryCode, String vatNumber);
	}
}