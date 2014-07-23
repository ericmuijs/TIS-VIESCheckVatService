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
 * Time: 14.46
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
using System;

namespace VIESCheckVatService
{
	/// <summary>
	/// The VIES VAT data model returned by VIES Services.
	/// </summary>
	public class VIESVatModel
	{
		private String countryCode;
		private String vatNumber;
		private DateTime requestDate;
		private bool valid;
		private String name;
		private String address;
		
		/// <summary>
		/// 
		/// </summary>
		public string CountryCode {
			get { return countryCode; }
			set { countryCode = value; }
		}
		
		/// <summary>
		/// 
		/// </summary>
		public string VatNumber {
			get { return vatNumber; }
			set { vatNumber = value; }
		}
		
		/// <summary>
		/// 
		/// </summary>
		public DateTime RequestDate {
			get { return requestDate; }
			set { requestDate = value; }
		}
		
		/// <summary>
		/// 
		/// </summary>
		public bool Valid {
			get { return valid; }
			set { valid = value; }
		}
		
		/// <summary>
		/// 
		/// </summary>
		public string Name {
			get { return name; }
			set { name = value; }
		}
		
		/// <summary>
		/// 
		/// </summary>
		public string Address {
			get { return address; }
			set { address = value; }
		}
		
		/// <summary>
		/// Constructor of VIES VAT model
		/// </summary>
		/// <param name="countryCode">The country code (example: IT)</param>
		/// <param name="vatNumber">The VAT number (example: 0235469854)</param>
		/// <param name="requestDate"></param>
		/// <param name="valid">true or false</param>
		/// <param name="name">Name of the organization relate to VAT number</param>
		/// <param name="address">Address of the organization</param>
		public VIESVatModel(String countryCode, String vatNumber,
		                    DateTime requestDate, bool valid,
		                    String name, String address)
		{
			this.CountryCode = countryCode;
			this.VatNumber = vatNumber;
			this.RequestDate = requestDate;
			this.Name = name;
			this.Address = address;
			this.Valid = valid;
		}
	}
}
