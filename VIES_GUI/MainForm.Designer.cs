namespace VIES_GUI
{
    partial class MainForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tableLayoutPanel = new System.Windows.Forms.TableLayoutPanel();
            this.button_Verify = new System.Windows.Forms.Button();
            this.dataGridView = new System.Windows.Forms.DataGridView();
            this.VAT_Number = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Valid = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.Company_Name = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Company_Address = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.RequestDate = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Message = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tableLayoutPanel.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // tableLayoutPanel
            // 
            this.tableLayoutPanel.ColumnCount = 2;
            this.tableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 8.518086F));
            this.tableLayoutPanel.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 91.48191F));
            this.tableLayoutPanel.Controls.Add(this.button_Verify, 1, 1);
            this.tableLayoutPanel.Controls.Add(this.dataGridView, 1, 0);
            this.tableLayoutPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel.Name = "tableLayoutPanel";
            this.tableLayoutPanel.RowCount = 2;
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 93.0192F));
            this.tableLayoutPanel.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 6.980803F));
            this.tableLayoutPanel.Size = new System.Drawing.Size(857, 573);
            this.tableLayoutPanel.TabIndex = 0;
            // 
            // button_Verify
            // 
            this.button_Verify.Location = new System.Drawing.Point(76, 535);
            this.button_Verify.Name = "button_Verify";
            this.button_Verify.Size = new System.Drawing.Size(122, 35);
            this.button_Verify.TabIndex = 1;
            this.button_Verify.Text = "Verify";
            this.button_Verify.UseVisualStyleBackColor = true;
            this.button_Verify.Click += new System.EventHandler(this.button_Verify_Click);
            // 
            // dataGridView
            // 
            this.dataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.VAT_Number,
            this.Valid,
            this.Company_Name,
            this.Company_Address,
            this.RequestDate,
            this.Message});
            this.dataGridView.Dock = System.Windows.Forms.DockStyle.Fill;
            this.dataGridView.Location = new System.Drawing.Point(76, 3);
            this.dataGridView.Name = "dataGridView";
            this.dataGridView.Size = new System.Drawing.Size(778, 526);
            this.dataGridView.TabIndex = 2;
            // 
            // VAT_Number
            // 
            this.VAT_Number.HeaderText = "VAT Number";
            this.VAT_Number.Name = "VAT_Number";
            // 
            // Valid
            // 
            this.Valid.HeaderText = "Valid";
            this.Valid.Name = "Valid";
            this.Valid.ReadOnly = true;
            this.Valid.Width = 60;
            // 
            // Company_Name
            // 
            this.Company_Name.HeaderText = "Company Name";
            this.Company_Name.Name = "Company_Name";
            this.Company_Name.ReadOnly = true;
            this.Company_Name.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            // 
            // Company_Address
            // 
            this.Company_Address.HeaderText = "Company Address";
            this.Company_Address.Name = "Company_Address";
            this.Company_Address.ReadOnly = true;
            this.Company_Address.Width = 250;
            // 
            // RequestDate
            // 
            this.RequestDate.HeaderText = "Request Date";
            this.RequestDate.Name = "RequestDate";
            this.RequestDate.ReadOnly = true;
            // 
            // Message
            // 
            this.Message.HeaderText = "Message";
            this.Message.Name = "Message";
            this.Message.ReadOnly = true;
            // 
            // MainForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(857, 573);
            this.Controls.Add(this.tableLayoutPanel);
            this.Name = "MainForm";
            this.Text = "VIES Interface";
            this.tableLayoutPanel.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel;
        private System.Windows.Forms.Button button_Verify;
        private System.Windows.Forms.DataGridView dataGridView;
        private System.Windows.Forms.DataGridViewTextBoxColumn VAT_Number;
        private System.Windows.Forms.DataGridViewCheckBoxColumn Valid;
        private System.Windows.Forms.DataGridViewTextBoxColumn Company_Name;
        private System.Windows.Forms.DataGridViewTextBoxColumn Company_Address;
        private System.Windows.Forms.DataGridViewTextBoxColumn RequestDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn Message;
    }
}

