

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <!DOCTYPE html>
    <html lang="zxx">

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <link rel="stylesheet" href="./assets/css/style.css">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
            <meta name="description" content="" />
            <meta name="author" content="" />
            <link rel="stylesheet" href="./assets/css/style.css">
            <!-- Css Styles -->
            <link rel="stylesheet" href="do1/css/bootstrap.min.css" type="text/css">
            <link rel="stylesheet" href="do1/css/font-awesome.min.css" type="text/css">
            <link rel="stylesheet" href="do1/css/themify-icons.css" type="text/css">
            <link rel="stylesheet" href="do1/css/elegant-icons.css" type="text/css">
            <link rel="stylesheet" href="do1/css/owl.carousel.min.css" type="text/css">
            <link rel="stylesheet" href="do1/css/nice-select.css" type="text/css">
            <link rel="stylesheet" href="do1/css/jquery-ui.min.css" type="text/css">
            <link rel="stylesheet" href="do1/css/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="do1/css/style.css" type="text/css">
            <!-- Core theme CSS (includes Bootstrap)-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
            <%@include file="components/javascript.jsp" %>
        </head>

        <body>

            <%@include file="components/header.jsp" %>
            <%@include file="components/account.jsp" %>
            <!-- Shopping Cart Section Begin -->
            <section class="shopping-cart spad mt-5">
                <div class="container" style="max-width: 90%">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="cart-table">
                                <table>
                                    <thead>
                                        <tr>
                                            <th class="p-name">T??n s???n ph???m</th>
                                            <th>Gi?? ti???n</th>
                                            <th>S??? l?????ng</th>
                                            <th>T???ng ti???n</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:set var="costTotal" value="${0}" />

                                        <c:forEach items="${listCart}" var="c">
                                            <tr>
                                        <!--        <td class="p-price first-row">${c.product_id} </td>-->
                                                <td class="p-price first-row">
                                                    <h5>${c.product_name}</h5>
                                                </td>
                                             <!--   c.product_price-->
                                                <td class="p-price first-row"><fmt:formatNumber value="${c.product_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" /> VND</td>
                                                <td class="qua-col first-row">
                                                    <div class="quantity">                                                
                                                        <form action="update-cart">
                                                            <input class="form-control form-control-sm" onchange="this.form.submit()" type="number" name="quantity" value="${c.quantity}">
                                                            <input type="hidden" name="productId" value="${c.product_id}"/>
                                                            <input type="hidden" name="cartId" value="${c.cart_id}"/>
                                                            <c:set var="costTotal" value="${costTotal+ c.quantity*c.product_price}" />

                                                        </form>
                                                    </div>
                                                </td>
                                                <td class="total-price first-row"><fmt:formatNumber value="${c.quantity*c.product_price}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0" /> VND</td>

                                                <td class="close-td first-row">
                                                    <a href="delete-cart?productId=${c.product_id}&userId=${c.user_id}" class="btn-outline-danger text-decoration-none">
                                                        <i class="ti-close"></i>
                                                    </a>
                                                </td>
                                            </tr>

                                        </c:forEach>

                                    </tbody>
                                </table>

                            </div>
                            <div class="row">
                                <div class="col-lg-4">

                                    <!--   <div class="discount-coupon">
                                           <h6>M?? gi???m gi??</h6>
                                           <form action="#" class="coupon-form">
                                               <input type="text" placeholder="Nh???p m??">
                                               <button type="submit" class="site-btn coupon-btn">Apply</button>
                                           </form>
                                       </div>-->
                                </div>
                                <div class="col-lg-4 offset-lg-4">
                                    <div class="proceed-checkout">
                                        <ul>

                                            <li class="cart-total">T???ng ti???n c??c s???n ph???m <span> <fmt:formatNumber value="${costTotal}" type="currency" pattern="#,##0.00;-VND#,##0.00VN" maxFractionDigits="0"/> VND</span></li>

                                        </ul>
                                        <div class="proceed-btn" data-bs-toggle="modal" data-bs-target="#staticBackdrop">

                                            <a href="cart-contact" style="color: white">Mua h??ng</a>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <!-- Js Plugins -->
            <script src="do1/js/jquery-3.3.1.min.js"></script>
            <script src="do1/js/bootstrap.min.js"></script>
            <script src="do1/js/jquery-ui.min.js"></script>
            <script src="do1/js/jquery.countdown.min.js"></script>
            <script src="do1/js/jquery.nice-select.min.js"></script>
            <script src="do1/js/jquery.zoom.min.js"></script>
            <script src="do1/js/jquery.dd.min.js"></script>
            <script src="do1/js/jquery.slicknav.js"></script>
            <script src="do1/js/owl.carousel.min.js"></script>
            <script src="do1/js/main.js"></script>
        </body>

    </html>
</html>
