<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="OnlineVoting_ASP.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <%--<link rel="stylesheet" href="bootstrap-4.2.1-dist/css/bootstrap.min.css" />--%>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">--%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="Scripts/jquery-3.3.1.min.js"></script>
    <link rel="shortcut icon" href="vote.ico" />
    <link rel="stylesheet" type="text/css" href="mystyle.css">
    <title>Election Commissioner</title>


    <script>
        $(document).ready(function () {
            //alert("hello world!");
            $.ajax({
                type: 'GET',
                url: 'http://localhost:59994/api/values',
                dataType: 'json',
                   headers: {
                        'Authorization': 'Basic ' + btoa(11 + ':' + 'a')
                    },
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class="row justify-content-around; data-row border border-light">
            <div class="col-sm-6 form-inline">
                <div class="form-group mb-2">
                    <h3>List of users</h3>

                </div>
                <div class="form-group mx-sm-3 mb-2">

                    <asp:TextBox ID="txtSearchBox" CssClass="form-control" placeholder="Search User" runat="server"></asp:TextBox>

                </div>
                <div class="mb-2" style="display: inline-block">
                    <asp:Button ID="Button1" class="btn btn-secondary" runat="server" Text="Button" OnClick="Button1_Click" />

                </div>
            </div>

            <hr />
            <asp:GridView ID="GridViewVoterList" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="16px" DataKeyNames="Id" OnRowDeleting="GridViewVoterList_RowDeleting" OnRowEditing="GridViewVoterList_RowEditing" Width="100%" OnRowUpdating="GridViewVoterList_RowUpdating">



                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
                <Columns>
                    <asp:TemplateField ShowHeader="true" HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnMakeCandidate" ControlStyle-CssClass="btn btn-primary" runat="server" CommandName="Update" Text="Make Candidate" />
                            <asp:Button ID="btnEdit" runat="server" ControlStyle-CssClass="btn btn-primary" CommandName="Edit" Text="Edit" />
                            <asp:Button ID="btnDelete" runat="server" ControlStyle-CssClass="btn btn-primary" CommandName="Delete" Text="Delete" />
                        </ItemTemplate>

                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

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
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>

        </div>
        <div class="row  justify-content-around start-election-row">
            <div class="col-sm-6">
                <h3>List of Candidate</h3>
                <hr>
                <asp:GridView ID="GridViewCandidateList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="Id" OnRowDeleting="GridViewCandidateList_RowDeleting" OnRowEditing="GridViewCandidateList_RowEditing" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <PagerTemplate>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" />
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                    </PagerTemplate>
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    <Columns>
                        <asp:TemplateField ShowHeader="true" HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" ControlStyle-CssClass="btn btn-primary" CommandName="Edit" Text="Edit" />
                                <asp:Button ID="btnDelete" runat="server" ControlStyle-CssClass="btn btn-primary" CommandName="Delete" Text="Delete" />

                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>

                </asp:GridView>

            </div>
            <div class="col-12 col-sm-5 ">
                <div>
                    <div>
                        <h3>Start/Stop Election Process</h3>
                    </div>
                    <hr />
                    <div class="start-election-block">
                        <p>Election is in progress..</p>
                        <h2><time>00:00:00</time></h2>
                        <button id="start" onclick="startFunction()" class="btn btn-primary">START</button>
                        <button id="stop" onclick="stopFunction()" class="btn btn-primary ">STOP</button>
                        <button id="clear" onclick="clearFunction()" class="btn btn-default">RESET </button>
                    </div>
                </div>

            </div>
        </div>

        <div class="election-result">
            <h2>Live Voting Results </h2>
            <asp:GridView ID="GridViewVotingResult" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Width="100%" Height="260px">
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

    </div>

</asp:Content>
