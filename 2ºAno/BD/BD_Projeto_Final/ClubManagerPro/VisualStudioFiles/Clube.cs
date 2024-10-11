using System;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Windows.Forms;

namespace VisualStudioFiles
{
    public partial class Clube : Form
    {
        private SqlConnection cn;
        private SqlCommand cmd;
        private Home home;
        private Perfil perfil;
        private RegisterPage register;
        private int userID;

        public Clube(Home form1, int userID)
        {
            InitializeComponent();
            home = form1;
            this.userID = userID;
            LoadClubData();
            SetTextBoxesState(false);
            BtnConfirmChange.Visible = false;
            BtnCancelChange.Visible = false;
            InitializeClubList();
            AddWatermark(maskedTextBox_FoundingDate, "YYYY-MM-DD");
        }

        private SqlConnection getSGBDConnection()
        {
            //return new SqlConnection("data source = tcp:mednat.ieeta.pt\\SQLSERVER, 8101; Initial Catalog = p10g8; uid = p10g8; password = NaoSei.008#");
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
            home.LoadData(); // Reload data before navigating back to home
            home.StartPosition = FormStartPosition.Manual;
            home.Location = this.Location;
            home.Show();
            this.Hide();
        }

        private void MenuItem_Profile_Click(object sender, EventArgs e)
        {
            if (perfil == null)
            {
                perfil = new Perfil(home, userID);
            }
            perfil.StartPosition = FormStartPosition.Manual;
            perfil.Location = this.Location;
            perfil.Show();
            perfil.LoadUserData(); // Ensure profile data is loaded
            this.Hide();
        }

        private void MenuItem_Club_Click(object sender, EventArgs e)
        {
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

        private int GetCurrentUserClubID()
        {
            if (!verifySGBDConnection())
                return -1;

            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT club_ID FROM AMS.[User] WHERE ID = @UserID", cn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return (int)result;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to get current user club ID: " + ex.Message);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }

            return -1;
        }

