using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OnlinVotingLibrary
{

    class DBClass
    {

        VoterProperties vp = new VoterProperties();
        static Hashtable hashtable = new Hashtable();
        string conStr;
        public DBClass()
        {
            conStr = System.Configuration.ConfigurationManager.ConnectionStrings["DBCS"].ToString();
        }
        public void AddData(VoterProperties vbc)
        {

            using (SqlConnection con = new SqlConnection(conStr))
            {

                SqlCommand command = new SqlCommand("spAddVoter", con);
                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("Id", vbc.VoterId);
                command.Parameters.AddWithValue("@FullName", vbc.FullName);
                command.Parameters.AddWithValue("@PhoneNumber", vbc.PhoneNumber.ToString());
                command.Parameters.AddWithValue("@Email", vbc.Email.ToString());
                command.Parameters.AddWithValue("Gender", vbc.Gender);
                command.Parameters.AddWithValue("@DateOfBirth", vbc.DateOfBirth);
                command.Parameters.AddWithValue("@Password", vbc.Password);
                command.Parameters.AddWithValue("@UserName", vbc.FullName);

                con.Open();
                int k = command.ExecuteNonQuery();
                con.Close();

            }

        }
        public DataSet GetVoterList(string searchTerm = null)
        {
            DataSet dataSet = new DataSet();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter();
                SqlParameter parameter = new SqlParameter();
                // da.SelectCommand = new SqlCommand("select * from tblEmployeees", con);
                if (string.IsNullOrEmpty(searchTerm))
                {
                    da.SelectCommand = new SqlCommand("select  V.Id, FullName, Email, PhoneNumber, Gender, DateOfBirth from tblVoter V full join tblCandidate C on V.Id = C.VoterId  where V.IsAdmin=0 and C.Id is  null", con);

                }
                else
                {
                    da.SelectCommand = new SqlCommand("select  V.Id, FullName, Email, PhoneNumber, Gender, DateOfBirth from tblVoter V full join tblCandidate C on V.Id = C.VoterId  where FullName like @searchTerm and V.IsAdmin=0 and C.Id is  null", con);
                    parameter.ParameterName = "@searchTerm";
                    parameter.Value = "%" + searchTerm + "%";
                    da.SelectCommand.Parameters.Add(parameter);


                }


                da.Fill(dataSet);



            }
            return dataSet;
        }
        public VoterProperties GetData(int voterId)
        {


            using (SqlConnection con = new SqlConnection(conStr))
            {
                string sqlQuery = "select * from tblVoter where Id=" + voterId;
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                con.Open();

                using (SqlDataReader rdr = cmd.ExecuteReader())
                {
                    if (rdr.Read())
                    {
                        vp.VoterId = Convert.ToInt32(rdr["Id"]);
                        vp.FullName = rdr["FullName"].ToString();
                        vp.Gender = rdr["Gender"].ToString();
                        vp.Password = rdr["Password"].ToString();
                        vp.DateOfBirth = Convert.ToDateTime(rdr["DateOfBirth"]);
                        vp.Email = rdr["Email"].ToString();
                        vp.PhoneNumber = rdr["PhoneNumber"].ToString();

                        return vp;
                    }
                }

                return vp;
            }
        }

        public bool EditVoterProperties(VoterProperties vbc)
        {

            using (SqlConnection con = new SqlConnection(conStr))
            {

                SqlCommand command = new SqlCommand("spEditVoter", con);

                command.CommandType = CommandType.StoredProcedure;

                command.Parameters.AddWithValue("Id", vbc.VoterId);
                command.Parameters.AddWithValue("@FullName", vbc.FullName);
                command.Parameters.AddWithValue("@PhoneNumber", vbc.PhoneNumber.ToString());
                command.Parameters.AddWithValue("@Email", vbc.Email.ToString());
                command.Parameters.AddWithValue("Gender", vbc.Gender);
                command.Parameters.AddWithValue("@DateOfBirth", vbc.DateOfBirth);
                command.Parameters.AddWithValue("@Password", vbc.Password);
                command.Parameters.AddWithValue("@UserName", vbc.FullName);

                con.Open();
                int k = command.ExecuteNonQuery();

                con.Close();

            }


            return true;

        }
        public bool DeleteVoter(int voterId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {


                SqlCommand cmd = new SqlCommand("spDeleteVoter", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Id", voterId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                //da.SelectCommand.CommandType = CommandType.StoredProcedure;
                //da.SelectCommand.Parameters.AddWithValue("@EmployeeId", voterId);
                // da.Fill(ds);
                //da.Fill(ds, "myData");
                //DataRow row = ds.Tables["myData"].Rows[voterId];
                //row.Delete();
                //da.Update(ds);
                return true;
            }
        }
        public string MakeCandidate(int voterId, int candidateId, int position)

        {

            using (SqlConnection con = new SqlConnection(conStr))
            {

                try
                {
                    SqlCommand cmd = new SqlCommand("insert into tblCandidate values(" + candidateId + "," + voterId + "," + position + ")", con);
                    // cmd.CommandType = CommandType.StoredProcedure;
                    // cmd.Parameters.AddWithValue("@Id", VoterId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    return null;
                }
                catch (SqlException ex)
                {
                    if (ex.Number.Equals(80131904))
                    {
                        return "Please Unique Candidate Id.";
                    }
                    else
                    {
                        return "Error adding Candidate, Please Check Details and  try Again.";
                    }

                }


            }
        }
        public DataSet GetCandidateList()
        {
            DataSet dataSet = new DataSet();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlDataAdapter da = new SqlDataAdapter();
                // da.SelectCommand = new SqlCommand("select * from tblEmployeees", con);

                da.SelectCommand = new SqlCommand("select C.Id, V.FullName as Name, P.Name as Position from tblCandidate C inner join tblVoter V on V.Id= C.VoterId inner join tblPosition P on C.PositionId=P.Id", con);


                da.Fill(dataSet);

            }
            return dataSet;


        }
        public void DeleteCandidate(int candidateId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {


                SqlCommand cmd = new SqlCommand("delete from tblCandidate where Id=@candidateId", con);
                SqlParameter parameter = new SqlParameter();
                cmd.Parameters.AddWithValue("@candidateId", candidateId);

                // cmd.CommandType = CommandType.StoredProcedure;
                // cmd.Parameters.AddWithValue("@Id", VoterId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            }

            //    DataSet dataSet = new DataSet();
            //    using (SqlConnection con = new SqlConnection(conStr))
            //    {
            //        SqlDataAdapter da = new SqlDataAdapter();

            //        da.SelectCommand = new SqlCommand("select * from tblCandidate", con);

            //        da.Fill(dataSet,"CandidateTable");
            //        DataRow[] dr = dataSet.Tables["CandidateTable"].Select(string.Format("Id ='{0}' ", candidateId));
            //        dr[0].Delete();
            //        da.Update(dataSet);
            //    }

        }
        public bool Voting(DataTable dt)
        {

            try
            {
                DataRow rw = dt.Rows[0];
                DoVoting(Convert.ToInt32(rw["VoterId"]), Convert.ToInt32(rw["President"]));
                DoVoting(Convert.ToInt32(rw["VoterId"]), Convert.ToInt32(rw["Vice-President"]));
                DoVoting(Convert.ToInt32(rw["VoterId"]), Convert.ToInt32(rw["Secretary"]));
                DoVoting(Convert.ToInt32(rw["VoterId"]), Convert.ToInt32(rw["Treasurer"]));
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public void DoVoting(int VoterId, int CandidateId)
        {
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand command = new SqlCommand("insert into tblVoting (VoterId, CandidateId) values (@VoterId, @CandidateId)", con);
                command.Parameters.AddWithValue("@VoterId", VoterId);
                command.Parameters.AddWithValue("@CandidateId", CandidateId);

                con.Open();
                command.ExecuteNonQuery();

                con.Close();

            }
        }
        public DataTable GetVotingResult()
        {
            DataTable dt = new DataTable();
            DataTable dtt = new DataTable();
            using (SqlConnection con = new SqlConnection(conStr))
            {
                try
                {
                    SqlCommand command = new SqlCommand("spGetVotingResult", con);
                    command.CommandType = CommandType.StoredProcedure;
                    con.Open();
                    SqlDataReader rdr = command.ExecuteReader();
                   
                  
                    dt.Load(rdr);
                   //var  results = from myRow in dt.AsEnumerable()
                   //               where myRow.Field<string>("Name") == "President"
                   //               select myRow;
                   // foreach (DataRow row in results)
                   // {
                   //     dtt.ImportRow(row);
                   // }
                    con.Close();
                   
                }
                catch
                {
                    return null;
                }

            }
            return dt;
        }
    }
}
