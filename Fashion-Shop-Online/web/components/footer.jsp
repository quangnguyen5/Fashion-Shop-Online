
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="../css/css/ionicons.min.css">    
<link rel="stylesheet" href="../css/css/style.css">       
<link rel="stylesheet" href="../vendor/jquery/jquery-3.2.1.min.js">       
<link rel="stylesheet" href="../vendor/jquery/jquery-3.2.1.min.js">       
<link rel="stylesheet" href="../vendor/bootstrap/css/bootstrap.css">  
<link rel="stylesheet" href="../vendor/bootstrap/js/popper.js"> 
<link rel="stylesheet" href="../fonts/font-awesome-4.7.0/css/font-awesome.css">  


<div id="footer">

    <!-- Feedback Form -->
    <div class="modal fade col-md-12" role="dialog" id="feedback_common">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 10px; margin-top: 60px;">
                <div class="modal-header">
                    <h2 style="margin-left: 35%">Bình luận</h2>
                </div>
                <div class="modal-body">
                    <form action="feedback_common">
                        <b>Viết bình luận:</b>&nbsp;&nbsp;
                        <div class="form-group">
                            <textarea name="subject" placeholder="Viết bình luận.." style="height:200px ; width: 460px"></textarea>
                        </div>
                        <b>Ảnh phản hồi:</b>&nbsp;&nbsp;
                        <div class="form-group">
                            <input name="imageurl" type="file" class="form-control" style="border-radius: 100px;" required="">
                        </div>
                        <b>Đánh giá:</b>&nbsp;&nbsp;
                        <div class="form-group" >
                            <select name = "star" style="border-radius: 100px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                <option selected>Chọn số sao bạn dành cho FashionShop</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                            </select>
                        </div>
                        <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Bình luận</button></center>

                    </form>
                    <br><br>
                </div>
            </div>
        </div>
    </div>
    <div class="map">
        <div class="col-md-5 col-lg-3 mb-md-0 mb-4">
            <h3>Information</h3>
            <ul class="list-unstyled">
                <li><a href="#" class="py-1 d-block">Home</a></li>
                <li><a href="#" class="py-1 d-block">Products</a></li>
                <li><a href="#" class="py-1 d-block">Blog</a></li>
                <li><a href="#" class="py-1 d-block">About</a></li>
                <li><a href="#" class="py-1 d-block">Help &amp; Support</a></li>
            </ul>
        </div>
    </div>

    <div class="info-footer">
        <div class="content-footer">
            <h2>Địa chỉ liên hệ</h2>
            <p class="mt-16">HUB Hà Nội: Hoalaclink03, thôn Vân Lôi, xã Bình Yên, huyện Thạch Thất, TP. Hà Nội</p>
            <p><i class="ti-location-pin"></i>Tran Duy Hung, Ha Noi</p>
            <p><i class="ti-mobile"></i>Phone:+0879 112 113</p>
            <p><i class="ti-email"></i>info@yourdomain.com</p>
        </div>

        <div class="feedback-footer">
            <h2 class="mt-40">Fashionshop lắng nghe bạn!</h2>
            <p>Chúng tôi luôn trân trọng và mong đợi nhận được mọi ý kiến đóng góp từ khách hàng để có thể nâng cấp trải nghiệm dịch vụ và sản phẩm tốt hơn nữa</p>
            <a data-toggle="modal" data-dismiss="modal" data-target="#feedback_common"><input class="Button-Feedback mt-16" type="submit" value="Gửi ý kiến"></a> 

        </div>
        <div class="-footer">
            <div class="footer-social-link">
                <h3>Follow us</h3>
                <ul>
                    <li>
                        <a href="#">
                            <i class="fa fa-facebook"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-twitter"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-google-plus"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="fa fa-instagram"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    <div class="row mt-5 pt-4 border-top">
        <div class="col-md-6 col-lg-8">
            <p class="copyright">
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved.</p>
        </div>
    </div>
</div>
