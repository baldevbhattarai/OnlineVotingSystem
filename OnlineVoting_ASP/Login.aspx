<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineVoting_ASP.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <link rel="shortcut icon" href="vote.ico" />
    <link rel="stylesheet" type="text/css" href="mystyle.css" />
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
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorVoterId" runat="server" ControlToValidate="txtVoterId" ErrorMessage="Enter voter Id." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtVoterId" placeholder="Enter Voter Id" class="form-control" runat="server" type="text"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Label ID="lblPassword" for="txtPassword" class="control-label" runat="server" Text="Password"></asp:Label>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter Password." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtPassword" placeholder="Password" class="form-control" runat="server" type="password"></asp:TextBox>
                </div>
            </div>
            <div class="panel-footer submitt-button-div">
                <ul>
                    <li>
                        <asp:Button ID="btnSignIn" class="btn btn-primary" runat="server" Text="SignIn" OnClick="btnSignIn_Click" />
                    </li>
                    <li class="right-button">
                        <p>Are you a new user?</p>
                        <a href="SignUp.aspx" class="btn btn-primary">Register Here</a>

                    </li>
                </ul>
            </div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
