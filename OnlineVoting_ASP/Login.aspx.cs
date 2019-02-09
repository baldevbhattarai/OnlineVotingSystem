using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlinVotingLibrary;

namespace OnlineVoting_ASP
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            int id = Convert.ToInt32(Session["VoterId"]);
            if (id != 0)
            {
                Response.Redirect("UserPage");

            }
            //Master.AfterLogInPanelControl.Visible = true;
            //Master.BeforeLogInPanelControl.Visible = false;

        }
        
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            VoterBusinessLogic vbl = new VoterBusinessLogic();
            int voterId = Convert.ToInt32(txtVoterId.Text);
            string password = txtPassword.Text;
            bool isLogInSuccess = vbl.Login(voterId, password);
            if (isLogInSuccess)
            {
                //lblMessage.Text = "Successfully Logged in.";
                //lblMessage.ForeColor = System.Drawing.Color.Green;
                Session["VoterId"] = voterId;
                //if (Session["role"]!=null)
                //{
                //    Response.Redirect("Admin");

                //}
                Response.Redirect("UserPage");
            }
            else
            {
                lblMessage.Text = "Log In failed.";
                lblMessage.ForeColor = System.Drawing.Color.Red;

            }


        }
    }
}