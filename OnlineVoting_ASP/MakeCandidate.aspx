<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="MakeCandidate.aspx.cs" Inherits="OnlineVoting_ASP.MakeCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Log In</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="panel panel-primary">
            <div class="panel-heading panel-heading-custom">
                <h3 class="panel-title">Register Voter</h3>
            </div>
            <div class="panel-body">
                <div class="form-group">
                    <asp:Label ID="lblVoterId" runat="server" class="control-label" Text="Voter Id"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtVoterId" ErrorMessage="Enter voter Id." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtVoterId" placeholder="Enter Voter Id" class="form-control" runat="server" type="text"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblCandidateId" runat="server" class="control-label" Text="Candidate Id"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorCandidateId" runat="server" ControlToValidate="txtCandidateId" ErrorMessage="Enter Candidate Id." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtCandidateId" placeholder="Enter Candidate Id" class="form-control" runat="server" type="text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPosition" runat="server" Text="Position" CssClass="control-label"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPosition" ForeColor="Red" Text="*" runat="server" ErrorMessage="Position is required." ControlToValidate="RadioButtonListPosition"></asp:RequiredFieldValidator>
                    <asp:RadioButtonList ID="RadioButtonListPosition" RepeatDirection="Horizontal" runat="server" CssClass="form-control" Font-Names="arial">
                        <asp:ListItem Text="President" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Vice-President" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Secretary" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Treasurer" Value="4"></asp:ListItem>

                    </asp:RadioButtonList>

                </div>
                <asp:Label ID="lblAddStatus" runat="server" Text=""></asp:Label>
            </div>
            <div class="panel-footer submitt-button-div">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Create Candidate" OnClick="btnSignIn_Click" />
                  
            </div>
        </div>
    </div>
</asp:Content>
