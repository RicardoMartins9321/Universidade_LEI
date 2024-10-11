namespace VisualStudioFiles
{
    partial class RegisterPage
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
            this.Label_FirstName = new System.Windows.Forms.Label();
            this.Label_LastName = new System.Windows.Forms.Label();
            this.Label_Email = new System.Windows.Forms.Label();
            this.Label_Password = new System.Windows.Forms.Label();
            this.Label_BirthDate = new System.Windows.Forms.Label();
            this.maskedTextBox_Date = new System.Windows.Forms.MaskedTextBox();
            this.textBox_FirstName = new System.Windows.Forms.TextBox();
            this.textBox_LastName = new System.Windows.Forms.TextBox();
            this.Label_Gender = new System.Windows.Forms.Label();
            this.textBox_Email = new System.Windows.Forms.TextBox();
            this.textBox_Password = new System.Windows.Forms.TextBox();
            this.Btn_Register = new System.Windows.Forms.Button();
            this.radioBtn_Male = new System.Windows.Forms.RadioButton();
            this.radioBtn_Female = new System.Windows.Forms.RadioButton();
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
            this.menuStrip2.TabIndex = 7;
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
            // Label_FirstName
            // 
            this.Label_FirstName.AutoSize = true;
            this.Label_FirstName.Location = new System.Drawing.Point(231, 47);
            this.Label_FirstName.Name = "Label_FirstName";
            this.Label_FirstName.Size = new System.Drawing.Size(75, 16);
            this.Label_FirstName.TabIndex = 9;
            this.Label_FirstName.Text = "First name: ";
            // 
            // Label_LastName
            // 
            this.Label_LastName.AutoSize = true;
            this.Label_LastName.Location = new System.Drawing.Point(231, 91);
            this.Label_LastName.Name = "Label_LastName";
            this.Label_LastName.Size = new System.Drawing.Size(75, 16);
            this.Label_LastName.TabIndex = 10;
            this.Label_LastName.Text = "Last name: ";
            // 
            // Label_Email
            // 
            this.Label_Email.AutoSize = true;
            this.Label_Email.Location = new System.Drawing.Point(232, 214);
            this.Label_Email.Name = "Label_Email";
            this.Label_Email.Size = new System.Drawing.Size(41, 16);
            this.Label_Email.TabIndex = 11;
            this.Label_Email.Text = "Email";
            // 
            // Label_Password
            // 
            this.Label_Password.AutoSize = true;
            this.Label_Password.Location = new System.Drawing.Point(231, 295);
            this.Label_Password.Name = "Label_Password";
            this.Label_Password.Size = new System.Drawing.Size(73, 16);
            this.Label_Password.TabIndex = 12;
            this.Label_Password.Text = "Password: ";
            // 
            // Label_BirthDate
            // 
            this.Label_BirthDate.AutoSize = true;
            this.Label_BirthDate.Location = new System.Drawing.Point(231, 131);
            this.Label_BirthDate.Name = "Label_BirthDate";
            this.Label_BirthDate.Size = new System.Drawing.Size(71, 16);
            this.Label_BirthDate.TabIndex = 13;
            this.Label_BirthDate.Text = "Birth Date: ";
            // 
            // maskedTextBox_Date
            // 
            this.maskedTextBox_Date.Location = new System.Drawing.Point(328, 127);
            this.maskedTextBox_Date.Name = "maskedTextBox_Date";
            this.maskedTextBox_Date.Size = new System.Drawing.Size(180, 22);
            this.maskedTextBox_Date.TabIndex = 14;
            // 
            // textBox_FirstName
            // 
            this.textBox_FirstName.Location = new System.Drawing.Point(328, 47);
            this.textBox_FirstName.Name = "textBox_FirstName";
            this.textBox_FirstName.Size = new System.Drawing.Size(180, 22);
            this.textBox_FirstName.TabIndex = 15;
            // 
            // textBox_LastName
            // 
            this.textBox_LastName.Location = new System.Drawing.Point(328, 88);
            this.textBox_LastName.Name = "textBox_LastName";
            this.textBox_LastName.Size = new System.Drawing.Size(180, 22);
            this.textBox_LastName.TabIndex = 16;
            // 
            // Label_Gender
            // 
            this.Label_Gender.AutoSize = true;
            this.Label_Gender.Location = new System.Drawing.Point(231, 169);
            this.Label_Gender.Name = "Label_Gender";
            this.Label_Gender.Size = new System.Drawing.Size(58, 16);
            this.Label_Gender.TabIndex = 18;
            this.Label_Gender.Text = "Gender: ";
            // 
            // textBox_Email
            // 
            this.textBox_Email.Location = new System.Drawing.Point(328, 210);
            this.textBox_Email.Name = "textBox_Email";
            this.textBox_Email.Size = new System.Drawing.Size(180, 22);
            this.textBox_Email.TabIndex = 19;
            // 
            // textBox_Password
            // 
            this.textBox_Password.Location = new System.Drawing.Point(328, 291);
            this.textBox_Password.Name = "textBox_Password";
            this.textBox_Password.PasswordChar = '*';
            this.textBox_Password.Size = new System.Drawing.Size(180, 22);
            this.textBox_Password.TabIndex = 20;
            // 
            // Btn_Register
            // 
            this.Btn_Register.Location = new System.Drawing.Point(304, 346);
            this.Btn_Register.Name = "Btn_Register";
            this.Btn_Register.Size = new System.Drawing.Size(143, 55);
            this.Btn_Register.TabIndex = 21;
            this.Btn_Register.Text = "Register";
            this.Btn_Register.UseVisualStyleBackColor = true;
            this.Btn_Register.Click += new System.EventHandler(this.Btn_Register_Click);
            // 
            // radioBtn_Male
            // 
            this.radioBtn_Male.AutoSize = true;
            this.radioBtn_Male.Location = new System.Drawing.Point(328, 169);
            this.radioBtn_Male.Name = "radioBtn_Male";
            this.radioBtn_Male.Size = new System.Drawing.Size(39, 20);
            this.radioBtn_Male.TabIndex = 22;
            this.radioBtn_Male.TabStop = true;
            this.radioBtn_Male.Text = "M";
            this.radioBtn_Male.UseVisualStyleBackColor = true;
            // 
            // radioBtn_Female
            // 
            this.radioBtn_Female.AutoSize = true;
            this.radioBtn_Female.Location = new System.Drawing.Point(391, 169);
            this.radioBtn_Female.Name = "radioBtn_Female";
            this.radioBtn_Female.Size = new System.Drawing.Size(36, 20);
            this.radioBtn_Female.TabIndex = 23;
            this.radioBtn_Female.TabStop = true;
            this.radioBtn_Female.Text = "F";
            this.radioBtn_Female.UseVisualStyleBackColor = true;
            // 
            // checkBox_TogglePassVisibility
            // 
            this.checkBox_TogglePassVisibility.AutoSize = true;
            this.checkBox_TogglePassVisibility.Location = new System.Drawing.Point(328, 265);
            this.checkBox_TogglePassVisibility.Name = "checkBox_TogglePassVisibility";
            this.checkBox_TogglePassVisibility.Size = new System.Drawing.Size(70, 20);
            this.checkBox_TogglePassVisibility.TabIndex = 56;
            this.checkBox_TogglePassVisibility.Text = "Visible";
            this.checkBox_TogglePassVisibility.UseVisualStyleBackColor = true;
            this.checkBox_TogglePassVisibility.CheckedChanged += new System.EventHandler(this.checkBox_TogglePassVisibility_CheckedChanged);
            // 
            // RegisterPage
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.checkBox_TogglePassVisibility);
            this.Controls.Add(this.radioBtn_Female);
            this.Controls.Add(this.radioBtn_Male);
            this.Controls.Add(this.Btn_Register);
            this.Controls.Add(this.textBox_Password);
            this.Controls.Add(this.textBox_Email);
            this.Controls.Add(this.Label_Gender);
            this.Controls.Add(this.textBox_LastName);
            this.Controls.Add(this.textBox_FirstName);
            this.Controls.Add(this.maskedTextBox_Date);
            this.Controls.Add(this.Label_BirthDate);
            this.Controls.Add(this.Label_Password);
            this.Controls.Add(this.Label_Email);
            this.Controls.Add(this.Label_LastName);
            this.Controls.Add(this.Label_FirstName);
            this.Controls.Add(this.menuStrip2);
            this.Name = "RegisterPage";
            this.Text = "RegisterPage";
            this.menuStrip2.ResumeLayout(false);
            this.menuStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Register;
        private System.Windows.Forms.ToolStripMenuItem MenuItem_Login;
        private System.Windows.Forms.Label Label_FirstName;
        private System.Windows.Forms.Label Label_LastName;
        private System.Windows.Forms.Label Label_Email;
        private System.Windows.Forms.Label Label_Password;
        private System.Windows.Forms.Label Label_BirthDate;
        private System.Windows.Forms.MaskedTextBox maskedTextBox_Date;
        private System.Windows.Forms.TextBox textBox_FirstName;
        private System.Windows.Forms.TextBox textBox_LastName;
        private System.Windows.Forms.Label Label_Gender;
        private System.Windows.Forms.TextBox textBox_Email;
        private System.Windows.Forms.TextBox textBox_Password;
        private System.Windows.Forms.Button Btn_Register;
        private System.Windows.Forms.RadioButton radioBtn_Male;
        private System.Windows.Forms.RadioButton radioBtn_Female;
        private System.Windows.Forms.CheckBox checkBox_TogglePassVisibility;
    }
}