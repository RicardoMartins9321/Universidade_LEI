namespace VisualStudioFiles
{
    partial class Home
    {
        /// <summary>
        /// Variável de designer necessária.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Limpar os recursos que estão sendo usados.
        /// </summary>
        /// <param name="disposing">true se for necessário descartar os recursos gerenciados; caso contrário, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Código gerado pelo Windows Form Designer

        /// <summary>
        /// Método necessário para suporte ao Designer - não modifique 
        /// o conteúdo deste método com o editor de código.
        /// </summary>
        private void InitializeComponent()
        {
            this.ID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.FirstName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.LastName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.listViewUsers = new System.Windows.Forms.ListView();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.MenuItemHome = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_Profile = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_Club = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_AthleteStats = new System.Windows.Forms.ToolStripMenuItem();
            this.logOutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.Users = new System.Windows.Forms.TabPage();
            this.Clubs = new System.Windows.Forms.TabPage();
            this.listViewClubs = new System.Windows.Forms.ListView();
            this.columnHeader1 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader2 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader3 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Competitions = new System.Windows.Forms.TabPage();
            this.listViewCompetitions = new System.Windows.Forms.ListView();
            this.columnHeader4 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader5 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader6 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Trainings = new System.Windows.Forms.TabPage();
            this.listViewTrainings = new System.Windows.Forms.ListView();
            this.columnHeader7 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader8 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader9 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.Permissions = new System.Windows.Forms.TabPage();
            this.listViewPermissions = new System.Windows.Forms.ListView();
            this.columnHeader10 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader11 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.columnHeader12 = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.menuStrip2.SuspendLayout();
            this.tabControl1.SuspendLayout();
            this.Users.SuspendLayout();
            this.Clubs.SuspendLayout();
            this.Competitions.SuspendLayout();
            this.Trainings.SuspendLayout();
            this.Permissions.SuspendLayout();
            this.SuspendLayout();
            // 
            // ID
            // 
            this.ID.DisplayIndex = 0;
            // 
            // FirstName
            // 
            this.FirstName.DisplayIndex = 1;
            // 
            // LastName
            // 
            this.LastName.DisplayIndex = 2;
            // 
            // listViewUsers
            // 
            this.listViewUsers.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.FirstName,
            this.LastName,
            this.ID});
            this.listViewUsers.FullRowSelect = true;
            this.listViewUsers.GridLines = true;
            this.listViewUsers.HideSelection = false;
            this.listViewUsers.Location = new System.Drawing.Point(35, 6);
            this.listViewUsers.Name = "listViewUsers";
            this.listViewUsers.Size = new System.Drawing.Size(1227, 396);
            this.listViewUsers.TabIndex = 3;
            this.listViewUsers.UseCompatibleStateImageBehavior = false;
            this.listViewUsers.View = System.Windows.Forms.View.Details;
            // 
            // menuStrip2
            // 
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItemHome,
            this.MenuItem_Profile,
            this.MenuItem_Club,
            this.MenuItem_AthleteStats,
            this.logOutToolStripMenuItem});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(1413, 28);
            this.menuStrip2.TabIndex = 6;
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
            // logOutToolStripMenuItem
            // 
            this.logOutToolStripMenuItem.Name = "logOutToolStripMenuItem";
            this.logOutToolStripMenuItem.Size = new System.Drawing.Size(76, 24);
            this.logOutToolStripMenuItem.Text = "Log Out";
            this.logOutToolStripMenuItem.Click += new System.EventHandler(this.logOutToolStripMenuItem_Click);
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.Users);
            this.tabControl1.Controls.Add(this.Clubs);
            this.tabControl1.Controls.Add(this.Competitions);
            this.tabControl1.Controls.Add(this.Trainings);
            this.tabControl1.Controls.Add(this.Permissions);
            this.tabControl1.Location = new System.Drawing.Point(12, 31);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(1389, 451);
            this.tabControl1.TabIndex = 7;
            // 
            // Users
            // 
            this.Users.Controls.Add(this.listViewUsers);
            this.Users.Location = new System.Drawing.Point(4, 25);
            this.Users.Name = "Users";
            this.Users.Padding = new System.Windows.Forms.Padding(3);
            this.Users.Size = new System.Drawing.Size(1280, 422);
            this.Users.TabIndex = 0;
            this.Users.Text = "Users";
            this.Users.UseVisualStyleBackColor = true;
            // 
            // Clubs
            // 
            this.Clubs.Controls.Add(this.listViewClubs);
            this.Clubs.Location = new System.Drawing.Point(4, 25);
            this.Clubs.Name = "Clubs";
            this.Clubs.Padding = new System.Windows.Forms.Padding(3);
            this.Clubs.Size = new System.Drawing.Size(1280, 422);
            this.Clubs.TabIndex = 1;
            this.Clubs.Text = "Clubs";
            this.Clubs.UseVisualStyleBackColor = true;
            // 
            // listViewClubs
            // 
            this.listViewClubs.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader1,
            this.columnHeader2,
            this.columnHeader3});
            this.listViewClubs.FullRowSelect = true;
            this.listViewClubs.GridLines = true;
            this.listViewClubs.HideSelection = false;
            this.listViewClubs.Location = new System.Drawing.Point(6, 6);
            this.listViewClubs.Name = "listViewClubs";
            this.listViewClubs.Size = new System.Drawing.Size(1268, 396);
            this.listViewClubs.TabIndex = 4;
            this.listViewClubs.UseCompatibleStateImageBehavior = false;
            this.listViewClubs.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader1
            // 
            this.columnHeader1.DisplayIndex = 1;
            // 
            // columnHeader2
            // 
            this.columnHeader2.DisplayIndex = 2;
            // 
            // columnHeader3
            // 
            this.columnHeader3.DisplayIndex = 0;
            // 
            // Competitions
            // 
            this.Competitions.Controls.Add(this.listViewCompetitions);
            this.Competitions.Location = new System.Drawing.Point(4, 25);
            this.Competitions.Name = "Competitions";
            this.Competitions.Size = new System.Drawing.Size(1381, 422);
            this.Competitions.TabIndex = 2;
            this.Competitions.Text = "Competitions";
            this.Competitions.UseVisualStyleBackColor = true;
            // 
            // listViewCompetitions
            // 
            this.listViewCompetitions.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader4,
            this.columnHeader5,
            this.columnHeader6});
            this.listViewCompetitions.FullRowSelect = true;
            this.listViewCompetitions.GridLines = true;
            this.listViewCompetitions.HideSelection = false;
            this.listViewCompetitions.Location = new System.Drawing.Point(12, 3);
            this.listViewCompetitions.Name = "listViewCompetitions";
            this.listViewCompetitions.Size = new System.Drawing.Size(1344, 396);
            this.listViewCompetitions.TabIndex = 4;
            this.listViewCompetitions.UseCompatibleStateImageBehavior = false;
            this.listViewCompetitions.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader4
            // 
            this.columnHeader4.DisplayIndex = 1;
            // 
            // columnHeader5
            // 
            this.columnHeader5.DisplayIndex = 2;
            // 
            // columnHeader6
            // 
            this.columnHeader6.DisplayIndex = 0;
            // 
            // Trainings
            // 
            this.Trainings.Controls.Add(this.listViewTrainings);
            this.Trainings.Location = new System.Drawing.Point(4, 25);
            this.Trainings.Name = "Trainings";
            this.Trainings.Size = new System.Drawing.Size(1381, 422);
            this.Trainings.TabIndex = 3;
            this.Trainings.Text = "Trainings";
            this.Trainings.UseVisualStyleBackColor = true;
            // 
            // listViewTrainings
            // 
            this.listViewTrainings.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader7,
            this.columnHeader8,
            this.columnHeader9});
            this.listViewTrainings.FullRowSelect = true;
            this.listViewTrainings.GridLines = true;
            this.listViewTrainings.HideSelection = false;
            this.listViewTrainings.Location = new System.Drawing.Point(13, 13);
            this.listViewTrainings.Name = "listViewTrainings";
            this.listViewTrainings.Size = new System.Drawing.Size(1353, 396);
            this.listViewTrainings.TabIndex = 4;
            this.listViewTrainings.UseCompatibleStateImageBehavior = false;
            this.listViewTrainings.View = System.Windows.Forms.View.Details;
            // 
            // columnHeader7
            // 
            this.columnHeader7.DisplayIndex = 1;
            // 
            // columnHeader8
            // 
            this.columnHeader8.DisplayIndex = 2;
            // 
            // columnHeader9
            // 
            this.columnHeader9.DisplayIndex = 0;
            // 
            // Permissions
            // 
            this.Permissions.Controls.Add(this.listViewPermissions);
            this.Permissions.Location = new System.Drawing.Point(4, 25);
            this.Permissions.Name = "Permissions";
            this.Permissions.Size = new System.Drawing.Size(1381, 422);
            this.Permissions.TabIndex = 4;
            this.Permissions.Text = "Permissons";
            this.Permissions.UseVisualStyleBackColor = true;
            // 
            // listViewPermissions
            // 
            this.listViewPermissions.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.columnHeader10,
            this.columnHeader11,
            this.columnHeader12});
            this.listViewPermissions.FullRowSelect = true;
            this.listViewPermissions.GridLines = true;
            this.listViewPermissions.HideSelection = false;
            this.listViewPermissions.Location = new System.Drawing.Point(14, 13);
            this.listViewPermissions.Name = "listViewPermissions";
            this.listViewPermissions.Size = new System.Drawing.Size(1250, 396);
            this.listViewPermissions.TabIndex = 4;
            this.listViewPermissions.UseCompatibleStateImageBehavior = false;
            this.listViewPermissions.View = System.Windows.Forms.View.Details;
            // 
            // Home
            // 
            this.AllowDrop = true;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1413, 615);
            this.Controls.Add(this.tabControl1);
            this.Controls.Add(this.menuStrip2);
            this.Name = "Home";
            this.Text = "HomePage";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.Home_FormClosed);
            this.Load += new System.EventHandler(this.Form1_Load);
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.tabControl1.ResumeLayout(false);
            this.Users.ResumeLayout(false);
            this.Clubs.ResumeLayout(false);
            this.Competitions.ResumeLayout(false);
            this.Trainings.ResumeLayout(false);
            this.Permissions.ResumeLayout(false);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ColumnHeader ID;
        private System.Windows.Forms.ColumnHeader FirstName;
        private System.Windows.Forms.ColumnHeader LastName;
        private System.Windows.Forms.ListView listViewUsers;
        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem MenuItemHome;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Profile;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Club;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_AthleteStats;
        private System.Windows.Forms.ToolStripMenuItem logOutToolStripMenuItem;
        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage Users;
        private System.Windows.Forms.TabPage Clubs;
        private System.Windows.Forms.TabPage Competitions;
        private System.Windows.Forms.ListView listViewClubs;
        private System.Windows.Forms.ColumnHeader columnHeader1;
        private System.Windows.Forms.ColumnHeader columnHeader2;
        private System.Windows.Forms.ColumnHeader columnHeader3;
        private System.Windows.Forms.ListView listViewCompetitions;
        private System.Windows.Forms.ColumnHeader columnHeader4;
        private System.Windows.Forms.ColumnHeader columnHeader5;
        private System.Windows.Forms.ColumnHeader columnHeader6;
        private System.Windows.Forms.TabPage Trainings;
        private System.Windows.Forms.ListView listViewTrainings;
        private System.Windows.Forms.ColumnHeader columnHeader7;
        private System.Windows.Forms.ColumnHeader columnHeader8;
        private System.Windows.Forms.ColumnHeader columnHeader9;
        private System.Windows.Forms.TabPage Permissions;
        private System.Windows.Forms.ListView listViewPermissions;
        private System.Windows.Forms.ColumnHeader columnHeader10;
        private System.Windows.Forms.ColumnHeader columnHeader11;
        private System.Windows.Forms.ColumnHeader columnHeader12;
    }
}

