namespace VisualStudioFiles
{
    partial class LoginPage
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
            this.MenuItem_Register = new System.Windows.Forms.ToolStripMenuItem();
            this.MenuItem_Login = new System.Windows.Forms.ToolStripMenuItem();
            this.textBox_Password = new System.Windows.Forms.TextBox();
            this.textBox_Email = new System.Windows.Forms.TextBox();
            this.Label_Password = new System.Windows.Forms.Label();
            this.Label_Email = new System.Windows.Forms.Label();
            this.Btn_Login = new System.Windows.Forms.Button();
            this.checkBox_TogglePassVisibility = new System.Windows.Forms.CheckBox();
            this.menuStrip2.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip2
            // 
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.MenuItem_Register,
            this.MenuItem_Login});
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(800, 28);
            this.menuStrip2.TabIndex = 8;
            this.menuStrip2.Text = "menuStrip2";
            // 
            // MenuItem_Register
            // 
            this.MenuItem_Register.Name = "MenuItem_Register";
            this.MenuItem_Register.Size = new System.Drawing.Size(77, 24);
            this.MenuItem_Register.Text = "Register";
            this.MenuItem_Register.Click += new System.EventHandler(this.MenuItem_Register_Click);
            // 
            // MenuItem_Login
            // 
            this.MenuItem_Login.Name = "MenuItem_Login";
            this.MenuItem_Login.Size = new System.Drawing.Size(60, 24);
            this.MenuItem_Login.Text = "Login";
            this.MenuItem_Login.Click += new System.EventHandler(this.MenuItem_Login_Click);
            // 
            // textBox_Password
            // 
            this.textBox_Password.Location = new System.Drawing.Point(335, 201);
            this.textBox_Password.Name = "textBox_Password";
            this.textBox_Password.PasswordChar = '*';
            this.textBox_Password.Size = new System.Drawing.Size(180, 22);
            this.textBox_Password.TabIndex = 24;
            // 
            // textBox_Email
            // 
            this.textBox_Email.Location = new System.Drawing.Point(335, 123);
            this.textBox_Email.Name = "textBox_Email";
            this.textBox_Email.Size = new System.Drawing.Size(180, 22);
            this.textBox_Email.TabIndex = 23;
            // 
            // Label_Password
            // 
            this.Label_Password.AutoSize = true;
            this.Label_Password.Location = new System.Drawing.Point(238, 205);
            this.Label_Password.Name = "Label_Password";
            this.Label_Password.Size = new System.Drawing.Size(73, 16);
            this.Label_Password.TabIndex = 22;
            this.Label_Password.Text = "Password: ";
            // 
            // Label_Email
            // 
            this.Label_Email.AutoSize = true;
            this.Label_Email.Location = new System.Drawing.Point(239, 127);
            this.Label_Email.Name = "Label_Email";
            this.Label_Email.Size = new System.Drawing.Size(41, 16);
            this.Label_Email.TabIndex = 21;
            this.Label_Email.Text = "Email";
            // 
            // Btn_Login
            // 
            this.Btn_Login.Location = new System.Drawing.Point(322, 315);
            this.Btn_Login.Name = "Btn_Login";
            this.Btn_Login.Size = new System.Drawing.Size(128, 37);
            this.Btn_Login.TabIndex = 25;
            this.Btn_Login.Text = "Login";
            this.Btn_Login.UseVisualStyleBackColor = true;
            this.Btn_Login.Click += new System.EventHandler(this.Btn_Login_Click);
            // 
            // checkBox_TogglePassVisibility
            // 
            this.checkBox_TogglePassVisibility.AutoSize = true;
            this.checkBox_TogglePassVisibility.Location = new System.Drawing.Point(335, 175);
            this.checkBox_TogglePassVisibility.Name = "checkBox_TogglePassVisibility";
            this.checkBox_TogglePassVisibility.Size = new System.Drawing.Size(70, 20);
            this.checkBox_TogglePassVisibility.TabIndex = 55;
            this.checkBox_TogglePassVisibility.Text = "Visible";
            this.checkBox_TogglePassVisibility.UseVisualStyleBackColor = true;
            this.checkBox_TogglePassVisibility.CheckedChanged += new System.EventHandler(this.checkBox_TogglePassVisibility_CheckedChanged);
            // 
            // LoginPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.checkBox_TogglePassVisibility);
            this.Controls.Add(this.Btn_Login);
            this.Controls.Add(this.textBox_Password);
            this.Controls.Add(this.textBox_Email);
            this.Controls.Add(this.Label_Password);
            this.Controls.Add(this.Label_Email);
            this.Controls.Add(this.menuStrip2);
            this.Name = "LoginPage";
            this.Text = "LoginPage";
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Register;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Login;
        private System.Windows.Forms.TextBox textBox_Password;
        private System.Windows.Forms.TextBox textBox_Email;
        private System.Windows.Forms.Label Label_Password;
        private System.Windows.Forms.Label Label_Email;
        private System.Windows.Forms.Button Btn_Login;
        private System.Windows.Forms.CheckBox checkBox_TogglePassVisibility;
    }
}