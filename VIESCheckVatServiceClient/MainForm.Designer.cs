using System;
using System.Collections.Generic;
using System.Drawing;
using System.Windows.Forms;
using VIESCheckVatService;

/*
 * Created by SharpDevelop.
 * User: musarra
 * Date: 22/07/2014
 * Time: 16.10
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 */
namespace VIESCheckVatServiceClient
{
	partial class MainForm
	{
		/// <summary>
		/// Designer variable used to keep track of non-visual components.
		/// </summary>
		private System.ComponentModel.IContainer components = null;
		
		/// <summary>
		/// Disposes resources used by the form.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing) {
				if (components != null) {
					components.Dispose();
				}
			}
			base.Dispose(disposing);
		}
		
		/// <summary>
		/// This method is required for Windows Forms designer support.
		/// Do not change the method contents inside the source code editor. The Forms designer might
		/// not be able to load this method if it was changed manually.
		/// </summary>
		private void InitializeComponent()
		{
			this.comboMemberState = new System.Windows.Forms.ComboBox();
			this.textBoxVatNumber = new System.Windows.Forms.TextBox();
			this.btnVerifyVAT = new System.Windows.Forms.Button();
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.label3 = new System.Windows.Forms.Label();
			this.treeViewResult = new System.Windows.Forms.TreeView();
			this.label4 = new System.Windows.Forms.Label();
			this.label5 = new System.Windows.Forms.Label();
			this.SuspendLayout();
			// 
			// comboMemberState
			// 
			this.comboMemberState.FormattingEnabled = true;
			this.comboMemberState.Items.AddRange(new object[] {
									"AT-Austria",
									"BE-Belgium",
									"BG-Bulgaria",
									"CY-Cyprus",
									"CZ-Czech Republic",
									"DE-Germany",
									"DK-Denmark",
									"EE-Estonia",
									"EL-Greece",
									"ES-Spain",
									"FI-Finland",
									"FR-France ",
									"GB-United Kingdom",
									"HR-Croatia",
									"HU-Hungary",
									"IE-Ireland",
									"IT-Italy",
									"LT-Lithuania",
									"LU-Luxembourg",
									"LV-Latvia",
									"MT-Malta",
									"NL-The Netherlands",
									"PL-Poland",
									"PT-Portugal",
									"RO-Romania",
									"SE-Sweden",
									"SI-Slovenia",
									"SK-Slovakia"});
			this.comboMemberState.Location = new System.Drawing.Point(15, 63);
			this.comboMemberState.Name = "comboMemberState";
			this.comboMemberState.Size = new System.Drawing.Size(153, 21);
			this.comboMemberState.TabIndex = 0;
			// 
			// textBoxVatNumber
			// 
			this.textBoxVatNumber.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.RecentlyUsedList;
			this.textBoxVatNumber.Location = new System.Drawing.Point(174, 64);
			this.textBoxVatNumber.MaxLength = 11;
			this.textBoxVatNumber.Name = "textBoxVatNumber";
			this.textBoxVatNumber.Size = new System.Drawing.Size(122, 20);
			this.textBoxVatNumber.TabIndex = 1;
			// 
			// btnVerifyVAT
			// 
			this.btnVerifyVAT.Location = new System.Drawing.Point(302, 62);
			this.btnVerifyVAT.Name = "btnVerifyVAT";
			this.btnVerifyVAT.Size = new System.Drawing.Size(75, 23);
			this.btnVerifyVAT.TabIndex = 2;
			this.btnVerifyVAT.Text = "Verify";
			this.btnVerifyVAT.UseVisualStyleBackColor = true;
			this.btnVerifyVAT.Click += new System.EventHandler(this.BtnVerifyVATClick);
			// 
			// label1
			// 
			this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 14F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
			this.label1.Location = new System.Drawing.Point(12, 9);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(281, 23);
			this.label1.TabIndex = 3;
			this.label1.Text = "Client for EU VAT Services";
			this.label1.Click += new System.EventHandler(this.Label1Click);
			// 
			// label2
			// 
			this.label2.Location = new System.Drawing.Point(15, 46);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(100, 11);
			this.label2.TabIndex = 4;
			this.label2.Text = "Member State";
			// 
			// label3
			// 
			this.label3.Location = new System.Drawing.Point(174, 46);
			this.label3.Name = "label3";
			this.label3.Size = new System.Drawing.Size(100, 15);
			this.label3.TabIndex = 5;
			this.label3.Text = "VAT Number";
			// 
			// treeViewResult
			// 
			this.treeViewResult.Location = new System.Drawing.Point(15, 114);
			this.treeViewResult.Name = "treeViewResult";
			this.treeViewResult.Size = new System.Drawing.Size(362, 123);
			this.treeViewResult.TabIndex = 6;
			// 
			// label4
			// 
			this.label4.Location = new System.Drawing.Point(15, 97);
			this.label4.Name = "label4";
			this.label4.Size = new System.Drawing.Size(100, 14);
			this.label4.TabIndex = 7;
			this.label4.Text = "Result of check";
			// 
			// label5
			// 
			this.label5.Location = new System.Drawing.Point(65, 250);
			this.label5.Name = "label5";
			this.label5.Size = new System.Drawing.Size(257, 16);
			this.label5.TabIndex = 8;
			this.label5.Text = "Antonio Musarra\'s Blog © 2014. All Rights Reserved.";
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(392, 275);
			this.Controls.Add(this.label5);
			this.Controls.Add(this.label4);
			this.Controls.Add(this.treeViewResult);
			this.Controls.Add(this.label3);
			this.Controls.Add(this.label2);
			this.Controls.Add(this.label1);
			this.Controls.Add(this.btnVerifyVAT);
			this.Controls.Add(this.textBoxVatNumber);
			this.Controls.Add(this.comboMemberState);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
			this.MaximizeBox = false;
			this.Name = "MainForm";
			this.ShowIcon = false;
			this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
			this.Text = "Client for EU VAT Service";
			this.ResumeLayout(false);
			this.PerformLayout();
		}
		private System.Windows.Forms.Label label5;
		private System.Windows.Forms.Label label4;
		private System.Windows.Forms.TreeView treeViewResult;
		private System.Windows.Forms.Label label3;
		private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Label label1;
		private System.Windows.Forms.Button btnVerifyVAT;
		private System.Windows.Forms.TextBox textBoxVatNumber;
		private System.Windows.Forms.ComboBox comboMemberState;
		
		void BtnVerifyVATClick(object sender, System.EventArgs e)
		{
			try {
				if(comboMemberState.SelectedItem != null && textBoxVatNumber.Text.Length >= 11) {
					btnVerifyVAT.Enabled = false;
					this.Cursor = Cursors.WaitCursor;
					
					VIESCheckVatService.IVIESCheckVatService iCheckVatService =
						VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);
					VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(comboMemberState.SelectedItem.ToString().Split('-')[0] , textBoxVatNumber.Text);
					
					treeViewResult.Nodes.Clear();
					TreeNode rootResultsNode;
					rootResultsNode = treeViewResult.Nodes.Add("Results from EU VIES VAT Services");
					rootResultsNode.Nodes.Add("Result: " + vatModel.Valid);
					
					if(vatModel.Valid) {
						treeViewResult.Nodes[0].FirstNode.ForeColor = Color.Green;
						rootResultsNode.Nodes.Add("County Code: " + vatModel.CountryCode);
						rootResultsNode.Nodes.Add("VAT Number: " + vatModel.VatNumber);
						rootResultsNode.Nodes.Add("Request Date: " + vatModel.RequestDate);
						rootResultsNode.Nodes.Add("Org. Name: " + vatModel.Name);
						rootResultsNode.Nodes.Add("Org. Address: " + vatModel.Address);
					} else {
						rootResultsNode.FirstNode.ForeColor = Color.Red;
					}
					
					rootResultsNode.ExpandAll();
				} else {
					MessageBox.Show(
						"The two required parameters are required.",
						"Required parameters",
						MessageBoxButtons.OK, MessageBoxIcon.Warning);
					}
			} catch (Exception ex) {
				MessageBox.Show(
					"The service has responded with an error. " + ex.Message,
					"Service error occurred",
					MessageBoxButtons.OK, MessageBoxIcon.Error);
			} finally {
				btnVerifyVAT.Enabled = true;
				this.Cursor = Cursors.Default;
			}
		}
	}
}
