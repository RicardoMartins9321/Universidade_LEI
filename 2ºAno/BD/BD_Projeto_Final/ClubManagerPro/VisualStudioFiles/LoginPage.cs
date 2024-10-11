using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace VisualStudioFiles
{
    public partial class LoginPage : Form
    {
        private SqlConnection cn;
        private Home home;

        public LoginPage()
        {
            InitializeComponent();
        }

        private SqlConnection getSGBDConnection()
        {
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

        private void MenuItem_Register_Click(object sender, EventArgs e)
        {
            RegisterPage registrationForm = new RegisterPage();
            registrationForm.StartPosition = FormStartPosition.Manual;
            registrationForm.Location = this.Location;
            registrationForm.Show();
            this.Close();
        }

        private void MenuItem_Login_Click(object sender, EventArgs e)
        {

        }

        private string DecryptPassword(byte[] encryptedPassword)
        {
            string sql = "SELECT AMS.fnDecryptPassword(@EncryptedPassword)";

            if (!verifySGBDConnection())
                return null;

            using (SqlCommand cmd = new SqlCommand(sql, cn))
            {
                cmd.Parameters.AddWithValue("@EncryptedPassword", encryptedPassword);

                var result = cmd.ExecuteScalar();
                return result == DBNull.Value ? null : (string)result;
            }
        }


        private void Btn_Login_Click(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to database.");
                return;
            }
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM AMS.[User] WHERE email = @Email", cn))
                {
                    cmd.Parameters.AddWithValue("@Email", textBox_Email.Text);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows && reader.Read())
                        {
                            byte[] encryptedPassword = reader["password"] as byte[];

                            if (encryptedPassword == null)
                            {
                                MessageBox.Show("Invalid email or password.");
                                return;
                            }

                            // Store user ID before closing the reader
                            int userID = reader.GetInt32(0);

                            // Close the reader before decrypting the password
                            reader.Close();

                            string decryptedPassword = DecryptPassword(encryptedPassword);

                            if (decryptedPassword == textBox_Password.Text)
                            {
                                MessageBox.Show("Login successful!");
                                if (home == null)
                                {
                                    home = new Home(userID); // Pass the user ID to Home
                                }
                                home.StartPosition = FormStartPosition.Manual;
                                home.Location = this.Location;
                                home.Show();
                                this.Close();
                            }
                            else
                            {
                                MessageBox.Show("Invalid email or password.");
                            }
                        }
                        else
                        {
                            MessageBox.Show("Invalid email or password.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to login: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void checkBox_TogglePassVisibility_CheckedChanged(object sender, EventArgs e)
        {
            // Toggle between showing password in plain text and masked with asterisks
            if (checkBox_TogglePassVisibility.Checked)
            {
                textBox_Password.PasswordChar = '\0';
            }
            else
            {
                textBox_Password.PasswordChar = '*';
            }
        }
    }
}
