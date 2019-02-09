<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="UserPage.aspx.cs" Inherits="OnlineVoting_ASP.UserPage" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ MasterType VirtualPath="~/Primary.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--<link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />-->
    <%--<link rel="stylesheet" href="bootstrap-4.2.1-dist/css/bootstrap.min.css" />--%>
    <link rel="shortcut icon" href="vote.ico" />
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <title>User Page</title>
    <%--<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
    <%--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>--%>
    <script src="Scripts/jquery-3.3.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            
            $.ajax({
               
                type: "post",
                
                url: 'VoterService.asmx/GetVotingResult',
                //data: '{}',
                //contentType: "application/xml; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var resultTable = $('#tblVotingResult tbody');
                    resultTable.empty();
                    var id = $(data).find("Votes").first().text();
                    //var xmlDoc = $.parseXML(data);
                    //var xml = $(xmlDoc);
                    //var voters = xml.find("Table");

                    //$(data).find("VotingResult").each(function (index, row) {
                    //    alert(id);

                    //    resultTable.append('<tr><td>' + $(this).find("CandidateId").first().text() + '</td><td>'
                    //        + $(this).find("CandidateName").first().text() + '</td><td>' + $(this).find("Votes").first().text()
                    //        + '</td><td>' + $(this).find("Position").first().text() + '</td></tr>');
                    //    debugger;
                    //});
                    $(data).each(function (index, emp) {
                       // debugger;
                       // alert(emp.CandidateId);
                            resultTable.append('<tr><td>' + emp.CandidateId + '</td><td>'
                                + emp.CandidateName + '</td><td>' + emp.Votes
                                + '</td><td>' + emp.Position + '</td></tr>');
                        });
                },
                failure: function (response) {
                    debugger;
                    alert(response);
                },
                error: function (response) {
                    debugger;
                    alert(response);
                }
            });
        });

        //function OnSuccess(response) {
        //    alert("success!!");
        //var xmlDoc = $.parseXML(response.d);
        //var xml = $(xmlDoc);
        //var voters = xml.find("Table");
        //var row = $("[id*=gvResult] tr:last-child").clone(true);
        //$("[id*=gvResult] tr").not($("[id*=gvResult] tr:first-child")).remove();
        //    $.each(function (index, resultRow) {
        //    var voters = $(this);
        //    $("td", row).eq(0).html("Hello");
        //    //$("td", row).eq(1).html($(this).find("Candidate Id").text());
        //    //$("td", row).eq(2).html($(this).find("Votes").text());
        //    //$("td", row).eq(3).html($(this).find("Position").text());
        //    $("[id*=gvResult]").append(row);
        //    row = $("[id*=gvResult] tr:last-child").clone(true);
        //});
        //}

        //function OnSuccess(response) {
        //    var resultTable = $('#tblVotingResult tbody');
        //    resultTable.empty();

        //    $(response).each(function (index, row) {
        //        alert(row.Votes + row.Position);
        //        resultTable.append('<tr><td>' + row.Candidate + '</td><td>'
        //            + emp.Candidate + '</td><td>' + emp.Votes
        //            + '</td><td>' + emp.Position + '</td></tr>');
        //    });

        //}

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row justify-content-between up-first-row">
            <div class="col-sm-5 edit-profile-block">
                <h2>Check/Edit Profile</h2>
                <hr />
                <p>
                    Hello,
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    <br />
                    Voting Id:<asp:Label ID="lblVoterId" runat="server" Text=""></asp:Label>
                </p>
                <p>Correct your information before going for voting.</p>
                <asp:Button ID="btnEditDetail" runat="server" Text="Check/Edit Info" OnClick="btnEditDetail_Click" UseSubmitBehavior="False" />
                <input id="btnEditDetail1" type="button" value="button" />
            </div>
            <div class="col-sm-6 up-electiontime-block ">
                <div>
                    <h2>Voting Time status:</h2>
                    <hr />
                    <p>Don't lose your right to vote favourite candidate.</p>
                    <h2><time>00:00:00</time></h2>
                </div>
            </div>
        </div>
        <div class="row voting-panel">

            <div class="vote-form ">
                <div class="panel-heading  ">
                    <h2>Vote Your Favourite Candidate</h2>
                    <hr />
                </div>
                <div class="form-group vote-form-section">
                    <div class="form-group">
                        <asp:Label ID="lblPresident" runat="server" Text="Choose President" Font-Size="Larger"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPosition" ValidationGroup="VotingValidation" ForeColor="Red" Text="*" runat="server" ErrorMessage="Required." ControlToValidate="RadioButtonListPresident"></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="RadioButtonListPresident" runat="server" CssClass="form-control" Font-Names="arial" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>


                    </div>
                </div>
                <div class="form-group vote-form-section">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" Text="Choose Vice President" Font-Size="Larger"></asp:Label>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="VotingValidation" ForeColor="Red" Text="*" runat="server" ErrorMessage="Required." ControlToValidate="RadioButtonListVicePresident"></asp:RequiredFieldValidator>

                        <asp:RadioButtonList ID="RadioButtonListVicePresident" runat="server" CssClass="form-control" Font-Names="arial" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>

                    </div>
                </div>
                <div class="form-group vote-form-section">
                    <div class="form-group">
                        <asp:Label ID="Label2" runat="server" Text="Choose Secretary" Font-Size="Larger"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ValidationGroup="VotingValidation" Text="*" runat="server" ErrorMessage="Required." ControlToValidate="RadioButtonListSecretary"></asp:RequiredFieldValidator>

                        <asp:RadioButtonList ID="RadioButtonListSecretary" runat="server" CssClass="form-control" Font-Names="arial" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>

                    </div>
                </div>
                <div class="form-group vote-form-section">
                    <div class="form-group">
                        <asp:Label ID="Label3" runat="server" Text="Choose Treasurer" Font-Size="Larger"></asp:Label>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ValidationGroup="VotingValidation" Text="*" runat="server" ErrorMessage="Required." ControlToValidate="RadioButtonListTreasurer"></asp:RequiredFieldValidator>

                        <asp:RadioButtonList ID="RadioButtonListTreasurer" runat="server" CssClass="form-control" Font-Names="arial" RepeatDirection="Horizontal">
                        </asp:RadioButtonList>
                    </div>
                </div>
                <asp:Label ID="lblVoteSubmissionStatus" runat="server" Text=""></asp:Label>
                <div>
                    <asp:Button ID="Button1" class="btn btn-primary" runat="server" CausesValidation="true" ValidationGroup="VotingValidation" type="" Text="Submit Vote" OnClick="Button1_Click" />
                </div>

            </div>

        </div>
        <div class="row" style="height: auto;">
            <div class="election-result">
                <h2>Live Voting Results </h2>
                <hr />
                <asp:GridView ID="GridViewResult" runat="server" CellPadding="3" Height="347px" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
            <div>
                <asp:GridView ID="gvResult" runat="server"></asp:GridView>
            </div>
            <div>
                <table id="tblVotingResult" border="1" style="border-collapse: collapse">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Salary</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
            <div class="col-sm-6" style="padding: 1%">
                <h2>Result Charts</h2>
                <hr />

                <asp:Chart ID="Chart1" runat="server" Height="490px" Width="947px">
                    <Titles>
                        <asp:Title Text="Election Result">
                        </asp:Title>
                    </Titles>
                    <Series>
                        <asp:Series Name="series1" ChartType="Bar" XValueMember="Position" YValueMembers="Votes" LegendText="president" IsValueShownAsLabel="false" ChartArea="ChartArea1" MarkerBorderColor="YellowGreen">
                        </asp:Series>
                        <%--<asp:Series Name="Series2" ChartType="Bar" XValueMember="vPosition" YValueMembers="Votes" LegendText="vpresident" IsValueShownAsLabel="false" ChartArea="ChartArea1" MarkerBorderColor="YellowGreen"></asp:Series>--%>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <AxisX Title="Candidate Name"></AxisX>
                            <AxisY Title="Votes Acquired"></AxisY>
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>


            </div>
        </div>
    </div>
</asp:Content>
