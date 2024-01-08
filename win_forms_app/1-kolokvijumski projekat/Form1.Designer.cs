namespace _1_kolokvijumski_projekat
{
    partial class Form1
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.btnOpen = new System.Windows.Forms.Button();
            this.btnFindReplace = new System.Windows.Forms.Button();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.txtPronadji = new System.Windows.Forms.TextBox();
            this.txtZamijeni = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.RT = new System.Windows.Forms.RichTextBox();
            this.mnuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.fontToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bojaToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.fontItalicToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.fontBoldToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.dlgOpen = new System.Windows.Forms.OpenFileDialog();
            this.dlgSave = new System.Windows.Forms.SaveFileDialog();
            this.dlgFont = new System.Windows.Forms.FontDialog();
            this.dlgBoja = new System.Windows.Forms.ColorDialog();
            this.mnuStrip.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnOpen
            // 
            this.btnOpen.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(128)))));
            this.btnOpen.Image = ((System.Drawing.Image)(resources.GetObject("btnOpen.Image")));
            this.btnOpen.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnOpen.Location = new System.Drawing.Point(23, 25);
            this.btnOpen.MaximumSize = new System.Drawing.Size(98, 68);
            this.btnOpen.MinimumSize = new System.Drawing.Size(98, 68);
            this.btnOpen.Name = "btnOpen";
            this.btnOpen.Size = new System.Drawing.Size(98, 68);
            this.btnOpen.TabIndex = 0;
            this.btnOpen.Text = "&Otvori fajl";
            this.btnOpen.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnOpen.UseVisualStyleBackColor = false;
            this.btnOpen.Click += new System.EventHandler(this.btnOpen_Click);
            // 
            // btnFindReplace
            // 
            this.btnFindReplace.BackColor = System.Drawing.Color.RoyalBlue;
            this.btnFindReplace.Image = ((System.Drawing.Image)(resources.GetObject("btnFindReplace.Image")));
            this.btnFindReplace.Location = new System.Drawing.Point(326, 25);
            this.btnFindReplace.MaximumSize = new System.Drawing.Size(133, 68);
            this.btnFindReplace.MinimumSize = new System.Drawing.Size(133, 68);
            this.btnFindReplace.Name = "btnFindReplace";
            this.btnFindReplace.Size = new System.Drawing.Size(133, 68);
            this.btnFindReplace.TabIndex = 1;
            this.btnFindReplace.Text = "Pronadji i zamijeni";
            this.btnFindReplace.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnFindReplace.UseVisualStyleBackColor = false;
            this.btnFindReplace.Click += new System.EventHandler(this.btnFindReplace_Click);
            // 
            // btnSave
            // 
            this.btnSave.BackColor = System.Drawing.Color.LimeGreen;
            this.btnSave.Image = ((System.Drawing.Image)(resources.GetObject("btnSave.Image")));
            this.btnSave.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnSave.Location = new System.Drawing.Point(498, 25);
            this.btnSave.MaximumSize = new System.Drawing.Size(98, 68);
            this.btnSave.MinimumSize = new System.Drawing.Size(98, 68);
            this.btnSave.Name = "btnSave";
            this.btnSave.Padding = new System.Windows.Forms.Padding(2);
            this.btnSave.Size = new System.Drawing.Size(98, 68);
            this.btnSave.TabIndex = 2;
            this.btnSave.Text = "&Sacuvaj fajl";
            this.btnSave.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnSave.UseVisualStyleBackColor = false;
            this.btnSave.Click += new System.EventHandler(this.btnSave_Click);
            // 
            // btnExit
            // 
            this.btnExit.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnExit.BackColor = System.Drawing.Color.Snow;
            this.btnExit.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnExit.Image = ((System.Drawing.Image)(resources.GetObject("btnExit.Image")));
            this.btnExit.ImageAlign = System.Drawing.ContentAlignment.TopCenter;
            this.btnExit.Location = new System.Drawing.Point(643, 25);
            this.btnExit.MaximumSize = new System.Drawing.Size(98, 68);
            this.btnExit.MinimumSize = new System.Drawing.Size(98, 68);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(98, 68);
            this.btnExit.TabIndex = 3;
            this.btnExit.Text = "Izadji";
            this.btnExit.TextAlign = System.Drawing.ContentAlignment.BottomCenter;
            this.btnExit.UseVisualStyleBackColor = false;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // txtPronadji
            // 
            this.txtPronadji.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.txtPronadji.Location = new System.Drawing.Point(220, 25);
            this.txtPronadji.MaximumSize = new System.Drawing.Size(100, 23);
            this.txtPronadji.MinimumSize = new System.Drawing.Size(100, 22);
            this.txtPronadji.Name = "txtPronadji";
            this.txtPronadji.Size = new System.Drawing.Size(100, 15);
            this.txtPronadji.TabIndex = 4;
            this.txtPronadji.TabStop = false;
            // 
            // txtZamijeni
            // 
            this.txtZamijeni.Location = new System.Drawing.Point(220, 71);
            this.txtZamijeni.MaximumSize = new System.Drawing.Size(100, 22);
            this.txtZamijeni.MinimumSize = new System.Drawing.Size(100, 22);
            this.txtZamijeni.Name = "txtZamijeni";
            this.txtZamijeni.Size = new System.Drawing.Size(100, 22);
            this.txtZamijeni.TabIndex = 5;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Aqua;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.label1.Location = new System.Drawing.Point(152, 25);
            this.label1.MinimumSize = new System.Drawing.Size(62, 22);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(62, 22);
            this.label1.TabIndex = 6;
            this.label1.Text = "Pronadji:";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Lime;
            this.label2.Location = new System.Drawing.Point(149, 71);
            this.label2.MinimumSize = new System.Drawing.Size(62, 22);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(62, 22);
            this.label2.TabIndex = 7;
            this.label2.Text = "Zamijeni:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // RT
            // 
            this.RT.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.RT.ContextMenuStrip = this.mnuStrip;
            this.RT.Location = new System.Drawing.Point(23, 129);
            this.RT.Name = "RT";
            this.RT.Size = new System.Drawing.Size(711, 350);
            this.RT.TabIndex = 8;
            this.RT.Text = "";
            this.RT.TextChanged += new System.EventHandler(this.RT_TextChanged);
            // 
            // mnuStrip
            // 
            this.mnuStrip.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.mnuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fontToolStripMenuItem,
            this.bojaToolStripMenuItem,
            this.fontItalicToolStripMenuItem,
            this.fontBoldToolStripMenuItem});
            this.mnuStrip.Name = "mnuStrip";
            this.mnuStrip.Size = new System.Drawing.Size(194, 100);
            // 
            // fontToolStripMenuItem
            // 
            this.fontToolStripMenuItem.Name = "fontToolStripMenuItem";
            this.fontToolStripMenuItem.Size = new System.Drawing.Size(193, 24);
            this.fontToolStripMenuItem.Text = "Font";
            this.fontToolStripMenuItem.Click += new System.EventHandler(this.fontToolStripMenuItem_Click);
            // 
            // bojaToolStripMenuItem
            // 
            this.bojaToolStripMenuItem.Name = "bojaToolStripMenuItem";
            this.bojaToolStripMenuItem.Size = new System.Drawing.Size(193, 24);
            this.bojaToolStripMenuItem.Text = "Boja";
            this.bojaToolStripMenuItem.Click += new System.EventHandler(this.bojaToolStripMenuItem_Click);
            // 
            // fontItalicToolStripMenuItem
            // 
            this.fontItalicToolStripMenuItem.Name = "fontItalicToolStripMenuItem";
            this.fontItalicToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.I)));
            this.fontItalicToolStripMenuItem.Size = new System.Drawing.Size(193, 24);
            this.fontItalicToolStripMenuItem.Text = "Font italic";
            this.fontItalicToolStripMenuItem.Click += new System.EventHandler(this.fontItalicToolStripMenuItem_Click);
            // 
            // fontBoldToolStripMenuItem
            // 
            this.fontBoldToolStripMenuItem.Name = "fontBoldToolStripMenuItem";
            this.fontBoldToolStripMenuItem.ShortcutKeys = ((System.Windows.Forms.Keys)((System.Windows.Forms.Keys.Control | System.Windows.Forms.Keys.B)));
            this.fontBoldToolStripMenuItem.Size = new System.Drawing.Size(193, 24);
            this.fontBoldToolStripMenuItem.Text = "Font bold";
            this.fontBoldToolStripMenuItem.Click += new System.EventHandler(this.fontBoldToolStripMenuItem_Click);
            // 
            // dlgOpen
            // 
            this.dlgOpen.FileName = "dlgOpen";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.CancelButton = this.btnExit;
            this.ClientSize = new System.Drawing.Size(762, 549);
            this.ControlBox = false;
            this.Controls.Add(this.RT);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.txtZamijeni);
            this.Controls.Add(this.txtPronadji);
            this.Controls.Add(this.btnExit);
            this.Controls.Add(this.btnSave);
            this.Controls.Add(this.btnFindReplace);
            this.Controls.Add(this.btnOpen);
            this.MinimumSize = new System.Drawing.Size(760, 567);
            this.Name = "Form1";
            this.Text = "IT27/21 Matija Topalovic";
            this.TopMost = true;
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            this.mnuStrip.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnOpen;
        private System.Windows.Forms.Button btnFindReplace;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.TextBox txtPronadji;
        private System.Windows.Forms.TextBox txtZamijeni;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.RichTextBox RT;
        private System.Windows.Forms.OpenFileDialog dlgOpen;
        private System.Windows.Forms.SaveFileDialog dlgSave;
        private System.Windows.Forms.ContextMenuStrip mnuStrip;
        private System.Windows.Forms.ToolStripMenuItem fontToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem bojaToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem fontItalicToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem fontBoldToolStripMenuItem;
        private System.Windows.Forms.FontDialog dlgFont;
        private System.Windows.Forms.ColorDialog dlgBoja;
    }
}