        private bool IsUserAdminOfClub(int userID, int clubID)
        {
            if (!verifySGBDConnection())
                return false;

            try
            {
                cmd = new SqlCommand("SELECT COUNT(*) FROM AMS.User_club_relation WHERE user_ID = @UserID AND club_ID = @ClubID AND role = 'admin' AND status = 'active'", cn);
                cmd.Parameters.AddWithValue("@UserID", userID);
                cmd.Parameters.AddWithValue("@ClubID", clubID);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to check if user is admin: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            return false;
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

        private void InitializeClubList()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                cmd = new SqlCommand("SELECT acronym, name FROM AMS.Club", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                listBox_Clubs.Items.Clear();
                while (reader.Read())
                {
                    string clubItem = $"{reader["acronym"]} - {reader["name"]}";
                    listBox_Clubs.Items.Add(clubItem);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load clubs: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            BtnAlterClub.Enabled = false;
            BtnDeleteClub.Enabled = false;
            SetButtonStates(); // Check user's club membership
        }

        private void LoadClubData()
        {
            // Load club data based on user ID if user is part of a club
            if (!verifySGBDConnection())
                return;

            try
            {
                using (SqlCommand cmd = new SqlCommand("SELECT club_ID FROM AMS.[User] WHERE ID = @UserID", cn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        int clubID = (int)result;
                        LoadClubDetails(clubID);
                        UpdateButtonStates(clubID);
                    }
                    else
                    {
                        UpdateButtonStates(-1); // User is not in a club
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load user club data: " + ex.Message);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
        }

        private void LoadClubDetails(int clubID)
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                cmd = new SqlCommand("SELECT * FROM AMS.Club WHERE ID = @ClubID", cn);
                cmd.Parameters.AddWithValue("@ClubID", clubID);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    textBox_ClubName.Text = reader["name"].ToString();
                    textBox_Acronym.Text = reader["acronym"].ToString();
                    textBox_Location.Text = reader["location"].ToString();
                    DateTime foundingDate = reader.GetDateTime(reader.GetOrdinal("founding_date"));
                    maskedTextBox_FoundingDate.Text = foundingDate.ToString("yyyy-MM-dd");
                    textBox_NumOfAthletes.Text = reader["num_of_athletes"].ToString();
                    textBox_Resources.Text = reader["resources"] != DBNull.Value ? reader["resources"].ToString() : string.Empty;

                    byte[] imageData = reader["photo_gallery"] as byte[];
                    if (imageData != null && imageData.Length > 0)
                    {
                        using (MemoryStream ms = new MemoryStream(imageData))
                        {
                            pictureBox_Club.Image = Image.FromStream(ms);
                        }
                    }
                    else
                    {
                        pictureBox_Club.Image = Properties.Resources.blank_profile_picture_2;
                    }
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load club details: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        private void ClearClubDetails()
        {
            textBox_ClubName.Text = "";
            textBox_Acronym.Text = "";
            textBox_Location.Text = "";
            maskedTextBox_FoundingDate.Text = "";
            textBox_NumOfAthletes.Text = "";
            textBox_Resources.Text = "";
            pictureBox_Club.Image = Properties.Resources.blank_profile_picture_2;
        }

        private void SetTextBoxesState(bool enabled)
        {
            textBox_ClubName.Enabled = enabled;
            textBox_Acronym.Enabled = enabled;
            textBox_Location.Enabled = enabled;
            maskedTextBox_FoundingDate.Enabled = enabled;
            textBox_NumOfAthletes.Enabled = enabled;
            textBox_Resources.Enabled = enabled;
            pictureBox_Club.Enabled = enabled;
            BtnSaveImage.Enabled = enabled;
            BtnSearchImage.Enabled = enabled;

            Color color = enabled ? Color.White : SystemColors.Control;
            textBox_ClubName.BackColor = color;
            textBox_Acronym.BackColor = color;
            textBox_Location.BackColor = color;
            maskedTextBox_FoundingDate.BackColor = color;
            textBox_NumOfAthletes.BackColor = color;
            textBox_Resources.BackColor = color;
            pictureBox_Club.BackColor = color;
            BtnSaveImage.BackColor = color;
            BtnSearchImage.BackColor = color;
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
                    pictureBox_Club.Image = Image.FromFile(filePath);
                }
            }
        }

        private void BtnSaveImage_Click(object sender, EventArgs e)
        {
            if (pictureBox_Club.Image != null)
            {
                try
                {
                    if (!verifySGBDConnection())
                        return;

                    byte[] imageData = ImageToByteArray(pictureBox_Club.Image);

                    using (SqlCommand cmd = new SqlCommand("UPDATE AMS.Club SET photo_gallery = @Image WHERE ID = @ClubID", cn))
                    {
                        cmd.Parameters.AddWithValue("@ClubID", GetSelectedClubID());
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

        private byte[] ImageToByteArray(Image image)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                image.Save(ms, image.RawFormat);
                return ms.ToArray();
            }
        }

        private int GetSelectedClubID()
        {
            if (listBox_Clubs.SelectedItem == null)
                return -1;

            string selectedClub = listBox_Clubs.SelectedItem.ToString();
            string acronym = selectedClub.Split('-')[0].Trim();

            try
            {
                if (!verifySGBDConnection())
                    return -1;

                using (SqlCommand cmd = new SqlCommand("SELECT ID FROM AMS.Club WHERE acronym = @Acronym", cn))
                {
                    cmd.Parameters.AddWithValue("@Acronym", acronym);
                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        return (int)result;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to get selected club ID: " + ex.Message);
            }

            return -1;
        }

        private void textBox_Search_TextChanged(object sender, EventArgs e)
        {
            string searchText = textBox_ClubSearch.Text.ToLower();
            listBox_Clubs.Items.Clear();

            if (!verifySGBDConnection())
                return;

            try
            {
                string query = "SELECT acronym, name FROM AMS.Club";
                if (!string.IsNullOrEmpty(searchText))
                {
                    query += " WHERE LOWER(acronym) LIKE @SearchText OR LOWER(name) LIKE @SearchText";
                }

                cmd = new SqlCommand(query, cn);
                if (!string.IsNullOrEmpty(searchText))
                {
                    cmd.Parameters.AddWithValue("@SearchText", "%" + searchText + "%");
                }

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    string clubItem = $"{reader["acronym"]} - {reader["name"]}";
                    listBox_Clubs.Items.Add(clubItem);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to search clubs: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }

            if (string.IsNullOrWhiteSpace(searchText))
            {
                InitializeClubList();
            }
        }

        private void SetButtonStates()
        {
            int currentUserClubID = GetCurrentUserClubID();
            bool isInClub = currentUserClubID != -1;

            Btn_CreateClub.Enabled = !isInClub;
            Btn_JoinClub.Enabled = !isInClub;
        }

        private void listBoxClubs_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox_Clubs.SelectedIndex != -1)
            {
                int selectedClubID = GetSelectedClubID();
                if (selectedClubID != -1)
                {
                    LoadClubDetails(selectedClubID);
                    UpdateButtonStates(selectedClubID);
                }
            }
        }

        private void UpdateButtonStates(int selectedClubID)
        {
            int currentUserClubID = GetCurrentUserClubID();
            bool isAdmin = IsUserAdminOfClub(userID, selectedClubID);

            BtnAlterClub.Enabled = isAdmin;
            BtnDeleteClub.Enabled = isAdmin;
            Btn_JoinClub.Enabled = selectedClubID != currentUserClubID && currentUserClubID == -1;
            Btn_CreateClub.Enabled = currentUserClubID == -1;
            Btn_QuitClub.Enabled = currentUserClubID != -1;
        }

        private void CreateClub()
        {
            string clubName = textBox_ClubName.Text;
            string acronym = textBox_Acronym.Text;
            string location = textBox_Location.Text;
            DateTime foundingDate;
            int numOfAthletes;

            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to database.");
                return;
            }

            if (string.IsNullOrWhiteSpace(clubName) || string.IsNullOrWhiteSpace(acronym) || string.IsNullOrWhiteSpace(location))
            {
                MessageBox.Show("Please fill in all required fields.");
                SetTextBoxesState(true);
                BtnConfirmChange.Visible = true;
                BtnCancelChange.Visible = true;
                return;
            }

            if (!DateTime.TryParse(maskedTextBox_FoundingDate.Text, out foundingDate))
            {
                MessageBox.Show("Invalid founding date format. Please enter in YYYY-MM-DD format.");
                SetTextBoxesState(true);
                BtnConfirmChange.Visible = true;
                BtnCancelChange.Visible = true;
                return;
            }

            if (!int.TryParse(textBox_NumOfAthletes.Text, out numOfAthletes))
            {
                MessageBox.Show("Invalid number of athletes format. Please enter a numeric value.");
                SetTextBoxesState(true);
                BtnConfirmChange.Visible = true;
                BtnCancelChange.Visible = true;
                return;
            }

            try
            {
                using (SqlCommand cmd = new SqlCommand("AMS.CreateClubAndAssignAdmin", cn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Name", clubName);
                    cmd.Parameters.AddWithValue("@Acronym", acronym);
                    cmd.Parameters.AddWithValue("@Location", location);
                    cmd.Parameters.AddWithValue("@FoundingDate", foundingDate);
                    cmd.Parameters.AddWithValue("@NumOfAthletes", numOfAthletes);
                    cmd.Parameters.AddWithValue("@PhotoGallery", pictureBox_Club.Image != null ? ImageToByteArray(pictureBox_Club.Image) : (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@Resources", textBox_Resources.Text);
                    cmd.Parameters.AddWithValue("@UserID", userID);
                    cmd.ExecuteNonQuery();
                }

                MessageBox.Show("Club created successfully.");
                LoadClubData(); // Reload the current user's club data
                SetButtonStates(); // Update button states

                BtnConfirmChange.Visible = false;
                BtnCancelChange.Visible = false;
                BtnAlterClub.Visible = true;
                BtnDeleteClub.Visible = true;
                Btn_CreateClub.Visible = true;
                Btn_JoinClub.Visible = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to create club: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private bool AlterClub(int clubID)
        {
            string clubName = textBox_ClubName.Text;
            string acronym = textBox_Acronym.Text;
            string location = textBox_Location.Text;
            DateTime foundingDate;
            int numOfAthletes;

            if (!verifySGBDConnection())
            {
                MessageBox.Show("Failed to connect to database.");
                return false;
            }

            if (string.IsNullOrWhiteSpace(clubName) || string.IsNullOrWhiteSpace(acronym) || string.IsNullOrWhiteSpace(location))
            {
                MessageBox.Show("Please fill in all required fields.");
                return false;
            }

            if (!DateTime.TryParse(maskedTextBox_FoundingDate.Text, out foundingDate))
            {
                MessageBox.Show("Invalid founding date format. Please enter in YYYY-MM-DD format.");
                return false;
            }

            if (!int.TryParse(textBox_NumOfAthletes.Text, out numOfAthletes))
            {
                MessageBox.Show("Invalid number of athletes format. Please enter a numeric value.");
                return false;
            }
            try
            {
                string query = "UPDATE AMS.Club SET name = @Name, acronym = @Acronym, location = @Location, " +
                               "founding_date = @FoundingDate, num_of_athletes = @NumOfAthletes, " +
                               "photo_gallery = @PhotoGallery, resources = @Resources WHERE ID = @ClubID";

                cmd = new SqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@Name", textBox_ClubName.Text);
                cmd.Parameters.AddWithValue("@Acronym", textBox_Acronym.Text);
                cmd.Parameters.AddWithValue("@Location", textBox_Location.Text);
                cmd.Parameters.AddWithValue("@FoundingDate", maskedTextBox_FoundingDate.Text);
                cmd.Parameters.AddWithValue("@NumOfAthletes", int.Parse(textBox_NumOfAthletes.Text));
                cmd.Parameters.AddWithValue("@PhotoGallery", pictureBox_Club.Image != null ? ImageToByteArray(pictureBox_Club.Image) : (object)DBNull.Value);
                cmd.Parameters.AddWithValue("@Resources", textBox_Resources.Text);
                cmd.Parameters.AddWithValue("@ClubID", clubID);

                cmd.ExecuteNonQuery();
                MessageBox.Show("Club updated successfully.");
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to update club: " + ex.Message);
                return false;
            }
            finally
            {
                cn.Close();
            }
        }

        private void BtnJoinClub_Click(object sender, EventArgs e)
        {
            int selectedClubID = GetSelectedClubID();
            if (selectedClubID != -1)
            {
                if (selectedClubID == GetCurrentUserClubID())
                {
                    MessageBox.Show("You are already a member of this club.");
                    return;
                }

                try
                {
                    if (!verifySGBDConnection())
                        return;

                    cmd = new SqlCommand("UPDATE AMS.[User] SET club_ID = @ClubID WHERE ID = @UserID", cn);
                    cmd.Parameters.AddWithValue("@ClubID", selectedClubID);
                    cmd.Parameters.AddWithValue("@UserID", userID);

                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Successfully joined the club.");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Failed to join the club: " + ex.Message);
                }
                finally
                {
                    cn.Close();
                }
            }
        }

        private void BtnAlterClub_Click(object sender, EventArgs e)
        {
            SetTextBoxesState(true);
            BtnDeleteClub.Visible = false;
            Btn_JoinClub.Visible = false;
            Btn_CreateClub.Visible = false;
            BtnConfirmChange.Visible = true;
            BtnCancelChange.Visible = true;
        }

        private void BtnCreateClub_Click(object sender, EventArgs e)
        {
            ClearClubDetails();
            SetTextBoxesState(true);
            BtnAlterClub.Visible = false;
            BtnDeleteClub.Visible = false;
            Btn_JoinClub.Visible = false;
            BtnConfirmChange.Visible = true;
            BtnCancelChange.Visible = true;
        }

        private void BtnConfirmChange_Click(object sender, EventArgs e)
        {
            // Handle confirm changes for creating or altering a club
            int selectedClubID = GetSelectedClubID();

            if (selectedClubID == -1)
            {
                CreateClub();
                BtnConfirmChange.Visible = false;
                BtnCancelChange.Visible = false;
                BtnAlterClub.Visible = true;
                BtnDeleteClub.Visible = true;
            }
            else
            {
                AlterClub(selectedClubID);
                LoadClubData();
                SetTextBoxesState(false);
                BtnAlterClub.Visible = true;
                BtnDeleteClub.Visible = true;
                Btn_JoinClub.Visible = true;
                Btn_CreateClub.Visible = true;
                BtnConfirmChange.Visible = false;
                BtnCancelChange.Visible = false;
            }
            home.LoadData();
        }

        private void BtnCancelChange_Click(object sender, EventArgs e)
        {
            LoadClubData();
            SetTextBoxesState(false);
            BtnAlterClub.Visible = true;
            BtnDeleteClub.Visible = true;
            Btn_JoinClub.Visible = true;
            Btn_CreateClub.Visible = true;
            BtnConfirmChange.Visible = false;
            BtnCancelChange.Visible = false;
        }

        private void BtnDeleteClub_Click(object sender, EventArgs e)
        {
            int selectedClubID = GetSelectedClubID();
            if (selectedClubID != -1)
            {
                var confirmResult = MessageBox.Show("Are you sure to delete this club?", "Confirm Delete", MessageBoxButtons.YesNo);
                if (confirmResult == DialogResult.Yes)
                {
                    try
                    {
                        if (!verifySGBDConnection())
                            return;

                        using (SqlCommand cmd = new SqlCommand("AMS.DeleteClubAndRelatedTables", cn))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.AddWithValue("@ClubID", selectedClubID);

                            cmd.ExecuteNonQuery();
                            MessageBox.Show("Club deleted successfully.");
                            InitializeClubList(); // Reload the club list
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Failed to delete the club: " + ex.Message);
                    }
                    finally
                    {
                        cn.Close();
                    }
                }
            }
        }

        private void Btn_QuitClub_Click(object sender, EventArgs e)
        {
            int currentUserClubID = GetCurrentUserClubID();
            if (currentUserClubID == -1)
            {
                MessageBox.Show("You are not a member of any club.");
                return;
            }

            try
            {
                if (!verifySGBDConnection())
                    return;

                bool isAdmin = IsUserAdminOfClub(userID, currentUserClubID);
                if (isAdmin)
                {
                    // Check if there's more than one member in the club
                    string countMembersQuery = "SELECT COUNT(*) FROM AMS.User_club_relation WHERE club_ID = @ClubID";
                    using (SqlCommand countMembersCmd = new SqlCommand(countMembersQuery, cn))
                    {
                        countMembersCmd.Parameters.AddWithValue("@ClubID", currentUserClubID);
                        int memberCount = (int)countMembersCmd.ExecuteScalar();
                        if (memberCount <= 1)
                        {
                            MessageBox.Show("You are the only member in the club. You cannot quit.");
                            return;
                        }
                    }

                    // Ensure the connection is open when executing other commands
                    if (cn.State != ConnectionState.Open)
                        cn.Open();

                    // Prompt to select a new admin
                    string selectNewAdminQuery = "SELECT user_ID, CONCAT(first_name, ' ', last_name) AS full_name FROM AMS.[User] " +
                                                 "JOIN AMS.User_club_relation ON AMS.[User].ID = AMS.User_club_relation.user_ID " +
                                                 "WHERE club_ID = @ClubID AND user_ID != @UserID";
                    using (SqlCommand selectNewAdminCmd = new SqlCommand(selectNewAdminQuery, cn))
                    {
                        selectNewAdminCmd.Parameters.AddWithValue("@ClubID", currentUserClubID);
                        selectNewAdminCmd.Parameters.AddWithValue("@UserID", userID);

                        SqlDataAdapter adapter = new SqlDataAdapter(selectNewAdminCmd);
                        DataTable members = new DataTable();
                        adapter.Fill(members);

                        // Show the list of members to select a new admin
                        Form selectAdminForm = new Form();
                        ListBox listBox = new ListBox
                        {
                            DataSource = members,
                            DisplayMember = "full_name",
                            ValueMember = "user_ID",
                            Dock = DockStyle.Fill
                        };
                        selectAdminForm.Controls.Add(listBox);
                        selectAdminForm.Text = "Select New Admin";
                        selectAdminForm.Size = new Size(300, 200);
                        if (selectAdminForm.ShowDialog() == DialogResult.OK)
                        {
                            int newAdminID = (int)listBox.SelectedValue;

                            // Update the new admin role
                            string updateNewAdminQuery = "UPDATE AMS.User_club_relation SET role = 'admin' WHERE user_ID = @NewAdminID AND club_ID = @ClubID";
                            using (SqlCommand updateNewAdminCmd = new SqlCommand(updateNewAdminQuery, cn))
                            {
                                updateNewAdminCmd.Parameters.AddWithValue("@NewAdminID", newAdminID);
                                updateNewAdminCmd.Parameters.AddWithValue("@ClubID", currentUserClubID);
                                // Ensure the connection is open when executing other commands
                                if (cn.State != ConnectionState.Open)
                                    cn.Open();
                                updateNewAdminCmd.ExecuteNonQuery();
                            }
                        }
                    }
                }
                // Ensure the connection is open when executing other commands
                if (cn.State != ConnectionState.Open)
                    cn.Open();


                // Update current user's club relation and permissions to remove club association
                string updateUserClubQuery = "DELETE FROM AMS.User_club_relation WHERE user_ID = @UserID";
                using (SqlCommand updateUserClubCmd = new SqlCommand(updateUserClubQuery, cn))
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    updateUserClubCmd.Parameters.AddWithValue("@UserID", userID);
                    updateUserClubCmd.ExecuteNonQuery();
                }
                if (cn.State != ConnectionState.Open)
                    cn.Open();

                string updateUserPermissionsQuery = "DELETE FROM AMS.User_permissions WHERE user_ID = @UserID";
                using (SqlCommand updateUserPermissionsCmd = new SqlCommand(updateUserPermissionsQuery, cn))
                {
                    if (cn.State != ConnectionState.Open)
                        cn.Open();
                    updateUserPermissionsCmd.Parameters.AddWithValue("@UserID", userID);
                    updateUserPermissionsCmd.ExecuteNonQuery();
                }

                MessageBox.Show("Successfully quit the club.");

                LoadClubData(); // Reload the current user's club data
                SetButtonStates(); // Update button states

            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to quit the club: " + ex.Message);
            }
            finally
            {
                if (cn.State == ConnectionState.Open)
                    cn.Close();
            }
        }
    }
}
