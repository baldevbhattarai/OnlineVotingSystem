using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;

namespace OnlineVoting_ASP
{
    /// <summary>
    /// Summary description for VoterService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class VoterService : System.Web.Services.WebService
    {

        [WebMethod]
        
        public void GetVotingResult()
        {
            DataTable dt = new DataTable();
            DataTable dtt = new DataTable();
            DataSet ds = new DataSet();
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ToString();
            List<VotingResult> votingResultList = new List<VotingResult>();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                try
                {
                    SqlDataAdapter da = new SqlDataAdapter();
                    SqlCommand command = new SqlCommand("spGetVotingResult", con);
                    command.CommandType = CommandType.StoredProcedure;
                    da.SelectCommand = command;
                    con.Open();
                    
                    da.Fill(ds);


                    con.Close();

                }
                catch
                {
                   // return null;
                }

            }
            // return ds.GetXml();

            JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(ds.Tables[0]));
            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            //List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            //Dictionary<string, object> row;
            //foreach (DataRow dr in ds.Tables[0].Rows)
            //{
            //    row = new Dictionary<string, object>();
            //    foreach (DataColumn col in ds.Tables[0].Columns)
            //    {
            //        row.Add(col.ColumnName, dr[col]);
            //    }
            //    rows.Add(row);
            //}
           
            List<VotingResult> votingResult = new List<VotingResult>();
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                VotingResult vtr = new VotingResult();
               vtr.CandidateId = dr["Candidate Id"].ToString();
                vtr.CandidateName = dr["Candidate Name"].ToString();
                vtr.Votes = dr["Votes"].ToString() ;
                vtr.Position = dr["Position"].ToString();
                votingResult.Add(vtr);
            }
            //return votingResult;
            // serializer.Serialize(votingResult);
            Context.Response.Write(js.Serialize(votingResult));
        }

    }
       
    public class VotingResult
    {
        public string CandidateName { get; set; }
        public string CandidateId { get; set; }
        public string Votes { get; set; }
        public string Position { get; set; }
    }
}
