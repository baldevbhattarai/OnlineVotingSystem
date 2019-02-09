using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace OnlinVotingLibrary
{
    public class VoterBusinessLogic
    {

       
        public void Register(VoterProperties vp)
        {
            DBClass dbc = new DBClass();
            vp.FullName = vp.FullName.ToUpper();
            vp.Email = vp.Email.ToLower();
            vp.Gender = vp.Gender.ToUpper();
            vp.DateOfBirth = vp.DateOfBirth;
            
            //encrypt password
            vp.Password = vp.Password;
            

            //send that data to dbclass

            dbc.AddData(vp);



        }
        public VoterProperties GetVoterDetails(int voterid)
        {
            DBClass dbc = new DBClass();
            return dbc.GetData(voterid);
        }
        public DataSet GetVoterList(string searchTerm = null)
        {
            DBClass dbc = new DBClass();
            return dbc.GetVoterList(searchTerm);
        }
        public Boolean Login(int voterId, string password)
        {
            DBClass dbc = new DBClass();
            VoterProperties vp;
            Boolean isLoginSuccess = false;
            vp = dbc.GetData(voterId);
            if (vp.Password == password)
            {
                isLoginSuccess = true;

            }
            else
            {
                isLoginSuccess = false;

            }
            return isLoginSuccess;
        }
        public bool EditVoter(VoterProperties vp)
        {
            DBClass dbc = new DBClass();
            bool isEditSuccess = dbc.EditVoterProperties(vp);
            return isEditSuccess;

        }
        public bool DeleteVoter(int voterId)
        {
            DBClass dbc = new DBClass();
            bool isDeleteSuccess;
            isDeleteSuccess = dbc.DeleteVoter(voterId);
            return isDeleteSuccess;
        }
        public string MakeCandidate(int voterId, int candidateId, int position)
        {

            DBClass dbc = new DBClass();
            return dbc.MakeCandidate(voterId, candidateId, position);
        }
        public DataSet GetCandidiateList()
        {
            DBClass dbc = new DBClass();
            return dbc.GetCandidateList();
        }

        public void DeleteCandidate(int candidateId)
        {
            DBClass dbc = new DBClass();
            dbc.DeleteCandidate(candidateId);
        }
        public bool Voteing(DataTable dt)
        {
            DBClass dbc = new DBClass();
           bool isVotingSuccess = dbc.Voting(dt);
            return isVotingSuccess;
        }
        public DataTable GetVotingResult()
        {
            DBClass dbc = new DBClass();
            
            return dbc.GetVotingResult();
        }
    }
}
