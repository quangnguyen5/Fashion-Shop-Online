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
                            <c:forEach items="${sessionScope.list4product}" var="p">
                                <div class="col-md-2 product-down">
                                    <div class="row">
                                        <div class="product-item">
                                            <div class="product-top">
                                                <div class="reviews-rating">

                                                    <c:forEach var="i" begin="0" end="4">
                                                        <c:if test="${(p.rated_star - i) >= 1}">
                                                            <div class="reviews-rating__star is-active"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) < 1 && (p.rated_star - i) > 0}">
                                                            <div class="reviews-rating__star is-active is-half"></div> 
                                                        </c:if>
                                                        <c:if test="${(p.rated_star - i) <= 0}">
                                                            <div class="reviews-rating__star"></div> 
                                                        </c:if>

                                                    </c:forEach>

                                                </div>
                                                <a href="" class="product-thumb">
                                                    <a href="list-detail?productId=${p.id}&categoryId=${p.category_id}">
                                                        <img src="${p.image}" height="365px" width="230px" alt="">
                                                    </a>


                                                </a>
                                                <a href="addcart?productId=${p.id}" class="buy-now" >Mua ngay</a>

                                            </div>
                                            <div class="product-infor">
                                                <a href="" class="product-name">${p.name}</a>
                                                <div class="product-price">
                                                    <c:if test="${p.sale_price != 0}">
                                                        ${p.sale_price}đ
                                                        <del>${p.original_price}đ</del>
                                                    </c:if>
                                                    <c:if test="${p.sale_price == 0}">
                                                        ${p.original_price}đ
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
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
       s  
                <%@include file="components/footer.jsp" %>
                </body>
                </html>