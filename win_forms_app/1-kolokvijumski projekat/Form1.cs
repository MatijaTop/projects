using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Window;
using System.Runtime.Remoting.Messaging;
using System.IO;
using System.Security.Cryptography;

namespace _1_kolokvijumski_projekat
{
    public partial class Form1 : Form
    {
        
        public Form1()
        {
            InitializeComponent();
        }
        bool textPromjena = false;


        private void btnOpen_Click(object sender, EventArgs e)
        {

            dlgOpen.Title = "Otvorite Fajl";
            dlgOpen.Filter = "Rich Text Format (*.rtf)|*.rtf|Text Files (*.txt)|*.txt";

            if (dlgOpen.ShowDialog() == DialogResult.Cancel)
            {
                return;
            }
            else
            {
                try
                {
                    if (Path.GetExtension(dlgOpen.FileName) == ".rtf")
                    {
                        RT.LoadFile(dlgOpen.FileName, RichTextBoxStreamType.RichText);
                    }
                    if (Path.GetExtension(dlgOpen.FileName) == ".txt")
                    {
                        RT.LoadFile(dlgOpen.FileName, RichTextBoxStreamType.PlainText);
                    }

                }
                catch (Exception ex) 
                {
                    
                    MessageBox.Show("greska pri otvaranju fajla " + ex.Message, "greska" ,MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
            

        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            dlgSave.Title = "Sacuvajte fajl";
            dlgSave.Filter = "Rich text file|*.rtf";
            dlgSave.DefaultExt = "*.rtf";
            dlgSave.FilterIndex = 1;

            if (dlgSave.ShowDialog() == DialogResult.Cancel)
            {
                return;
            }
            else
            {
                try
                {
                    RT.SaveFile(dlgOpen.FileName);
                    MessageBox.Show("Uspjesno ste snimili vas fajl");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("greska pri snimanju fajla" + ex.Message, "greska");
                }
            }
            
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
              
           Application.Exit();
                         
        }

        private void fontToolStripMenuItem_Click(object sender, EventArgs e)
        {
            dlgFont.Font = new Font(RT.SelectionFont.FontFamily, RT.SelectionFont.Size);

            if (dlgFont.ShowDialog() == DialogResult.Cancel) return;
            
            RT.SelectionFont = new Font(dlgFont.Font.FontFamily, dlgFont.Font.Size);
        }

        private void bojaToolStripMenuItem_Click(object sender, EventArgs e)
        {
            dlgBoja.Color = RT.SelectionColor;
            
            if (dlgBoja.ShowDialog() == DialogResult.Cancel) return;
            
            RT.SelectionColor = dlgBoja.Color;
        }

        private void fontBoldToolStripMenuItem_Click(object sender, EventArgs e)
        {
            
            FontStyle style = RT.SelectionFont.Style;
            if (RT.SelectionFont.Bold)
            {
                style = style & ~FontStyle.Bold;
                fontBoldToolStripMenuItem.Font = new Font(fontBoldToolStripMenuItem.Font, FontStyle.Regular);
            }
            else
            {
                style = style | FontStyle.Bold;
                fontBoldToolStripMenuItem.Font = new Font(fontBoldToolStripMenuItem.Font, FontStyle.Bold);
            }
            RT.SelectionFont = new Font(RT.SelectionFont, style);
            RT.Focus();

        }

        private void fontItalicToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FontStyle style = RT.SelectionFont.Style;
            if (RT.SelectionFont.Italic)
            {
                style = style & ~FontStyle.Italic;
                fontItalicToolStripMenuItem.Font = new Font(fontItalicToolStripMenuItem.Font, FontStyle.Regular);
            }
            else
            {
                style = style | FontStyle.Italic;
                fontItalicToolStripMenuItem.Font = new Font(fontItalicToolStripMenuItem.Font, FontStyle.Italic);
            }
            RT.SelectionFont = new Font(RT.SelectionFont, style);
            RT.Focus();
        }
        private void btnFindReplace_Click(object sender, EventArgs e)
        {
            
            if (string.IsNullOrEmpty(RT.Text))
            {
                MessageBox.Show("RichTextBox je prazan. Unesite tekst za pretragu i zamijenu.", "Greska");
                return;
            }

            if (string.IsNullOrEmpty(txtPronadji.Text))
            {
                MessageBox.Show("Unesite tekst koji zelite pronaci.", "Greska");
                return;
            }

            
            if (string.IsNullOrEmpty(txtZamijeni.Text))
            {
                MessageBox.Show("Unesite tekst kojim zelite zamijeniti pronadjeeni tekst.", "Greska");
                return;
            }

            
            RT.Rtf= RT.Rtf.Replace(txtPronadji.Text, txtZamijeni.Text);
        }


        private void RT_TextChanged(object sender, EventArgs e)
        {
            textPromjena = true;
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (textPromjena == true)
            {
                if (MessageBox.Show("Zatvori formu?", "Oprez", MessageBoxButtons.YesNo) == DialogResult.No)
                {
                    e.Cancel = true;
                }
            }
            else { e.Cancel = false; }
        }

        
    }
}
  