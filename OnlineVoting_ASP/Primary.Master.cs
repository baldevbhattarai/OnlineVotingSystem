using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineVoting_ASP
{
    public partial class Primary : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        public Panel AfterLogInPanelControl
        {
            get
            {
            return PanelAfterLogin;
            }
        }
        public Panel BeforeLogInPanelControl
        {
            get
            {
                return PanelBeforeLogin;
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["VoterId"] = null;
            Response.Redirect("HomePage");
        }
    }
}