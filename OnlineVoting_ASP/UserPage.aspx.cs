using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlinVotingLibrary;
namespace OnlineVoting_ASP
{
    public partial class UserPage : System.Web.UI.Page
    {
        VoterProperties vp = new VoterProperties();
        VoterBusinessLogic vbl = new VoterBusinessLogic();
        protected void Page_Init(object sender, EventArgs e)
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet candidateDataSet = vbl.GetCandidiateList();
            DataTable dtVotingResult = vbl.GetVotingResult();
            DataTable dt;
            if (!IsPostBack)
            {
                dt = candidateDataSet.Tables[0];

                foreach (DataRow row in dt.Rows)
                {
                    if (row["Position"].ToString() == "President")
                    {
                        RadioButtonListPresident.Items.Add(new ListItem(row["Name"].ToString(), row["Id"].ToString()));

                    }
                    else if (row["Position"].ToString() == "Vice-President")
                    {
                        RadioButtonListVicePresident.Items.Add(new ListItem(row["Name"].ToString(), row["Id"].ToString()));

                    }
                    else if (row["Position"].ToString() == "Secretary")
                    {
                        RadioButtonListSecretary.Items.Add(new ListItem(row["Name"].ToString(), row["Id"].ToString()));

                    }
                    else if (row["Position"].ToString() == "Treasurer")
                    {
                        RadioButtonListTreasurer.Items.Add(new ListItem(row["Name"].ToString(), row["Id"].ToString()));

                    }

                }
            }
            this.BindDummyRow();
            GridViewResult.DataSource = dtVotingResult;
            GridViewResult.DataBind();
            int id = Convert.ToInt32(Session["VoterId"]);

            if (id == 0)
            {
                Response.Redirect("Login");

            }
            vp = vbl.GetVoterDetails(id);

            lblName.Text = vp.FullName;
            lblVoterId.Text = vp.VoterId.ToString();

            Chart1.Series["series1"].XValueMember = "Candidate Name";
            Chart1.Series["series1"].YValueMembers = "Votes";
            Chart1.Series["series1"].ChartType = System.Web.UI.DataVisualization.Charting.SeriesChartType.Column;
            Chart1.DataSource = dtVotingResult;
            Chart1.DataBind();

            Master.AfterLogInPanelControl.Visible = true;
            Master.BeforeLogInPanelControl.Visible = false;



        }
        private void BindDummyRow()
        {
            DataTable dummy = new DataTable();
            dummy.Columns.Add("CandidateName");
            dummy.Columns.Add("CandidateId");
            dummy.Columns.Add("Votes");
            dummy.Columns.Add("Position");
            dummy.Rows.Add();
            gvResult.DataSource = dummy;
            gvResult.DataBind();
        }

        protected void btnEditDetail_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["VoterId"]);
            Response.Redirect("EditVoterDetails");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DataTable dtt = new DataTable();

            DataRow workRow = dtt.NewRow();
            dtt.Columns.Add("VoterId");
            dtt.Columns.Add("President");
            dtt.Columns.Add("Vice-President");
            dtt.Columns.Add("Secretary");
            dtt.Columns.Add("Treasurer");
            workRow["VoterId"] = lblVoterId.Text;
            workRow["President"] = RadioButtonListPresident.SelectedValue.ToString();
            workRow["Vice-President"] = RadioButtonListVicePresident.SelectedValue.ToString();
            workRow["Secretary"] = RadioButtonListSecretary.SelectedValue.ToString();
            workRow["Treasurer"] = RadioButtonListTreasurer.SelectedValue.ToString();
            dtt.Rows.Add(workRow);
            bool isVotingSuccess = vbl.Voteing(dtt);
            if (isVotingSuccess)
            {
                lblVoteSubmissionStatus.Text = "vote submitted successfully.";
                lblVoteSubmissionStatus.ForeColor = System.Drawing.Color.Green;
                Response.Redirect("UserPage");
            }
            else
            {
                lblVoteSubmissionStatus.Text = "vote Submission failed.";
                lblVoteSubmissionStatus.ForeColor = System.Drawing.Color.Red;


            }

        }
    }
}