using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlinVotingLibrary
{
    public class VoterProperties
    {
        private int _adminId;
        private int _voterId;
        public int VoterId
        {
            get
            {
                return this._voterId;
            }
            set
            {
                this._voterId = value;
            }

        }
        public int AdminId
        {
            get
            {
                return this._adminId;
            }
            set
            {
                this._adminId = value;
            }

        }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
