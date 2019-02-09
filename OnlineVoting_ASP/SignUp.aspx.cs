using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlinVotingLibrary;
namespace OnlineVoting_ASP
{
    public partial class SignUp1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                VoterBusinessLogic vbl = new VoterBusinessLogic();
                VoterProperties voter = new VoterProperties();
                voter.FullName = txtFullName.Text;
                voter.Email = txtEmail.Text;
                voter.PhoneNumber = txtPhoneNumber.Text;
                voter.VoterId = Convert.ToInt32(txtVoterId.Text);
                voter.Gender = RadioButtonListGender.SelectedValue;
                voter.DateOfBirth = Convert.ToDateTime(txtDOB.Text);

                voter.Password = txtPassword.Text;

                vbl.Register(voter);

                lblMessage.Text = "Voter with Id, " + voter.VoterId + " has been added successfully.";
                lblMessage.ForeColor = System.Drawing.Color.Green;

            }
        }
    }
}