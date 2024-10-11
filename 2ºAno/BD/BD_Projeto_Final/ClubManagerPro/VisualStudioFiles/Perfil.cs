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
using System.IO;

namespace VisualStudioFiles
{
    public partial class Perfil : Form
    {
        private SqlConnection cn;
        private Home home;
        private Clube clube;
        private RegisterPage register;
        private int userID;
        private string originalPassword; // To store the original password

        public Perfil(Home form1, int userID)
        {
            InitializeComponent();
            home = form1;
            this.userID = userID;
            LoadUserData();
            CheckIfUserIsAthlete(); // Check if the user is an athlete
            SetTextBoxesState(false); // Initially disable text boxes
            BtnConfirmChange.Visible = false;
            BtnCancelChange.Visible = false;
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

        private void MenuItemHome_Click(object sender, EventArgs e)
        {
            home.LoadData();
            home.StartPosition = FormStartPosition.Manual;
            home.Location = this.Location;
            home.Show();
            this.Hide();
        }

        private void MenuItem_Profile_Click(object sender, EventArgs e)
        {

        }

        private void MenuItem_Club_Click(object sender, EventArgs e)
        {
            if (clube == null)
            {
                clube = new Clube(home, userID);
            }
            clube.StartPosition = FormStartPosition.Manual;
            clube.Location = this.Location;
            clube.Show();
            this.Hide();
        }

        private void MenuItem_AthleteStats_Click(object sender, EventArgs e)
        {

        }

        private void MenuItem_LogOut_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Logged out successful!");
            if (register == null)
            {
                register = new RegisterPage();
            }
            register.StartPosition = FormStartPosition.Manual;
            register.Location = this.Location;
            register.Show();
            this.Hide();
        }

