<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
        <link rel="stylesheet" href="./assets/css/style.css">
        <link rel="stylesheet" href="./assets/fonts/themify-icons/themify-icons.css">
        <%@include file="components/javascript.jsp" %>
    </head>
    <body>
        <div id="main">

            <%@include file="components/header.jsp" %>
            <%@include file="components/account.jsp" %>
            <!--Slider-->

            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel" >
                    <div class="carousel-indicators">
                        <!-- slider img -->

                    </div>

                    <div class="carousel-inner">

                        <!-- slider img -->

                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>



            <!-- Content -->
            <div id="content">
                <div class="content-section background-product" style="width: 1500px">


                    <!-- Base Product -->
                    <h2 class="section-heading">Danh sách sản phẩm</h2>
                    <div  class="container-fluid">
                        <div class="row">

                        </div>
                    </div>
                </div>


                <div class="content-Category-section background-product"><!--

                    <!-- Product list -->
                    <h2 class="section-heading">Sản phẩm nổi bật</h2>
                    <div class="category-list">
                        <a href="list?&categoryId=1"><div class="category-item category-img" style="background: url('images/ao-thun-co-tron-hieu-nike.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Áo</div>
                            </div></a>

                        <a href="list?&categoryId=2"><div class="category-item category-img" style="background: url('images/quan-jean-nam.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Quần</div>
                            </div></a>

                        <a href="list?&categoryId=3"><div class="category-item category-img" style="background: url('images/giay_dep.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Giày Dép</div>
                            </div></a>

                        <a href="list?&categoryId=4"><div class="category-item category-img" style="background: url('images/phu_kien.jpg')
                                                          top center / cover no-repeat">
                                <div class="category-content">Phụ kiện</div>
                            </div></a>

                        <div class="clear"></div>
                    </div> 
                </div>
                <!-- Blog -->
                <div class="blog-section">
                    <div class="content-section">
                        <h2 class="section-heading text-white">Chúng tôi luôn mang đến những công nghệ hiện đại nhất</h2>
                        <p class="section-sub-heading text-white">Với mong muốn lan tỏa niềm đam mê thời trang đến với mọi người </p> 

                        <!-- blog list hot -->
                        <div class="blog-list">

                            <div class="clear"></div>
                        </div> 
                    </div>

                </div>   
                <%@include file="components/footer.jsp" %>
                </body>
                </html>