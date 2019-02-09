using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlinVotingLibrary;

namespace OnlineVoting_ASP
{
    public partial class MakeCandidate : System.Web.UI.Page
    {
        VoterBusinessLogic vbl = new VoterBusinessLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtVoterId.Text = Convert.ToInt32(Session["VoterId"]).ToString();
            txtVoterId.Enabled = false;
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            int vId = Convert.ToInt32(Session["VoterId"]);
            int cId = Convert.ToInt32(txtCandidateId.Text);
            int position = Convert.ToInt32(RadioButtonListPosition.SelectedValue);
            string addStatus = vbl.MakeCandidate(vId, cId, position);
            if (string.IsNullOrEmpty(addStatus))
            {
                Response.Redirect("Admin");

            }
            else
            {
                lblAddStatus.Text = addStatus;
                lblAddStatus.ForeColor = System.Drawing.Color.Red;
            }


        }
    }
}