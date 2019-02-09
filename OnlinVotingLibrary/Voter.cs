using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlinVotingLibrary
{
   public class Voter
    {
        private int _id;
        public int VoterId
        {
            get
            {
                return this._id;
            }
            set
            {
                this._id = value;
            }

        }
        public string FullName { get; set; }
        public string Email { get; set; }
        public int PhoneNumber { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string Password { get; set; }


        public void Register(int vid, string fName, string email, int phoneNumber,string gender,  DateTime dob, string password)
        {
            this._id = vid;
            FullName = fName;
            Email = email;
            PhoneNumber = phoneNumber;
            Gender = gender;
            DateOfBirth = dob;
            Password = password;
            
        }
        public string GetVoterDetails()
        {
            return "Name: " + this.FullName + "\nEmail: " + this.Email + "\n Phone Number: " + PhoneNumber + "\nVoter Id:" + this.VoterId;
        }
         
        public Boolean Login(string userName, string password)
        {
            //validate info 
            return true;
        }
        public void EditVoter(int vid, Voter vobj, string fName = null , string email = "", int phoneNumber = 123, string gender = "default", DateTime? dob=null, string password="")
        {

            this._id = vid;
            FullName = fName??vobj.FullName;
            Email = vobj.Email;
            PhoneNumber = vobj.PhoneNumber;
            Gender = vobj.Gender;
            DateOfBirth = vobj.DateOfBirth;
            Password = vobj.Password;
        }
    }
}
