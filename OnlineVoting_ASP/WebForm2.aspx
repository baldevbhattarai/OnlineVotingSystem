<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="OnlineVoting_ASP.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.3.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                
                url: 'VoterService.asmx/GetVotingResult',
                //data: '{}',
                //contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "GET",
                success: function (data) {
                    debugger;
                    $().each(data, function (index, row) {
                        alert("position: " + row.Votes);
                        //resultTable.append('<tr><td>' + row.Candidate + '</td><td>'
                        //    + row.Candidate + '</td><td>' + row.Votes
                        //    + '</td><td>' + row.Position + '</td></tr>');
                    });
                },
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
