using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using VIESCheckVatService;

namespace VIES_GUI
{
    public partial class MainForm : Form
    {
        public MainForm()
        {
            InitializeComponent();
            dataGridView.ClipboardCopyMode = DataGridViewClipboardCopyMode.EnableWithoutHeaderText;

            string input_paste = Clipboard.GetText();

            string[] input_array = input_paste.Split(new string[] { "\n", "\r\n" }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string input_VAT_number in input_array)
            {
                Debug.Print(input_VAT_number);
                Console.WriteLine(input_VAT_number);
                dataGridView.Rows.Add(input_VAT_number);
            }

            //CopyPasteButton_Click(null, null);

        }
       
        private void button_Verify_Click(object sender, EventArgs e)
        {
            
            foreach (DataGridViewRow row in dataGridView.Rows)
            {            
                if (row.Cells[0].Value == null)
                {
                    continue;
                }
                try
                {
                    
                    string input = row.Cells[0].Value.ToString();

                    if (input.Length >= 4)
                    {
                        string input_country = input.Substring(0, 2);
                        string input_number = input.Substring(2);

                        VIESCheckVatService.IVIESCheckVatService iCheckVatService = VIESCheckVatService.VIESCheckServiceFactory.getService(ServiceType.SOAP);
                        VIESCheckVatService.VIESVatModel vatModel = iCheckVatService.getDetailVAT(input_country, input_number);
                        O
                        row.Cells[1].Value = vatModel.Valid;
                        row.Cells[2].Value = vatModel.Name;
                        row.Cells[3].Value = vatModel.Address;
                        row.Cells[4].Value = vatModel.RequestDate;
                        row.Cells[5].Value = "Success";
                    }
                }

                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                    row.Cells[5].Value = ex.Message;
                }


            }
        }
    }
}
