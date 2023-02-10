
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="assets_1/css/erud_form.css"/>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="assets_1/css/swiper.min.css">
<link rel="stylesheet" type="text/css" href="assets_1/css/style-starter.css">
<link href="//fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;1,600&display=swap"
      rel="stylesheet">
<footer class="w3l-footer">
    <section class="footer-inner-main">
        <div class="footer-hny-grids py-5">
            <div class="container py-lg-4">
                <div class="text-txt">
                    <div class="right-side">
                        <div class="row footer-about">
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies"><img class="img-fluid" src="assets_1/images/banner1.png"
                                                      alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies"><img class="img-fluid" src="assets_1/images/banner2.png"
                                                      alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies"><img class="img-fluid" src="assets_1/images/banner3.png"
                                                      alt=""></a>
                            </div>
                            <div class="col-md-3 col-6 footer-img mb-lg-0 mb-4">
                                <a href="movies"><img class="img-fluid" src="assets_1/images/banner.png"
                                                      alt=""></a>
                            </div>
                        </div>
                        <div class="row footer-links">


                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Fashion</h6>
                                <ul>
                                    <li><a href="#">Entertainment</a></li>
                                    <li><a href="#">Videos</a></li>
                                    <li><a href="#">Collections</a></li>
                                    <li><a href="#">Tailor</a></li>
                                    <li><a href="#">Upcoming Collections</a></li>
                                    <li><a href="Contact_Us.jsp">Contact Us</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Information</h6>
                                <ul>
                                    <li><a href="home.jsp">Home</a> </li>
                                    <li><a href="about.html">About</a> </li>
                                    <li><a href="#">Fashion Show</a> </li>
                                    <li><a href="#">Blogs</a> </li>
                                    <li><a href="sign_in.html">Login</a></li>
                                    <li><a href="Contact_Us.jsp">Contact</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Locations</h6>
                                <ul>
                                    <li><a href="movies">Asia</a></li>
                                    <li><a href="movies">France</a></li>
                                    <li><a href="movies">Taiwan</a></li>
                                    <li><a href="movies">United States</a></li>
                                    <li><a href="movies">Korea</a></li>
                                    <li><a href="movies">United Kingdom</a></li>
                                </ul>
                            </div>
                            <div class="col-md-3 col-sm-6 sub-two-right mt-5">
                                <h6>Newsletter</h6>
                                <form action="#" class="subscribe mb-3" method="post">
                                    <input type="email" name="email" placeholder="Your Email Address" required="">
                                    <button><span class="fa fa-envelope-o"></span></button>
                                </form>
                                <p>Enter your email and receive the latest news, updates and special offers from us.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                            <!-- copyright -->

                <div class="container">
                    <div class="copyright-footer">
                        <div class="columns text-lg-left">
                            <p>&copy; 2023 MyFashionShop. All rights reserved</p>
                        </div>

                        <ul class="social text-lg-right">
                            <li><a href="#facebook"><span class="fa fa-facebook" aria-hidden="true"></span></a>
                            </li>
                            <li><a href="#linkedin"><span class="fa fa-linkedin" aria-hidden="true"></span></a>
                            </li>
                            <li><a href="#twitter"><span class="fa fa-twitter" aria-hidden="true"></span></a>
                            </li>
                            <li><a href="#google"><span class="fa fa-google-plus" aria-hidden="true"></span></a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
                    <!-- move top -->

            <button onclick="topFunction()" id="movetop" title="Go to top">
                <span class="fa fa-arrow-up" aria-hidden="true"></span>
            </button>
            <script>
                // When the user scrolls down 20px from the top of the document, show the button
                window.onscroll = function () {
                    scrollFunction()
                };

                function scrollFunction() {
                    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                        document.getElementById("movetop").style.display = "block";
                    } else {
                        document.getElementById("movetop").style.display = "none";
                    }
                }

                // When the user clicks on the button, scroll to the top of the document
                function topFunction() {
                    document.body.scrollTop = 0;
                    document.documentElement.scrollTop = 0;
                }
            </script>
                    <!-- /move top -->

        </div>
        </div>
        </div>


    </section>
</footer>