        private byte[] ImageToByteArray(Image image)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, image.RawFormat);
                return ms.ToArray();
            }
        }
        private void pictureBox_Profile_DragEnter(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent(DataFormats.FileDrop))
            {
                e.Effect = DragDropEffects.Copy;
            }
            else
            {
                e.Effect = DragDropEffects.None;
            }
        }

        private void pictureBox_Profile_DragDrop(object sender, DragEventArgs e)
        {
            string[] files = (string[])e.Data.GetData(DataFormats.FileDrop);
            if (files != null && files.Length > 0)
            {
                string filePath = files[0];
                pictureBox_Profile.Image = Image.FromFile(filePath);
            }
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

        private string GetUserType(int userID)
        {
            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT AMS.fnGetUserType(@UserID)", cn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    return cmd.ExecuteScalar() as string;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to get user type: " + ex.Message);
                return null;
            }
        }
        private bool IsUserAthlete()
        {
            string query = "SELECT AMS.fnIsUserAthlete(@UserID)";
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                return (bool)cmd.ExecuteScalar();
            }
        }
        private void CheckIfUserIsAthlete()
        {
            string query = "SELECT AMS.fnIsUserAthlete(@UserID)";
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);
                bool isAthlete = (bool)cmd.ExecuteScalar();
                ToggleAthleteFields(isAthlete);
            }
        }

        private void ToggleAthleteFields(bool isVisible)
        {
            textBox_Height.Visible = isVisible;
            textBox_Weight.Visible = isVisible;
            textBox_CC.Visible = isVisible;
        }

        private void SetTextBoxesState(bool enabled)
        {
            textBox_FirstName.Enabled = enabled;
            textBox_LastName.Enabled = enabled;
            maskedTextBox_Date.Enabled = enabled;
            textBox_Email.Enabled = enabled;
            textBox_Password.Enabled = enabled;
            radioBtn_Male.Enabled = enabled;
            radioBtn_Female.Enabled = enabled;
            textBox_Height.Enabled = enabled;
            textBox_Weight.Enabled = enabled;
            textBox_Salary.Enabled = enabled;
            textBox_CC.Enabled = enabled;
            pictureBox_Profile.Enabled = enabled;
            BtnSaveImage.Enabled = enabled;
            BtnSearchImage.Enabled = enabled;

            Color color = enabled ? Color.White : SystemColors.Control;
            textBox_FirstName.BackColor = color;
            textBox_LastName.BackColor = color;
            maskedTextBox_Date.BackColor = color;
            textBox_Email.BackColor = color;
            textBox_Password.BackColor = color;
            textBox_Height.BackColor = color;
            textBox_Weight.BackColor = color;
            textBox_Salary.BackColor = color;
            textBox_CC.BackColor = color;
            pictureBox_Profile.BackColor = color;
            BtnSaveImage.BackColor = color;
            BtnSearchImage.BackColor = color;
        }


        public void LoadUserData()
        {
            if (!verifySGBDConnection())
                return;

            string query = "SELECT u.first_name, u.last_name, u.birth_date, u.sex, u.email, u.password, " +
                           "u.salary, u.Imagem, c.acronym AS club_acronym " +
                           "FROM AMS.[User] u " +
                           "LEFT JOIN AMS.Club c ON u.club_ID = c.ID " +
                           "WHERE u.ID = @UserID";

            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@UserID", userID);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.HasRows && reader.Read())
                    {
                        textBox_FirstName.Text = reader["first_name"] != DBNull.Value ? reader["first_name"].ToString() : string.Empty;
                        textBox_LastName.Text = reader["last_name"] != DBNull.Value ? reader["last_name"].ToString() : string.Empty;

                        // Formatting the birth_date
                        if (reader["birth_date"] != DBNull.Value)
                        {
                            DateTime birthDate = Convert.ToDateTime(reader["birth_date"]);
                            maskedTextBox_Date.Text = birthDate.ToString("dd/MM/yyyy");
                        }
                        else
                        {
                            maskedTextBox_Date.Text = string.Empty;
                        }

                        textBox_Email.Text = reader["email"] != DBNull.Value ? reader["email"].ToString() : string.Empty;

                        // Read the encrypted password as a byte array
                        byte[] encryptedPassword = reader["password"] != DBNull.Value ? (byte[])reader["password"] : null;

                        if (reader["sex"] != DBNull.Value && reader["sex"].ToString() == "M")
                        {
                            radioBtn_Male.Checked = true;
                        }
                        else if (reader["sex"] != DBNull.Value)
                        {
                            radioBtn_Female.Checked = true;
                        }

                        // Handling optional fields
                        textBox_Salary.Text = reader["salary"] != DBNull.Value ? reader["salary"].ToString() : string.Empty;
                        textBox_ClubAcronym.Text = reader["club_acronym"] != DBNull.Value ? reader["club_acronym"].ToString() : string.Empty;

                        // Load the image
                        byte[] imageData = reader["Imagem"] as byte[];
                        if (imageData != null && imageData.Length > 0)
                        {
                            try
                            {
                                using (MemoryStream ms = new MemoryStream(imageData))
                                {
                                    pictureBox_Profile.Image = Image.FromStream(ms);
                                }
                            }
                            catch (ArgumentException)
                            {
                                // If there's an error loading the image, the default image set in the designer will remain
                            }
                        }
                        else
                        {
                            // If no image data, the default image set in the designer will remain
                        }

                        // Close the reader before decrypting the password
                        reader.Close();

                        // Decrypt the password after closing the reader
                        if (encryptedPassword != null)
                        {
                            originalPassword = DecryptPassword(encryptedPassword);
                            textBox_Password.Text = originalPassword ?? string.Empty;
                        }
                        else
                        {
                            textBox_Password.Text = string.Empty;
                        }
                    }
                } // SqlDataReader is closed here
            }

            // Load athlete-specific fields if the user is an athlete
            if (IsUserAthlete())
            {
                string athleteQuery = "SELECT CC, height, weight FROM AMS.Athlete WHERE user_ID = @UserID";
                using (SqlCommand cmd = new SqlCommand(athleteQuery, cn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows && reader.Read())
                        {
                            textBox_CC.Text = reader["CC"] != DBNull.Value ? reader["CC"].ToString() : string.Empty;
                            textBox_Height.Text = reader["height"] != DBNull.Value ? reader["height"].ToString() : string.Empty;
                            textBox_Weight.Text = reader["weight"] != DBNull.Value ? reader["weight"].ToString() : string.Empty;
                        }
                    }
                }
            }
        }



        private void BtnSaveImage_Click(object sender, EventArgs e)
        {
            if (pictureBox_Profile.Image != null)
            {
                try
                {
                    if (!verifySGBDConnection())
                        return;

                    byte[] imageData = ImageToByteArray(pictureBox_Profile.Image);

                    using (SqlCommand cmd = new SqlCommand("UPDATE AMS.[User] SET Imagem = @Image WHERE ID = @UserID", cn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@Image", imageData);

                        cmd.ExecuteNonQuery();
                        MessageBox.Show("Image saved successfully.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to save image: " + ex.Message);
                }
                finally
                {
                    cn.Close();
                }
            }
            else
            {
                MessageBox.Show("No image to save.");
            }
        }

        private void BtnSearchImage_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog openFileDialog = new OpenFileDialog())
            {
                openFileDialog.InitialDirectory = "c:\\";
                openFileDialog.Filter = "Image files (*.jpg, *.jpeg, *.png) | *.jpg; *.jpeg; *.png";
                openFileDialog.FilterIndex = 1;
                openFileDialog.RestoreDirectory = true;

                if (openFileDialog.ShowDialog() == DialogResult.OK)
                {
                    string filePath = openFileDialog.FileName;
                    pictureBox_Profile.Image = Image.FromFile(filePath);
                }
            }
        }

        private void BtnAlterProfile_Click(object sender, EventArgs e)
        {
            SetTextBoxesState(true);
            BtnAlterProfile.Visible = false;
            BtnConfirmChange.Visible = true;
            BtnCancelChange.Visible = true;
        }

        private void BtnDeleteUser_Click(object sender, EventArgs e)
        {
            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to the database.");
                return;
            }
            var confirmResult = MessageBox.Show("Are you sure to delete your profile?", "Confirm Delete", MessageBoxButtons.YesNo);
            if (confirmResult == DialogResult.Yes)
            {
                string connectionString = "data source = DESKTOP-77DPNPD; integrated security=true; initial catalog=Project";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    try
                    {
                        // Get the user type based on the userID
                        string userType = GetUserType(userID);
                        conn.Open();
                        using (SqlCommand cmd = new SqlCommand("AMS.DeleteUserAndRelatedTables", conn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@UserID", userID);

                            cmd.ExecuteNonQuery();
                            MessageBox.Show("User deleted successfully.");

                            // Log out the user and redirect to the register page
                            if (register == null)
                            {
                                register = new RegisterPage();
                            }
                            register.StartPosition = FormStartPosition.Manual;
                            register.Location = this.Location;
                            register.Show();
                            this.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Failed to delete user: " + ex.Message);
                    }
                    finally
                    {
                        cn.Close();
                    }
                }
            }
        }

        private void BtnConfirmChange_Click(object sender, EventArgs e)
        {
            try
            {
                if (!verifySGBDConnection())
                    return;

                // Check if the email is already taken by another user
                using (SqlCommand checkEmailCmd = new SqlCommand("SELECT COUNT(*) FROM AMS.[User] WHERE Email = @Email AND ID != @UserID", cn))
                {
                    checkEmailCmd.Parameters.AddWithValue("@Email", textBox_Email.Text);
                    checkEmailCmd.Parameters.AddWithValue("@UserID", userID);

                    int emailCount = (int)checkEmailCmd.ExecuteScalar();
                    if (emailCount > 0)
                    {
                        MessageBox.Show("The email address is already taken by another user. Please choose a different email address.");
                        return;
                    }
                }

                byte[] encryptedPassword = null;
                if (textBox_Password.Text != originalPassword)
                {
                    encryptedPassword = EncryptPassword(textBox_Password.Text);
                }
                else
                {
                    using (SqlCommand getPasswordCmd = new SqlCommand("SELECT password FROM AMS.[User] WHERE ID = @UserID", cn))
                    {
                        getPasswordCmd.Parameters.AddWithValue("@UserID", userID);
                        encryptedPassword = (byte[])getPasswordCmd.ExecuteScalar();
                    }
                }

                byte[] imageData = null;
                if (pictureBox_Profile.Image != null)
                {
                    imageData = ImageToByteArray(pictureBox_Profile.Image);
                }

                using (SqlCommand cmd = new SqlCommand("UPDATE AMS.[User] SET first_name = @FirstName, last_name = @LastName, birth_date = @BirthDate, email = @Email, password = @Password, sex = @Sex, salary = @Salary, Imagem = @Image WHERE ID = @UserID", cn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", textBox_FirstName.Text);
                    cmd.Parameters.AddWithValue("@LastName", textBox_LastName.Text);
                    // Converting the date string back to DateTime
                    if (DateTime.TryParseExact(maskedTextBox_Date.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out DateTime birthDate))
                    {
                        cmd.Parameters.AddWithValue("@BirthDate", birthDate);
                    }
                    else
                    {
                        // Handle invalid date format
                        MessageBox.Show("Invalid date format. Please enter the date as DD/MM/YYYY.");
                        return;
                    }
                    cmd.Parameters.AddWithValue("@Email", textBox_Email.Text);
                    cmd.Parameters.AddWithValue("@Password", encryptedPassword);
                    cmd.Parameters.AddWithValue("@Sex", radioBtn_Male.Checked ? "M" : "F");
                    // Convert salary to a decimal or appropriate numeric type
                    if (decimal.TryParse(textBox_Salary.Text, out decimal salary))
                    {
                        cmd.Parameters.AddWithValue("@Salary", salary);
                    }
                    else
                    {
                        // Handle invalid salary format
                        MessageBox.Show("Invalid salary format. Please enter a numeric value.");
                        return;
                    }
                    cmd.Parameters.AddWithValue("@Image", imageData != null ? (object)imageData : DBNull.Value);
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Profile updated successfully.");
                }

                // Check if the user is an athlete and update the AMS.Athlete table
                bool isAthlete = IsUserAthlete();
                if (isAthlete)
                {
                    if (!int.TryParse(textBox_CC.Text, out int cc))
                    {
                        MessageBox.Show("Invalid CC format. Please enter a numeric value.");
                        return;
                    }

                    if (!decimal.TryParse(textBox_Height.Text, out decimal height))
                    {
                        MessageBox.Show("Invalid height format. Please enter a numeric value.");
                        return;
                    }

                    if (!decimal.TryParse(textBox_Weight.Text, out decimal weight))
                    {
                        MessageBox.Show("Invalid weight format. Please enter a numeric value.");
                        return;
                    }

                    using (SqlCommand cmd = new SqlCommand("IF EXISTS (SELECT 1 FROM AMS.Athlete WHERE user_ID = @UserID) " +
                                                            "UPDATE AMS.Athlete SET CC = @CC, height = @Height, weight = @Weight WHERE user_ID = @UserID " +
                                                            "ELSE " +
                                                            "INSERT INTO AMS.Athlete (user_ID, CC, height, weight) VALUES (@UserID, @CC, @Height, @Weight)", cn))
                    {
                        cmd.Parameters.AddWithValue("@UserID", userID);
                        cmd.Parameters.AddWithValue("@CC", cc);
                        cmd.Parameters.AddWithValue("@Height", height);
                        cmd.Parameters.AddWithValue("@Weight", weight);

                        cmd.ExecuteNonQuery();
                    }
                }

                SetTextBoxesState(false);
                BtnAlterProfile.Visible = true;
                BtnConfirmChange.Visible = false;
                BtnCancelChange.Visible = false;

                // Reload data to reflect changes
                home.LoadData();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to update profile: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void BtnCancelChange_Click(object sender, EventArgs e)
        {
            LoadUserData();
            SetTextBoxesState(false);
            BtnAlterProfile.Visible = true;
            BtnConfirmChange.Visible = false;
            BtnCancelChange.Visible = false;
        }
    }
}
