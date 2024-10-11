using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Text.RegularExpressions;


namespace VisualStudioFiles
{
    public partial class RegisterPage : Form
    {
        private SqlConnection cn;
        private Home home;
        private int userID;

        public RegisterPage()
        {
            InitializeComponent();
            AddWatermark(maskedTextBox_Date, "Format: YYYY-MM-DD");
        }
        public RegisterPage(int userID)
        {
            this.userID = userID;
            InitializeComponent();
            AddWatermark(maskedTextBox_Date, "Format: YYYY-MM-DD");
        }

        private SqlConnection getSGBDConnection()
        {
            // return new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p10g8; uid = p10g8; password = NaoSei.008#");
            return new SqlConnection("data source= DESKTOP-77DPNPD;integrated security=true;initial catalog=Project");
        }

        private bool verifySGBDConnection()
        {
            if (cn == null)
                cn = getSGBDConnection();

            if (cn.State != ConnectionState.Open)
                cn.Open();

            return cn.State == ConnectionState.Open;
        }


        private bool IsValidEmail(string email)
        {
            string pattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, pattern);
        }

        private bool IsValidPassword(string password)
        {
            string pattern = @"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,40}$";
            return Regex.IsMatch(password, pattern);
        }
        private byte[] EncryptPassword(string plainTextPassword)
        {
            string sql = "SELECT AMS.fnEncryptPassword(@Password)";

            if (!verifySGBDConnection())
                return null;

            using (SqlCommand cmd = new SqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@Password", plainTextPassword);

                return (byte[])cmd.ExecuteScalar();
            }
        }


        private void checkBox_TogglePassVisibility_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle between showing password in plain text and masked with asterisks
            if (checkBox_TogglePassVisibility.Checked)
            {
                textBox_Password.PasswordChar = '\0'; // Show as plain text
            }
            else
            {
                textBox_Password.PasswordChar = '*'; // Mask with asterisks
            }
        }

        private void AddWatermark(MaskedTextBox maskedTextBox, string watermark)
        {
            maskedTextBox.Text = watermark;
            maskedTextBox.ForeColor = Color.Gray;

            maskedTextBox.GotFocus += (sender, e) =>
            {
                if (maskedTextBox.Text == watermark)
                {
                    maskedTextBox.Text = "";
                    maskedTextBox.ForeColor = Color.Black;
                }
            };

            maskedTextBox.LostFocus += (sender, e) =>
            {
                if (string.IsNullOrWhiteSpace(maskedTextBox.Text))
                {
                    maskedTextBox.Text = watermark;
                    maskedTextBox.ForeColor = Color.Gray;
                }
            };
        }

        private void MenuItem_Register_Click(object sender, EventArgs e)
        {

        }

        private void MenuItem_Login_Click(object sender, EventArgs e)
        {
            LoginPage loginForm = new LoginPage();
            loginForm.StartPosition = FormStartPosition.Manual;
            loginForm.Location = this.Location;
            loginForm.Show();
            this.Hide();
        }

        private void Btn_Register_Click(object sender, EventArgs e)
        {
            string gender = radioBtn_Male.Checked ? "M" : radioBtn_Female.Checked ? "F" : null;
            string email = textBox_Email.Text;
            string password = textBox_Password.Text;
            string firstName = textBox_FirstName.Text;
            string lastName = textBox_LastName.Text;
            DateTime birthDate;

            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to database.");
                return;
            }
            if (firstName == "" || lastName == "")
            {
                MessageBox.Show("Please enter your first and last name");
                return;
            }
            if (!DateTime.TryParse(maskedTextBox_Date.Text, out birthDate))
            {
                MessageBox.Show("Invalid birth date format. Please enter in YYYY-MM-DD format.");
                return;
            }
            if (gender == null)
            {
                MessageBox.Show("Please select your gender.");
                return;
            }
            if (!IsValidEmail(email))
            {
                MessageBox.Show("Please enter a valid email address.");
                return;
            }
            if (!IsValidPassword(password))
            {
                MessageBox.Show("Password must be at least 8 characters long and contain at least: one lower and uppercase letter, one number and one special character.");
                return;
            }

            try
            {
                byte[] encryptedPassword = EncryptPassword(password);

                string query = "INSERT INTO AMS.[User] (first_name, last_name, birth_date, sex, email, password) " +
                                "OUTPUT INSERTED.ID " + // Return the new user ID
                                "VALUES (@FirstName, @LastName, @BirthDate, @Sex, @Email, @Password)";

                using (SqlCommand cmd = new SqlCommand(query, cn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@BirthDate", birthDate);
                    cmd.Parameters.AddWithValue("@Sex", gender);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", encryptedPassword);

                    int newUserId = (int)cmd.ExecuteScalar(); // Get the new user ID
                    if (newUserId > 0)
                    {
                        MessageBox.Show("Registration successful!");
                        if (home == null)
                        {
                            home = new Home(newUserId); // Pass the new user ID to Home
                        }
                        home.StartPosition = FormStartPosition.Manual;
                        home.Location = this.Location;
                        home.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Registration failed. Please try again.");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("An error occurred: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
    }
}
