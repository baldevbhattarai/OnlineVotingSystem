using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using OnlinVotingLibrary;

namespace OnlineVoting_API.Controllers
{
    [EnableCorsAttribute("*", "*", "*")]
    [BasicAuthentication]
    public class ValuesController : ApiController
    {
        // GET api/values
        public List<VoterProperties> Get()
        {
            VoterBusinessLogic vbl = new VoterBusinessLogic();
            DataSet ds = new DataSet();
             ds = vbl.GetVoterList();

            List<VoterProperties> voterList = new List<VoterProperties>();
            
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
               
                VoterProperties vp = new VoterProperties();
                //foreach (DataColumn col in ds.Tables[0].Columns)
                //{
                    vp.VoterId = Convert.ToInt32(dr["Id"]);
                    vp.FullName = dr["FullName"].ToString();
                    vp.Email = dr["Email"].ToString();
                vp.PhoneNumber = dr["PhoneNumber"].ToString();
                vp.Gender = dr["Gender"].ToString();
                vp.DateOfBirth = Convert.ToDateTime(dr["DateOfBirth"]);
                    //row.Add(col.ColumnName, dr[col]);
                //}
                voterList.Add(vp);
            }
            return voterList;
           // return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        public void Delete(int id)
        {
        }
    }
}
