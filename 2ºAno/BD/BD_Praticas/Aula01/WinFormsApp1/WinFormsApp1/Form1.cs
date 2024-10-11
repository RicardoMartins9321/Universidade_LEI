using System.Data;
using System.Data.SqlClient;


namespace WinFormsApp1
{
    public partial class Form1 : Form
    {

        private void TestDBConnection(string dbServer, string dbName, string userName, string userPass)
        {
            SqlConnection CN = new SqlConnection("Data Source = " + dbServer + ";"
           + "Initial Catalog = " + dbName + "; uid = " + userName + ";" + "password = " + userPass);

            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    MessageBox.Show("Successful connection to database " + CN.Database + " on the "
                   + CN.DataSource + " server", "Connection Test", MessageBoxButtons.OK);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Failed to open connection to database due to the error \r\n" +
               ex.Message, "Connection Test", MessageBoxButtons.OK);
            }
            if (CN.State == ConnectionState.Open)
                CN.Close();
        }

        private string GetTableContent(SqlConnection CN)
        {
            string str = "";

            try
            {
                CN.Open();
                if (CN.State == ConnectionState.Open)
                {
                    int cnt = 1;
                    SqlCommand sqlcmd = new SqlCommand("SELECT * FROM Hello", CN);
                    SqlDataReader reader;
                    reader = sqlcmd.ExecuteReader();
                    while (reader.Read())
                    {
                        str += cnt.ToString() + " - " + reader.GetInt32(reader.GetOrdinal("MsgID")) +
                       ", ";
                        str += reader.GetString(reader.GetOrdinal("MsgSubject"));
                        str += "\n";
                        cnt += 1;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(" Failed to open connection to database due to the error \r\n" +
               ex.Message, "Connection Error", MessageBoxButtons.OK);
            }
            if (CN.State == ConnectionState.Open)
                CN.Close();
            return str;
        }

        public Form1()
        {
            InitializeComponent();
        }


        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }


        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            string dbServer = textBox2.Text;
            string userName = textBox3.Text;
            string userPass = textBox4.Text;


            TestDBConnection(dbServer, userName, userName, userPass);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            string dbServer = textBox2.Text;
            string userName = textBox3.Text;
            string userPass = textBox4.Text;

            SqlConnection CN = new SqlConnection("Data Source = " + dbServer + ";"
           + "Initial Catalog = " + dbName + "; uid = " + userName + ";" + "password = " + userPass + ";TrustServerCertification");
            var retVal = get

            GetTableContent(CN);
        }
    }
}