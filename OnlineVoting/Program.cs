using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OnlinVotingLibrary;




namespace OnlineVoting
{

    class Program
    {
        enum Operation : int
        {
            Register = 0,
            Login = 1,
            Edit = 2,
            Delete = 3
        }
        static void Main()
        {
          
            /*  try
              {
                  try
                  {
                      Console.WriteLine("Enter First Number");
                      int FN = Convert.ToInt32(Console.ReadLine());


                      Console.WriteLine("Enter Second Number");
                      int SN = Convert.ToInt32(Console.ReadLine());


                      int Result = FN / SN;
                      Console.WriteLine("Result = {0}", Result);
                  }
                  catch (Exception ex)
                  {
                      string filePath = @"C:\Sample Files\Log1.txt";
                      if (File.Exists(filePath))
                      {
                          StreamWriter sw = new StreamWriter(filePath);
                          sw.Write(ex.GetType().Name + ex.Message + ex.StackTrace);
                          sw.Close();
                          Console.WriteLine("There is a problem! Plese try later");
                      }
                      else
                      {
                          //To retain the original exception pass it as a parameter
                          //to the constructor, of the current exception
                          throw new FileNotFoundException(filePath + " Does not Exist", ex);
                      }
                  }
              }
              catch (Exception ex)
              {
                  //ex.Message will give the current exception message
                  Console.WriteLine("Current or Outer Exception = " + ex.Message);


                  //Check if inner exception is not null before accessing Message property
                  //else, you may get Null Reference Excception
                  if (ex.InnerException != null)
                  {
                      Console.WriteLine("Inner Exception = "+ ex.InnerException.Message);
                  }
              }*/



            //{
            //    Console.WriteLine("Welcome to Online Voting Project.\nPress enter to get employee details.");
            //    Console.ReadKey();
            //    Program program = new Program();
            //    Voter voter1 = new Voter();
            //    voter1.Register(1, "Ram1 Bilas", "r.b@c.com", 409423, "Male", new DateTime(1991, 1, 18), "rambilas1");
            //    Console.WriteLine(voter1.GetVoterDetails());

            //    Console.WriteLine("*********voter2****************");

            //    Voter voter2 = new Voter();
            //    voter2.Register(2, "Ram2 Bilas", "r.b@c.com", 3209423, "Male", new DateTime(1992, 1, 18), "rambilas2");
            //    Console.WriteLine(voter2.GetVoterDetails());

            //    Console.WriteLine("***********Editing name of voter2**************");
            //    voter2.EditVoter(2, voter2, "Ram3 Bilas");
            //    Console.WriteLine(voter2.GetVoterDetails());
            //}

           
            string yesOrNo = "";
            int voterId;
            string  password;
            DateTime dob;
           
            Console.WriteLine("Welcome to Online Voting Project.\nPress enter to get employee details.");
            do
            {
                VoterProperties vp = new VoterProperties();
                VoterBusinessLogic vbl = new VoterBusinessLogic();
                Console.WriteLine("\n Please Enter \"1 to Register\"\t \"2 to Login\"\t \"3 to Edit\" and \"4 to Delete,  Voter.");
                int i = Convert.ToInt32(Console.ReadLine());
              
                
                switch (i)
                {

                    case 1:

                        Console.WriteLine("enter Voter Id");
                        vp.VoterId = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("enter Name");
                        vp.FullName = Console.ReadLine();
                        Console.WriteLine("enter Email");
                        vp.Email = Console.ReadLine();
                        Console.WriteLine("enter phone number");
                      //  vp.PhoneNumber = int.Parse(Console.ReadLine());
                        Console.WriteLine("enter gender");
                        vp.Gender = Console.ReadLine();
                        Console.WriteLine("enter Date of Birth");
                        Boolean x = DateTime.TryParse(Console.ReadLine(), out dob);
                        vp.DateOfBirth = dob;
                        Console.WriteLine("enter Password");
                        vp.Password = Console.ReadLine();
                        vbl.Register(vp);


                     //   Hashtable hashtable = vbl.GetVoterList();
                      //  DisplayVoters(hashtable);
                        break;
                    case 2:
                        Console.WriteLine("enter Voter Id to Login");
                        voterId = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("enter Password");
                        password = Console.ReadLine();
                        bool str = vbl.Login(voterId, password);
                        if (str)
                        {
                            Console.WriteLine("\nLogin Successful.");
                        }
                        else
                        {
                            Console.WriteLine("\nLogin failed.");
                        }


                      //   hashtable = vbl.GetVoterList();
                      ////  DisplayVoters(hashtable);
                        break;
                    case 3:
                        Console.WriteLine("Enter Voter Id to edit the voter's detail.");
                        voterId = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("enter Password");
                        password = Console.ReadLine();
                        bool bol = vbl.Login(voterId, password);
                        if (bol)
                        {
                            VoterProperties vpp = new VoterProperties() ;
                            Console.WriteLine("\n enter details to edit.");
                            vpp.VoterId  = voterId;
                            vpp.Password = password;
                            Console.WriteLine("enter full name if you wanna change");
                            vpp.FullName = Console.ReadLine();
                            Console.WriteLine("enter email if want to change");
                            vpp.Email = Console.ReadLine();
                            Console.WriteLine("enter phone number if want to change");
                            //vpp.PhoneNumber = Convert.ToInt32(Console.ReadLine());
                            Console.WriteLine("enter gender if want to change");
                            vpp.Email = Console.ReadLine();
                            Console.WriteLine("enter Date of Birth if want to change");
                             x = DateTime.TryParse(Console.ReadLine(), out dob);
                            vpp.DateOfBirth = dob;
                            
                            Console.WriteLine(vbl.EditVoter(vpp) ? "Edit Successful" : "Edit failed");
                            
                        }
                        else
                        {
                            Console.WriteLine("\nValidation failed for editing data.");
                        }
                       //  hashtable = vbl.GetVoterList();
                        //DisplayVoters(hashtable);
                       
                        break;
                    case 4:
                        Console.WriteLine("Enter Voter Id to Delete the voter.");
                        voterId = Convert.ToInt32(Console.ReadLine());
                        Console.WriteLine("enter Password");
                        password = Console.ReadLine();
                        bol = false;
                        bol = vbl.Login(voterId, password);
                        if (bol)
                        {
                            bol = false;
                            bol = vbl.DeleteVoter(voterId);
                            if (bol)
                            {
                                Console.WriteLine("Voter with id {0} successfully deleted.",voterId);
                            }else
                            {
                                Console.WriteLine("Voter with id {0} deletion failed.", voterId);

                            }
                        }
                        else
                        {
                            Console.WriteLine("\nValidation failed for deleting data.");
                        }
                       //  hashtable = vbl.GetVoterList();
                       // DisplayVoters(hashtable);
                     
                        break;
                    case 5:

                        break;
                    default:
                        break;

                }

                Console.WriteLine("Do you want to continue? yes or no");
                yesOrNo = Console.ReadLine();
            } while (yesOrNo.ToLower() != "no");

           
        }
        public static void DisplayVoters(Hashtable hashtable)
        {
            foreach (object key in hashtable.Keys)
            {
               
                Console.WriteLine(" ID: " + ((VoterProperties)hashtable[key]).VoterId + "\tfull name: " + ((VoterProperties)hashtable[key]).FullName + " \t" + "voter Date of Birth: " + ((VoterProperties)hashtable[key]).DateOfBirth);
            }

        }

    }

}
