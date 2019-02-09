<%@ Page Title="" Language="C#" MasterPageFile="~/Primary.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="OnlineVoting_ASP.HomePage" %>

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

        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active carousel-image-div">
                    <img src="la.jpg" alt="your vote matters" style="width: 100%;">
                    <div class="carousel-caption carousel-caption-custom">
                        <h2>Your Vote matters</h2>
                    </div>
                </div>

                <div class="item carousel-image-div">
                    <img src="chicago.jpg" alt="Don't vote, Don't complain." style="width: 100%;">
                    <div class="carousel-caption carousel-caption-custom">
                        <h2>Don't Vote, Don't Complain</h2>
                    </div>
                </div>

                <div class="item carousel-image-div">
                    <img src="ny.jpg" alt="Find Out about registering to vote online" style="width: 100%;">
                    <div class="carousel-caption carousel-caption-custom">
                        <h2>Find Out about registering to vote online</h2>
                    </div>
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <div class="container clearfix">
            <div>
                <div class="row ">
                    <div class="row justify-content-around banner-title-container">

                        <div class="col-12 col-sm-4 col-md-6 col-lg-3  ">
                            <div class="col-sm-12 banner-title">
                                <ul>
                                    <li>
                                        <h2>Register to Vote</h2>

                                        <div align="center" class="button-secton" title="Apply Now">
                                            <asp:Button ID="Button1" class="btn-common waves-attach btn btn-default btn-md btn1 waves-effect" runat="server" Text="Apply Now" OnClick="Button1_Click" />
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class=" col-12 col-sm-4 col-md-6 col-lg-3 ">
                            <div class="col-sm-12 banner-title">
                                <ul>
                                    <li>
                                        <h2>Check Voting Status</h2>

                                        <div align="center" class="button-secton" title="check voting status">
                                            <asp:Button ID="Button2" class="btn-common waves-attach btn btn-default btn-md btn1 waves-effect" runat="server" Text="Check Status" OnClick="Button2_Click" />
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>
                        <div class=" col-12 col-sm-4 col-md-6 col-lg-3 ">
                            <div class="col-sm-12 banner-title">
                                <ul>
                                    <li>
                                        <h2>View Latest Result</h2>

                                        <div align="center" class="button-secton" title="view voting results">
                                            <asp:Button ID="Button3" class="btn-common waves-attach btn btn-default btn-md btn1 waves-effect" runat="server" Text="View Results" OnClick="Button3_Click" />
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <hr />
        <footer class="panel-footer">
            <section id="footer">
                <div class="container">
                    <div class="row text-center text-xs-center text-sm-left text-md-left">
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Company</h5>
                            <ul class="list-unstyled quick-links">
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Home</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>About Us</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Contact Us</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Privacy Policy</a></li>

                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Information</h5>
                            <ul class="list-unstyled quick-links">
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Calloway at Las Colinas</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Phone: +(409)1231234</a></li>
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>Email:abc.def@gmail.com</a></li>

                            </ul>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <h5>Supports</h5>
                            <ul class="list-unstyled quick-links">
                                <li><a href="javascript:void();"><i class="fa fa-angle-double-right"></i>FAQ</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
                            <ul class="list-unstyled list-inline social text-center">
                                <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-facebook-square fa-4x"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-twitter"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-instagram"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void();"><i class="fa fa-google-plus"></i></a></li>
                                <li class="list-inline-item"><a href="javascript:void();" target="_blank"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                        <hr />
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-2 text-center text-white">
                            <h4>Copyright &copy; 2018 Online Voting System. All Right Reserved.</h4>
                        </div>
                        <hr />
                    </div>
                </div>
            </section>
        </footer>
    </div>
</asp:Content>
