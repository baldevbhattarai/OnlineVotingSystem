using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using OnlinVotingLibrary;
namespace OnlineVoting_ASP
{
    public partial class Admin : System.Web.UI.Page
    {
        VoterBusinessLogic vbl = new VoterBusinessLogic();
        DataSet voterDataset, candidateDataset ;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                voterDataset = vbl.GetVoterList();
                GridViewVoterList.DataSource = voterDataset;
                GridViewVoterList.DataBind();
                candidateDataset = vbl.GetCandidiateList();
                GridViewCandidateList.DataSource = candidateDataset;
                GridViewCandidateList.DataBind();
            }
            GridViewVotingResult.DataSource = vbl.GetVotingResult();
            GridViewVotingResult.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string searchTerm = txtSearchBox.Text;
             voterDataset = vbl.GetVoterList(searchTerm);
            GridViewVoterList.DataSource = voterDataset;
            GridViewVoterList.DataBind();

        }

        protected void GridViewVoterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
        

        protected void GridViewVoterList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewVoterList.DataKeys[e.RowIndex].Value.ToString());
            bool isDeleteSuccess =  vbl.DeleteVoter(id);
            if (isDeleteSuccess)
            {
                lblStatus.Text = "Voter with id: " + id + " deleted successfully.";
                Response.Redirect("Admin");
            }
            else
            {
                lblStatus.Text = "Voter Deletion failed.";

            }

        }

        protected void GridViewVoterList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(GridViewVoterList.DataKeys[e.NewEditIndex].Value.ToString());
            Session["role"] = "Admin";
            Session["VoterId"] = id;
            Response.Redirect("EditVoterDetails");
           
        }

        protected void GridViewCandidateList_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int id = Convert.ToInt32(GridViewCandidateList.DataKeys[e.NewEditIndex].Value.ToString());

          
        }

        protected void GridViewCandidateList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridViewCandidateList.DataKeys[e.RowIndex].Value.ToString());

            vbl.DeleteCandidate(id);
            Response.Redirect("Admin");

        }

        protected void GridViewVoterList_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(GridViewVoterList.DataKeys[e.RowIndex].Value.ToString());
            Session["VoterId"] = id;
            Response.Redirect("MakeCandidate");
            //lblStatus.Text = "Voter with id: " + id + " successfully added to candidate list.";

        }
       
    }
}