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

namespace VisualStudioFiles
{
    public partial class Home : Form
    {
        private SqlConnection cn;
        private SqlCommand cmd;
        private Perfil perfil;
        private Clube clube;
        private RegisterPage register;
        private int userID;

        public Home(int userID)
        {
            InitializeComponent();
            this.userID = userID;
            this.FormClosed += Home_FormClosed; // Add FormClosed event handler
            ConfigureListViews();  // Set up the ListView columns
            LoadData();
            this.Resize += Home_Resize;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            cn = getSGBDConnection();

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

        private void ConfigureListViews()
        {
            // Configure ListViewUsers
            listViewUsers.Columns.Clear();
            listViewUsers.Columns.Add("ID");
            listViewUsers.Columns.Add("First Name");
            listViewUsers.Columns.Add("Last Name");
            listViewUsers.Columns.Add("Birth Date");
            listViewUsers.Columns.Add("Gender");
            listViewUsers.Columns.Add("Email");
            listViewUsers.Columns.Add("Salary");
            listViewUsers.Columns.Add("Club ID");
            listViewUsers.Columns.Add("Club Name");
            listViewUsers.Columns.Add("Club Acronym");
            listViewUsers.Columns.Add("Club Location");
            listViewUsers.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);

            // Configure ListViewClubs
            listViewClubs.Columns.Clear();
            listViewClubs.Columns.Add("ID");
            listViewClubs.Columns.Add("Name");
            listViewClubs.Columns.Add("Acronym");
            listViewClubs.Columns.Add("Location");
            listViewClubs.Columns.Add("Founding Date");
            listViewClubs.Columns.Add("Number of Athletes");
            listViewClubs.Columns.Add("Membership Requests");
            listViewClubs.Columns.Add("Event ID");
            listViewClubs.Columns.Add("Event Name");
            listViewClubs.Columns.Add("Event Date");
            listViewClubs.Columns.Add("Participants");
            listViewClubs.Columns.Add("Files");
            listViewClubs.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);

            // Configure ListViewCompetitions
            listViewCompetitions.Columns.Clear();
            listViewCompetitions.Columns.Add("ID");
            listViewCompetitions.Columns.Add("Name");
            listViewCompetitions.Columns.Add("Date");
            listViewCompetitions.Columns.Add("Type");
            listViewCompetitions.Columns.Add("Location");
            listViewCompetitions.Columns.Add("Athlete ID");
            listViewCompetitions.Columns.Add("Result Time");
            listViewCompetitions.Columns.Add("Place");
            listViewCompetitions.Columns.Add("Wind Rating");
            listViewCompetitions.Columns.Add("Athlete First Name");
            listViewCompetitions.Columns.Add("Athlete Last Name");
            listViewCompetitions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);

