using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlinVotingLibrary;

namespace OnlineVoting_ASP
{
    public partial class EditVoterDetails : System.Web.UI.Page
    {
        VoterBusinessLogic vbl = new VoterBusinessLogic();
        VoterProperties vp = new VoterProperties();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Session["VoterId"]);
            //string role = (Session["role"]).ToString();

            if (!IsPostBack)
            {
                
                if (id!=0)
                {
                   
                    vp = vbl.GetVoterDetails(id);

                    txtFullName.Text = vp.FullName;
                    txtEmail.Text = vp.Email;
                    txtPhoneNumber.Text = vp.PhoneNumber.ToString();
                    txtVoterId.Text = vp.VoterId.ToString();
                    txtDOB.Text = vp.DateOfBirth.ToShortDateString();
                    if (vp.Gender.ToLower() == "male") {
                    RadioButtonListGender.SelectedValue = "male";
                    }
                    else
                    {
                        RadioButtonListGender.SelectedValue = "female";

                    }
                    txtPassword.Text = vp.Password;
                    txtVoterId.Enabled = false;
                    //txtConfirmPassword.Visible = false;
                    //lblConfirmPassword.Visible = false;


                }
                else
                {
                    Response.Redirect("Login");
                }
            }

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
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
            bool isEditSuccess = vbl.EditVoter(voter);
            if (!string.IsNullOrEmpty(Session["role"] as string))
            {
                Response.Redirect("Admin");

            }
            else
            {
                Response.Redirect("UserPage");

            }

        }
    }
}