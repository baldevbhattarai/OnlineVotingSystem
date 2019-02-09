<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="OnlineVoting_API.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.3.1.js"></script>
    <script>
        $(document).ready(function(){
            //alert("hello world!");
            $.ajax({
                type: 'GET',
                url: 'api/Values',
                dataType: 'jsonp',
                success: function (data) {
                    alert("hello");
                    debugger;
                      var tblVoters = $('#tblVoters tbody');
                    tblVoters.empty();
                    $.each(data, function (index, emp) {
                      
                            tblVoters.append('<tr><td>' + emp.VoterId + '</td><td>'
                                + emp.FullName + '</td><td>' + emp.Email
                                + '</td><td>' + emp.PhoneNumber + '</td></tr>');
                        });
                },
                error: function (response) {
                    alert(response);
                }
               


            });

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                <div>
                <table id="tblVoters" border="1" style="border-collapse: collapse">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone Number</th>
                           
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
