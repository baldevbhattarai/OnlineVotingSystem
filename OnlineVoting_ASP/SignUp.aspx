<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OnlineVoting_ASP.SignUp1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container">
        <div id="SignUp" runat="server">
            <div class="panel panel-primary">
                <div class="panel-heading panel-heading-custom">
                    <h3 class="panel-title">Register Voter</h3>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:Label ID="lblFullName" runat="server" Text="Full Name" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorFullName" ForeColor="Red" Text="*" runat="server" ErrorMessage="Full Name is Required" ControlToValidate="txtFullName"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtFullName" runat="server" placeholder="Enter Full Name" Class="form-control"></asp:TextBox>
                    </div>
                    <br />
                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="Email" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ForeColor="Red" Text="*" runat="server" ErrorMessage="Email is required." ControlToValidate="txtEmail">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" Text="*" ForeColor="Red" ErrorMessage="Invalid Email" ValidationExpression="[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~.-]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your Email" Class="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPhoneNumber" ForeColor="Red" Text="*" runat="server" ErrorMessage="Phone Number is required." ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>

                        <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="Enter your PhoneNumber" Class="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblVoterId" runat="server" Text="Voter Id" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorVoterId" ForeColor="Red" Text="*" runat="server" ErrorMessage="Voter Id is required." ControlToValidate="txtVoterId"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtVoterId" runat="server" placeholder="Enter your Voter Id" Class="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblGender" runat="server" Text="Gender" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" Text="*" runat="server" ErrorMessage="Gender is required." ControlToValidate="RadioButtonListGender"></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="RadioButtonListGender" RepeatDirection="Horizontal" runat="server" CssClass="form-control" Font-Names="arial">
                            <asp:ListItem Text="Male" Value="male"></asp:ListItem>
                            <asp:ListItem Text="Female" Value="female"></asp:ListItem>

                        </asp:RadioButtonList>

                    </div>

                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblDOB" runat="server" Text="Date Of Birth" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDateOfBirth" ForeColor="Red" Text="*" runat="server" ErrorMessage="Date of Birth is required." ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtDOB" runat="server" type="date" placeholder="Enter your Date Of Birth" Class="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="Password" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" ForeColor="Red" Text="*" runat="server" ErrorMessage="Password is required." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="Enter Password" Class="form-control"></asp:TextBox>
                    </div>
                    <br />

                    <div class="form-group">
                        <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm Password" CssClass="control-label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorCinformPassword" ForeColor="Red" Text="*" runat="server" ErrorMessage="Confirm Password field is required." ControlToValidate="txtConfirmPassword"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" placeholder="Cinfirm Password" Class="form-control"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidatorPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" ForeColor="red" ErrorMessage="Password and Confirm Password didn't match."></asp:CompareValidator>
                    </div>
                    <br />

                    <div class="panel-footer submitt-button-div">
                        <ul>
                            <li>
                                <asp:Button ID="btnSignUp" runat="server" class="btn btn-primary" type="submit" Text="Sign Up" Font-Italic="True" OnClick="btnSignUp_Click" />
                            </li>
                            <li class="right-button">Already have an Account?
                                <a href="Login.aspx" class="btn btn-primary">Sign IN</a>
                            </li>

                        </ul>
                    </div>

                </div>

            </div>
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            <asp:ValidationSummary ID="ValidationSummary1" HeaderText="Please correct following first." ForeColor="Red" runat="server" />

        </div>

    </div>

</asp:Content>