            // Configure ListViewTrainingSessions
            listViewTrainings.Columns.Clear();
            listViewTrainings.Columns.Add("Session ID");
            listViewTrainings.Columns.Add("Athlete First Name");
            listViewTrainings.Columns.Add("Athlete Last Name");
            listViewTrainings.Columns.Add("Club Acronym");
            listViewTrainings.Columns.Add("Date");
            listViewTrainings.Columns.Add("Description");
            listViewTrainings.Columns.Add("Race Conditions");
            listViewTrainings.Columns.Add("Race Surface");
            listViewTrainings.Columns.Add("Distance");
            listViewTrainings.Columns.Add("Result Time");
            listViewTrainings.Columns.Add("Average Pace");
            listViewTrainings.Columns.Add("Heart Beats");
            listViewTrainings.Columns.Add("Max VO2");
            listViewTrainings.Columns.Add("Splits");
            listViewTrainings.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);

            // Configure ListViewPermissions
            listViewPermissions.Columns.Clear();
            listViewPermissions.Columns.Add("User ID");
            listViewPermissions.Columns.Add("First Name");
            listViewPermissions.Columns.Add("Last Name");
            listViewPermissions.Columns.Add("User Type");
            listViewPermissions.Columns.Add("Manage Club Members");
            listViewPermissions.Columns.Add("Manage Competitions");
            listViewPermissions.Columns.Add("Manage Requests");
            listViewPermissions.Columns.Add("Manage Events");
            listViewPermissions.Columns.Add("Manage Race Data");
            listViewPermissions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);

            // Add MouseClick event handler for cell content display
            listViewUsers.MouseClick += ListView_MouseClick;
            listViewClubs.MouseClick += ListView_MouseClick;
            listViewCompetitions.MouseClick += ListView_MouseClick;
            listViewTrainings.MouseClick += ListView_MouseClick;
            listViewPermissions.MouseClick += ListView_MouseClick;
        }

        private void Home_Resize(object sender, EventArgs e)
        {
            AdjustColumnWidths();
        }

        private void AdjustColumnWidths()
        {
            listViewUsers.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);
            listViewClubs.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);
            listViewCompetitions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);
            listViewTrainings.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);
            listViewPermissions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent);

            listViewUsers.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
            listViewClubs.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
            listViewCompetitions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
            listViewTrainings.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
            listViewPermissions.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize);
        }

        private void ListView_MouseClick(object sender, MouseEventArgs e)
        {
            ListView listView = sender as ListView;
            if (listView != null)
            {
                ListViewHitTestInfo hitTestInfo = listView.HitTest(e.Location);
                ListViewItem item = hitTestInfo.Item;
                ListViewItem.ListViewSubItem subItem = hitTestInfo.SubItem;

                if (item != null && subItem != null)
                {
                    ShowPopup(subItem.Text);
                }
            }
        }

        private void ShowPopup(string text)
        {
            Form popup = new Form();
            TextBox textBox = new TextBox();
            textBox.Multiline = true;
            textBox.ReadOnly = true;
            textBox.Dock = DockStyle.Fill;
            textBox.Text = text;

            popup.Text = "Cell Content";
            popup.Size = new Size(300, 200);
            popup.Controls.Add(textBox);
            popup.StartPosition = FormStartPosition.CenterParent;
            popup.ShowDialog();
        }

        public void LoadData()
        {
            LoadUsersAndClubs();
            LoadClubsAndEvents();
            LoadTrainingSessionsAndSeries();
            LoadCompetitionsAndAthletes();
            LoadUsersAndPermissions();
        }
        private void LoadUsersAndClubs()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                listViewUsers.Items.Clear();  // Clear existing items

                cmd = new SqlCommand("SELECT * FROM AMS.vwUsersAndClubs", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["UserID"].ToString());
                    item.SubItems.Add(reader["FirstName"].ToString());
                    item.SubItems.Add(reader["LastName"].ToString());
                    item.SubItems.Add(reader["BirthDate"].ToString());
                    item.SubItems.Add(reader["Gender"].ToString());
                    item.SubItems.Add(reader["Email"].ToString());
                    item.SubItems.Add(reader["Salary"] != DBNull.Value ? reader["Salary"].ToString() : string.Empty);
                    item.SubItems.Add(reader["ClubID"] != DBNull.Value ? reader["ClubID"].ToString() : string.Empty);
                    item.SubItems.Add(reader["ClubName"] != DBNull.Value ? reader["ClubName"].ToString() : string.Empty);
                    item.SubItems.Add(reader["ClubAcronym"] != DBNull.Value ? reader["ClubAcronym"].ToString() : string.Empty);
                    item.SubItems.Add(reader["ClubLocation"] != DBNull.Value ? reader["ClubLocation"].ToString() : string.Empty);

                    listViewUsers.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load user and club data: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        private void LoadTrainingSessionsAndSeries()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                listViewTrainings.Items.Clear();  // Clear existing items

                cmd = new SqlCommand("SELECT * FROM AMS.vwTrainingSessionsAndSeries", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["SessionID"].ToString());
                    item.SubItems.Add(reader["AthleteFirstName"].ToString());
                    item.SubItems.Add(reader["AthleteLastName"].ToString());
                    item.SubItems.Add(reader["ClubAcronym"].ToString());
                    item.SubItems.Add(reader["Date"].ToString());
                    item.SubItems.Add(reader["Description"].ToString());
                    item.SubItems.Add(reader["RaceConditions"].ToString());
                    item.SubItems.Add(reader["RaceSurface"].ToString());
                    item.SubItems.Add(reader["Distance"].ToString());
                    item.SubItems.Add(reader["ResultTime"].ToString());
                    item.SubItems.Add(reader["AveragePace"].ToString());
                    item.SubItems.Add(reader["HeartBeats"].ToString());
                    item.SubItems.Add(reader["MaxVO2"].ToString());
                    item.SubItems.Add(reader["Splits"].ToString());

                    listViewTrainings.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load training session and series data: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        private void LoadCompetitionsAndAthletes()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                listViewCompetitions.Items.Clear();  // Clear existing items

                cmd = new SqlCommand("SELECT * FROM AMS.vwCompetitionsAndAthletes", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["CompetitionID"].ToString());
                    item.SubItems.Add(reader["CompetitionName"].ToString());
                    item.SubItems.Add(reader["CompetitionDate"].ToString());
                    item.SubItems.Add(reader["CompetitionType"].ToString());
                    item.SubItems.Add(reader["CompetitionLocation"].ToString());
                    item.SubItems.Add(reader["AthleteID"] != DBNull.Value ? reader["AthleteID"].ToString() : string.Empty);
                    item.SubItems.Add(reader["ResultTime"] != DBNull.Value ? reader["ResultTime"].ToString() : string.Empty);
                    item.SubItems.Add(reader["Place"] != DBNull.Value ? reader["Place"].ToString() : string.Empty);
                    item.SubItems.Add(reader["WindRating"] != DBNull.Value ? reader["WindRating"].ToString() : string.Empty);
                    item.SubItems.Add(reader["AthleteFirstName"] != DBNull.Value ? reader["AthleteFirstName"].ToString() : string.Empty);
                    item.SubItems.Add(reader["AthleteLastName"] != DBNull.Value ? reader["AthleteLastName"].ToString() : string.Empty);

                    listViewCompetitions.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load competition and athlete data: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        private void LoadUsersAndPermissions()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                listViewPermissions.Items.Clear();  // Clear existing items

                cmd = new SqlCommand("SELECT * FROM AMS.vwUsersAndPermissions", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["UserID"].ToString());
                    item.SubItems.Add(reader["FirstName"].ToString());
                    item.SubItems.Add(reader["LastName"].ToString());
                    item.SubItems.Add(reader["UserType"].ToString());
                    item.SubItems.Add(reader["ManageClubMembers"].ToString());
                    item.SubItems.Add(reader["ManageCompetitions"].ToString());
                    item.SubItems.Add(reader["ManageRequests"].ToString());
                    item.SubItems.Add(reader["ManageEvents"].ToString());
                    item.SubItems.Add(reader["ManageRaceData"].ToString());

                    listViewPermissions.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load user and permissions data: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }
        private void LoadClubsAndEvents()
        {
            if (!verifySGBDConnection())
                return;

            try
            {
                listViewClubs.Items.Clear();  // Clear existing items

                cmd = new SqlCommand("SELECT * FROM AMS.vwClubsAndEvents", cn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["ClubID"].ToString());
                    item.SubItems.Add(reader["ClubName"].ToString());
                    item.SubItems.Add(reader["ClubAcronym"].ToString());
                    item.SubItems.Add(reader["ClubLocation"].ToString());
                    item.SubItems.Add(reader["FoundingDate"].ToString());
                    item.SubItems.Add(reader["NumberOfAthletes"].ToString());
                    item.SubItems.Add(reader["MembershipRequests"] != DBNull.Value ? reader["MembershipRequests"].ToString() : "0");
                    item.SubItems.Add(reader["EventID"] != DBNull.Value ? reader["EventID"].ToString() : string.Empty);
                    item.SubItems.Add(reader["EventName"] != DBNull.Value ? reader["EventName"].ToString() : string.Empty);
                    item.SubItems.Add(reader["EventDate"] != DBNull.Value ? reader["EventDate"].ToString() : string.Empty);
                    item.SubItems.Add(reader["Participants"] != DBNull.Value ? reader["Participants"].ToString() : string.Empty);
                    item.SubItems.Add(reader["Files"] != DBNull.Value ? reader["Files"].ToString() : string.Empty);

                    listViewClubs.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to load clubs and events data: " + ex.Message);
            }
            finally
            {
                cn.Close();
            }
        }

        private void MenuItemHome_Click(object sender, EventArgs e)
        {
        }

        private void MenuItem_Profile_Click(object sender, EventArgs e)
        {
            if (perfil == null)
            {
                perfil = new Perfil(this, userID);
            }
            perfil.StartPosition = FormStartPosition.Manual;
            perfil.Location = this.Location;
            perfil.Show();
            this.Hide();
        }

        private void MenuItem_Club_Click(object sender, EventArgs e)
        {
            try
            {
                if (clube == null)
                {
                    clube = new Clube(this, userID);
                }
                clube.StartPosition = FormStartPosition.Manual;
                clube.Location = this.Location;
                clube.Show();
                this.Hide();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to navigate to the club page: " + ex.Message);
            }
        }

        private void MenuItem_AthleteStats_Click(object sender, EventArgs e)
        {

        }

        private void logOutToolStripMenuItem_Click(object sender, EventArgs e)
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

        private void Home_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
