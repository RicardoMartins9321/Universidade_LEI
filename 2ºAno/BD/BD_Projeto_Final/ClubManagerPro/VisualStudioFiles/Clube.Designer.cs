namespace VisualStudioFiles
{
    partial class Clube
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
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.MenuItemHome = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_Profile = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_Club = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_AthleteStats = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_LogOut = new System.Windows.Forms.ToolStripMenuItem();
            this.listBox_Clubs = new System.Windows.Forms.ListBox();
            this.BtnCancelChange = new System.Windows.Forms.Button();
            this.BtnConfirmChange = new System.Windows.Forms.Button();
            this.BtnAlterClub = new System.Windows.Forms.Button();
            this.textBox_NumOfAthletes = new System.Windows.Forms.TextBox();
            this.textBox_Location = new System.Windows.Forms.TextBox();
            this.textBox_Acronym = new System.Windows.Forms.TextBox();
            this.textBox_ClubName = new System.Windows.Forms.TextBox();
            this.maskedTextBox_FoundingDate = new System.Windows.Forms.MaskedTextBox();
            this.Label_FoundingDate = new System.Windows.Forms.Label();
            this.Label_NumAthletes = new System.Windows.Forms.Label();
            this.Label_Location = new System.Windows.Forms.Label();
            this.LabelClubAcronym = new System.Windows.Forms.Label();
            this.Label_ClubName = new System.Windows.Forms.Label();
            this.BtnDeleteClub = new System.Windows.Forms.Button();
            this.Btn_CreateClub = new System.Windows.Forms.Button();
            this.textBox_ClubSearch = new System.Windows.Forms.TextBox();
            this.LabelSearchBar = new System.Windows.Forms.Label();
            this.BtnSearchImage = new System.Windows.Forms.Button();
            this.BtnSaveImage = new System.Windows.Forms.Button();
            this.Btn_JoinClub = new System.Windows.Forms.Button();
            this.textBox_Resources = new System.Windows.Forms.TextBox();
            this.Label_Resources = new System.Windows.Forms.Label();
            this.pictureBox_Club = new System.Windows.Forms.PictureBox();
            this.Btn_QuitClub = new System.Windows.Forms.Button();
            this.menuStrip2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Club)).BeginInit();
            this.SuspendLayout();
            // 
            // menuStrip2
            // 
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemHome,
            this.MenuItem_Profile,
            this.MenuItem_Club,
            this.MenuItem_AthleteStats,
            this.MenuItem_LogOut});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(774, 28);
            this.menuStrip2.TabIndex = 7;
            this.menuStrip2.Text = "menuStrip2";
            // 
            // MenuItemHome
            // 
            this.MenuItemHome.Name = "MenuItemHome";
            this.MenuItemHome.Size = new System.Drawing.Size(64, 24);
            this.MenuItemHome.Text = "Home";
            this.MenuItemHome.Click += new System.EventHandler(this.MenuItemHome_Click);
            // 
            // MenuItem_Profile
            // 
            this.MenuItem_Profile.Name = "MenuItem_Profile";
            this.MenuItem_Profile.Size = new System.Drawing.Size(66, 24);
            this.MenuItem_Profile.Text = "Profile";
            this.MenuItem_Profile.Click += new System.EventHandler(this.MenuItem_Profile_Click);
            // 
            // MenuItem_Club
            // 
            this.MenuItem_Club.Name = "MenuItem_Club";
            this.MenuItem_Club.Size = new System.Drawing.Size(53, 24);
            this.MenuItem_Club.Text = "Club";
            this.MenuItem_Club.Click += new System.EventHandler(this.MenuItem_Club_Click);
            // 
            // MenuItem_AthleteStats
            // 
            this.MenuItem_AthleteStats.Name = "MenuItem_AthleteStats";
            this.MenuItem_AthleteStats.Size = new System.Drawing.Size(95, 24);
            this.MenuItem_AthleteStats.Text = "Estatísticas";
            this.MenuItem_AthleteStats.Click += new System.EventHandler(this.MenuItem_AthleteStats_Click);
            // 
            // MenuItem_LogOut
            // 
            this.MenuItem_LogOut.Name = "MenuItem_LogOut";
            this.MenuItem_LogOut.Size = new System.Drawing.Size(76, 24);
            this.MenuItem_LogOut.Text = "Log Out";
            this.MenuItem_LogOut.Click += new System.EventHandler(this.MenuItem_LogOut_Click);
            // 
            // listBox_Clubs
            // 
            this.listBox_Clubs.FormattingEnabled = true;
            this.listBox_Clubs.ItemHeight = 16;
            this.listBox_Clubs.Location = new System.Drawing.Point(23, 110);
            this.listBox_Clubs.Name = "listBox_Clubs";
            this.listBox_Clubs.Size = new System.Drawing.Size(208, 228);
            this.listBox_Clubs.TabIndex = 8;
            this.listBox_Clubs.SelectedIndexChanged += new System.EventHandler(this.listBoxClubs_SelectedIndexChanged);
            // 
            // BtnCancelChange
            // 
            this.BtnCancelChange.Location = new System.Drawing.Point(635, 345);
            this.BtnCancelChange.Name = "BtnCancelChange";
            this.BtnCancelChange.Size = new System.Drawing.Size(113, 49);
            this.BtnCancelChange.TabIndex = 63;
            this.BtnCancelChange.Text = "Cancelar";
            this.BtnCancelChange.UseVisualStyleBackColor = true;
            this.BtnCancelChange.Click += new System.EventHandler(this.BtnCancelChange_Click);
            // 
            // BtnConfirmChange
            // 
            this.BtnConfirmChange.BackColor = System.Drawing.Color.LimeGreen;
            this.BtnConfirmChange.Location = new System.Drawing.Point(499, 345);
            this.BtnConfirmChange.Name = "BtnConfirmChange";
            this.BtnConfirmChange.Size = new System.Drawing.Size(113, 49);
            this.BtnConfirmChange.TabIndex = 62;
            this.BtnConfirmChange.Text = "Confirmar";
            this.BtnConfirmChange.UseVisualStyleBackColor = false;
            this.BtnConfirmChange.Click += new System.EventHandler(this.BtnConfirmChange_Click);
            // 
            // BtnAlterClub
            // 
            this.BtnAlterClub.BackColor = System.Drawing.Color.Gold;
            this.BtnAlterClub.Location = new System.Drawing.Point(635, 400);
            this.BtnAlterClub.Name = "BtnAlterClub";
            this.BtnAlterClub.Size = new System.Drawing.Size(113, 49);
            this.BtnAlterClub.TabIndex = 61;
            this.BtnAlterClub.Text = "Alterar";
            this.BtnAlterClub.UseVisualStyleBackColor = false;
            this.BtnAlterClub.Click += new System.EventHandler(this.BtnAlterClub_Click);
            // 
            // textBox_NumOfAthletes
            // 
            this.textBox_NumOfAthletes.Location = new System.Drawing.Point(284, 341);
            this.textBox_NumOfAthletes.Name = "textBox_NumOfAthletes";
            this.textBox_NumOfAthletes.Size = new System.Drawing.Size(180, 22);
            this.textBox_NumOfAthletes.TabIndex = 58;
            // 
            // textBox_Location
            // 
            this.textBox_Location.Location = new System.Drawing.Point(284, 206);
            this.textBox_Location.Name = "textBox_Location";
            this.textBox_Location.Size = new System.Drawing.Size(180, 22);
            this.textBox_Location.TabIndex = 57;
            // 
            // textBox_Acronym
            // 
            this.textBox_Acronym.Location = new System.Drawing.Point(284, 140);
            this.textBox_Acronym.Name = "textBox_Acronym";
            this.textBox_Acronym.Size = new System.Drawing.Size(180, 22);
            this.textBox_Acronym.TabIndex = 55;
            // 
            // textBox_ClubName
            // 
            this.textBox_ClubName.Location = new System.Drawing.Point(284, 66);
            this.textBox_ClubName.Name = "textBox_ClubName";
            this.textBox_ClubName.Size = new System.Drawing.Size(180, 22);
            this.textBox_ClubName.TabIndex = 54;
            // 
            // maskedTextBox_FoundingDate
            // 
            this.maskedTextBox_FoundingDate.Location = new System.Drawing.Point(284, 275);
            this.maskedTextBox_FoundingDate.Name = "maskedTextBox_FoundingDate";
            this.maskedTextBox_FoundingDate.Size = new System.Drawing.Size(180, 22);
            this.maskedTextBox_FoundingDate.TabIndex = 53;
            // 
            // Label_FoundingDate
            // 
            this.Label_FoundingDate.AutoSize = true;
            this.Label_FoundingDate.Location = new System.Drawing.Point(281, 256);
            this.Label_FoundingDate.Name = "Label_FoundingDate";
            this.Label_FoundingDate.Size = new System.Drawing.Size(101, 16);
            this.Label_FoundingDate.TabIndex = 52;
            this.Label_FoundingDate.Text = "Founding Date: ";
            // 
            // Label_NumAthletes
            // 
            this.Label_NumAthletes.AutoSize = true;
            this.Label_NumAthletes.Location = new System.Drawing.Point(281, 322);
            this.Label_NumAthletes.Name = "Label_NumAthletes";
            this.Label_NumAthletes.Size = new System.Drawing.Size(123, 16);
            this.Label_NumAthletes.TabIndex = 51;
            this.Label_NumAthletes.Text = "Number of Athletes ";
            // 
            // Label_Location
            // 
            this.Label_Location.AutoSize = true;
            this.Label_Location.Location = new System.Drawing.Point(281, 187);
            this.Label_Location.Name = "Label_Location";
            this.Label_Location.Size = new System.Drawing.Size(64, 16);
            this.Label_Location.TabIndex = 50;
            this.Label_Location.Text = "Location: ";
            // 
            // LabelClubAcronym
            // 
            this.LabelClubAcronym.AutoSize = true;
            this.LabelClubAcronym.Location = new System.Drawing.Point(284, 121);
            this.LabelClubAcronym.Name = "LabelClubAcronym";
            this.LabelClubAcronym.Size = new System.Drawing.Size(96, 16);
            this.LabelClubAcronym.TabIndex = 49;
            this.LabelClubAcronym.Text = "Club Acronym: ";
            // 
            // Label_ClubName
            // 
            this.Label_ClubName.AutoSize = true;
            this.Label_ClubName.Location = new System.Drawing.Point(283, 47);
            this.Label_ClubName.Name = "Label_ClubName";
            this.Label_ClubName.Size = new System.Drawing.Size(77, 16);
            this.Label_ClubName.TabIndex = 48;
            this.Label_ClubName.Text = "Club name: ";
            // 
            // BtnDeleteClub
            // 
            this.BtnDeleteClub.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(50)))), ((int)(((byte)(0)))));
            this.BtnDeleteClub.Location = new System.Drawing.Point(499, 400);
            this.BtnDeleteClub.Name = "BtnDeleteClub";
            this.BtnDeleteClub.Size = new System.Drawing.Size(113, 49);
            this.BtnDeleteClub.TabIndex = 72;
            this.BtnDeleteClub.Text = "Delete";
            this.BtnDeleteClub.UseVisualStyleBackColor = false;
            this.BtnDeleteClub.Click += new System.EventHandler(this.BtnDeleteClub_Click);
            // 
            // Btn_CreateClub
            // 
            this.Btn_CreateClub.BackColor = System.Drawing.Color.DeepSkyBlue;
            this.Btn_CreateClub.Location = new System.Drawing.Point(153, 400);
            this.Btn_CreateClub.Name = "Btn_CreateClub";
            this.Btn_CreateClub.Size = new System.Drawing.Size(113, 49);
            this.Btn_CreateClub.TabIndex = 73;
            this.Btn_CreateClub.Text = "Criar Clube";
            this.Btn_CreateClub.UseVisualStyleBackColor = false;
            this.Btn_CreateClub.Click += new System.EventHandler(this.BtnCreateClub_Click);
            // 
            // textBox_ClubSearch
            // 
            this.textBox_ClubSearch.Location = new System.Drawing.Point(23, 66);
            this.textBox_ClubSearch.Name = "textBox_ClubSearch";
            this.textBox_ClubSearch.Size = new System.Drawing.Size(208, 22);
            this.textBox_ClubSearch.TabIndex = 74;
            this.textBox_ClubSearch.TextChanged += new System.EventHandler(this.textBox_Search_TextChanged);
            // 
            // LabelSearchBar
            // 
            this.LabelSearchBar.AutoSize = true;
            this.LabelSearchBar.Location = new System.Drawing.Point(20, 47);
            this.LabelSearchBar.Name = "LabelSearchBar";
            this.LabelSearchBar.Size = new System.Drawing.Size(74, 16);
            this.LabelSearchBar.TabIndex = 75;
            this.LabelSearchBar.Text = "Search Bar";
            // 
            // BtnSearchImage
            // 
            this.BtnSearchImage.Location = new System.Drawing.Point(532, 244);
            this.BtnSearchImage.Name = "BtnSearchImage";
            this.BtnSearchImage.Size = new System.Drawing.Size(97, 39);
            this.BtnSearchImage.TabIndex = 78;
            this.BtnSearchImage.Text = "Find Image";
            this.BtnSearchImage.UseVisualStyleBackColor = true;
            this.BtnSearchImage.Click += new System.EventHandler(this.BtnSearchImage_Click);
            // 
            // BtnSaveImage
            // 
            this.BtnSaveImage.Location = new System.Drawing.Point(635, 244);
            this.BtnSaveImage.Name = "BtnSaveImage";
            this.BtnSaveImage.Size = new System.Drawing.Size(97, 39);
            this.BtnSaveImage.TabIndex = 77;
            this.BtnSaveImage.Text = "Save Image";
            this.BtnSaveImage.UseVisualStyleBackColor = true;
            this.BtnSaveImage.Click += new System.EventHandler(this.BtnSaveImage_Click);
            // 
            // Btn_JoinClub
            // 
            this.Btn_JoinClub.BackColor = System.Drawing.Color.GreenYellow;
            this.Btn_JoinClub.Location = new System.Drawing.Point(23, 400);
            this.Btn_JoinClub.Name = "Btn_JoinClub";
            this.Btn_JoinClub.Size = new System.Drawing.Size(113, 49);
            this.Btn_JoinClub.TabIndex = 79;
            this.Btn_JoinClub.Text = "Ingressar Clube";
            this.Btn_JoinClub.UseVisualStyleBackColor = false;
            this.Btn_JoinClub.Click += new System.EventHandler(this.BtnJoinClub_Click);
            // 
            // textBox_Resources
            // 
            this.textBox_Resources.Location = new System.Drawing.Point(284, 402);
            this.textBox_Resources.Name = "textBox_Resources";
            this.textBox_Resources.Size = new System.Drawing.Size(180, 22);
            this.textBox_Resources.TabIndex = 81;
            // 
            // Label_Resources
            // 
            this.Label_Resources.AutoSize = true;
            this.Label_Resources.Location = new System.Drawing.Point(284, 385);
            this.Label_Resources.Name = "Label_Resources";
            this.Label_Resources.Size = new System.Drawing.Size(76, 16);
            this.Label_Resources.TabIndex = 80;
            this.Label_Resources.Text = "Resources ";
            // 
            // pictureBox_Club
            // 
            this.pictureBox_Club.Image = global::VisualStudioFiles.Properties.Resources.blank_profile_picture_2;
            this.pictureBox_Club.InitialImage = global::VisualStudioFiles.Properties.Resources.blank_profile_picture_2;
            this.pictureBox_Club.Location = new System.Drawing.Point(532, 47);
            this.pictureBox_Club.Name = "pictureBox_Club";
            this.pictureBox_Club.Size = new System.Drawing.Size(200, 181);
            this.pictureBox_Club.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox_Club.TabIndex = 76;
            this.pictureBox_Club.TabStop = false;
            // 
            // Btn_QuitClub
            // 
            this.Btn_QuitClub.BackColor = System.Drawing.Color.Red;
            this.Btn_QuitClub.Location = new System.Drawing.Point(23, 345);
            this.Btn_QuitClub.Name = "Btn_QuitClub";
            this.Btn_QuitClub.Size = new System.Drawing.Size(113, 49);
            this.Btn_QuitClub.TabIndex = 82;
            this.Btn_QuitClub.Text = "Sair Clube";
            this.Btn_QuitClub.UseVisualStyleBackColor = false;
            this.Btn_QuitClub.Click += new System.EventHandler(this.Btn_QuitClub_Click);
            // 
            // Clube
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(774, 450);
            this.Controls.Add(this.Btn_QuitClub);
            this.Controls.Add(this.textBox_Resources);
            this.Controls.Add(this.Label_Resources);
            this.Controls.Add(this.Btn_JoinClub);
            this.Controls.Add(this.BtnSearchImage);
            this.Controls.Add(this.BtnSaveImage);
            this.Controls.Add(this.pictureBox_Club);
            this.Controls.Add(this.LabelSearchBar);
            this.Controls.Add(this.textBox_ClubSearch);
            this.Controls.Add(this.Btn_CreateClub);
            this.Controls.Add(this.BtnDeleteClub);
            this.Controls.Add(this.BtnCancelChange);
            this.Controls.Add(this.BtnConfirmChange);
            this.Controls.Add(this.BtnAlterClub);
            this.Controls.Add(this.textBox_NumOfAthletes);
            this.Controls.Add(this.textBox_Location);
            this.Controls.Add(this.textBox_Acronym);
            this.Controls.Add(this.textBox_ClubName);
            this.Controls.Add(this.maskedTextBox_FoundingDate);
            this.Controls.Add(this.Label_FoundingDate);
            this.Controls.Add(this.Label_NumAthletes);
            this.Controls.Add(this.Label_Location);
            this.Controls.Add(this.LabelClubAcronym);
            this.Controls.Add(this.Label_ClubName);
            this.Controls.Add(this.listBox_Clubs);
            this.Controls.Add(this.menuStrip2);
            this.Name = "Clube";
            this.Text = "Clube";
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox_Club)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem MenuItemHome;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Profile;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Club;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_AthleteStats;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_LogOut;
        private System.Windows.Forms.ListBox listBox_Clubs;
        private System.Windows.Forms.Button BtnCancelChange;
        private System.Windows.Forms.Button BtnConfirmChange;
        private System.Windows.Forms.Button BtnAlterClub;
        private System.Windows.Forms.TextBox textBox_NumOfAthletes;
        private System.Windows.Forms.TextBox textBox_Location;
        private System.Windows.Forms.TextBox textBox_Acronym;
        private System.Windows.Forms.TextBox textBox_ClubName;
        private System.Windows.Forms.MaskedTextBox maskedTextBox_FoundingDate;
        private System.Windows.Forms.Label Label_FoundingDate;
        private System.Windows.Forms.Label Label_NumAthletes;
        private System.Windows.Forms.Label Label_Location;
        private System.Windows.Forms.Label LabelClubAcronym;
        private System.Windows.Forms.Label Label_ClubName;
        private System.Windows.Forms.Button BtnDeleteClub;
        private System.Windows.Forms.Button Btn_CreateClub;
        private System.Windows.Forms.TextBox textBox_ClubSearch;
        private System.Windows.Forms.Label LabelSearchBar;
        private System.Windows.Forms.Button BtnSearchImage;
        private System.Windows.Forms.Button BtnSaveImage;
        private System.Windows.Forms.PictureBox pictureBox_Club;
        private System.Windows.Forms.Button Btn_JoinClub;
        private System.Windows.Forms.TextBox textBox_Resources;
        private System.Windows.Forms.Label Label_Resources;
        private System.Windows.Forms.Button Btn_QuitClub;
    }
}