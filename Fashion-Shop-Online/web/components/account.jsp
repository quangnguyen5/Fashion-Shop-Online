
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!-- Notification User -->
<c:if test="${notification !=null}">
    <div class="alert alert-warning alert-dismissible fade show" role="alert" style="position: fixed; z-index: 15 ; margin-left: 40%">
        <strong>${notification}</strong>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</c:if>


<!-- Login -->
<div class="modal fade col-md-12" role="dialog" id="loginModal">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 10px; margin-top: 100px;">
            <div class="modal-header">
                <h2 class="" id="loginModal" style="text-align:center; font-family: Arial"><b style="padding-left: 150px;">Đăng Nhập</b></h2><br>
            </div>
            <div class="modal-body">
                <form action="login" method="post" class="login100-form validate-form">
                    <div class="wrap-input100 validate-input m-b-23" data-validate = "Username is reauired">
                        <span class="label-input100">Tên Đăng Nhập</span>
                        <input class="input100" type="text" name="username" placeholder="Type your username">
                        <span class="focus-input100" data-symbol="&#xf206;"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Password is required">
                        <span class="label-input100">Mật khẩu</span>
                        <input class="input100" type="password" name="pass" placeholder="Type your password">
                        <span class="focus-input100" data-symbol="&#xf190;"></span>
                    </div>

                    <div class="text-right p-t-8 p-b-31">
                        <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#ResetPasswordModal" style="float:right; text-decoration: none; border-radius: 100px;">Quên Mật Khẩu?</a>

                    </div>
                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn">
                                Đăng Nhập
                            </button>
                        </div>
                    </div>
                </form>
                <div class="txt1 text-center p-t-54 p-b-20">
                    <span>
                        Đăng Nhập Bằng
                    </span>
                </div>
                <div class="flex-c-m">
                    <a href="" class="login100-social-item bg1">
                        <i class="fa fa-facebook"></i>
                    </a>
                    <a href="#" class="login100-social-item bg3">
                        <i class="fa fa-google"></i>
                    </a>
                </div>
                <div class="flex-col-c p-t-155">

                    <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#registerModal" style="float:left; text-decoration: none; border-radius: 10px;">Đăng Kí</a>
                    <!--  <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#ResetPasswordModal" style="float:right; text-decoration: none; border-radius: 100px;">Forgot password?</a>
                    -->
                </div>
                <br><br>
            </div>
        </div>
    </div>
</div>


<div id="dropDownSelect1"></div>

<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<script src="vendor/animsition/js/animsition.min.js"></script>
<script src="vendor/bootstrap/js/popper.js"></script>
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/daterangepicker/moment.min.js"></script>
<script src="vendor/daterangepicker/daterangepicker.js"></script>
<script src="vendor/countdowntime/countdowntime.js"></script>
<script src="js/main.js"></script>



<!-- Register -->


<div class="modal fade col-md-12" role="dialog" id="registerModal" style="padding-right: 18px" >
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 10px; margin-top: 180px;">
            <div class="modal-header">
                <h2 class="" id="registerModal" style="text-align:center; font-family: Arial"><b style="padding-left: 100px;">Đăng ký tài khoản</b></h2><br>
            </div>

            <div class="modal-body">
                <section>
                    <div class="container">
                        <form action="register" method="POST">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" placeholder="Họ và tên" name="fullName" style="border-radius: 100px;" required>
                                    </div></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" placeholder="Email" name="email" style="border-radius: 100px;" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" placeholder="Số điện thoại" name="mobile" style="border-radius: 100px;" required>
                                    </div></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="pwd" placeholder="Mật khẩu" name="password" style="border-radius: 100px;" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input type="password" class="form-control" id="pwd" placeholder="Nhập lại mật khẩu" name="repassword" style="border-radius: 100px;" required>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group" required>
                                        Giới tính&nbsp;&nbsp;&nbsp;
                                        <input class="" name="gender" type="radio" value="True" required/>&nbsp; Nam
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input class="" name="gender" type="radio" value="False" required/>&nbsp; Nữ
                                    </div>
                                </div>
                                <br><br><center>   <div class="container-login100-form-btn">
                                        <div class="wrap-login100-form-btn">
                                            <div class="login100-form-bgbtn"></div>
                                            <button class="login100-form-btn">
                                              Đăng Kí
                                            </button>
                                        </div>
                                    </div></center><br><br>
                            </div>
                        </form>
                        <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#loginModal" style="padding-left: 120px; text-decoration: none; border-radius: 100px;">Đã có tài khoản ? Đăng Nhập</a> 
                    </div>    
                </section>
            </div>
        </div>
    </div>
</div> 


<!-- User Profile -->   
<div class="modal fade col-md-12" role="dialog" id="userProfileModal" style="padding-right: 18px" >
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 10px; margin-top: 150px; min-width: 1148px; margin-left: -300px;">
            <div class="modal-header">
                <h2 class="" id="userProfileModal" style="text-align:center; font-family: Arial"><b style="padding-left: 100px;">Thông tin cá nhân</b></h2><br>
            </div>

            <div class="modal-body">
                <section>
                    <div class="container">

                        <div class="row">
                            <c:if test="${sessionScope.us.avatar != null && sessionScope.us.avatar ne ''}">
                                <div class="col-md-4">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5" width="150px" height="150px" src="${sessionScope.us.avatar}">
                                        <span class="font-weight-bold">${sessionScope.us.full_Name}</span><span class="text-black-50">${sessionScope.us.email}</span>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.us.avatar == null || sessionScope.us.avatar eq ''}">
                                <div class="col-md-4">
                                    <div class="d-flex flex-column align-items-center text-center p-3 py-5">
                                        <img class="rounded-circle mt-5" width="150px" src="data:image/png;base64,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">
                                        <span class="font-weight-bold">${sessionScope.us.full_Name}</span><span class="text-black-50">${sessionScope.us.email}</span>
                                    </div>
                                </div>
                            </c:if>

                            <div class="col-md-8">
                                <div class="p-3 py-5">
                                    <form action="edit"  method="post" enctype="multipart/form-data">
                                        <div class="row mt-4">
                                            <div class="row mt-4 col-md-6"><label class="labels" style="font-size: 10px;">Họ và tên</label><input type="text" class="form-control" name="fullName" placeholder="Họ và tên" value="${sessionScope.us.full_Name}"></div>&nbsp;
                                            <div class="row mt-4 col-md-6"><label class="labels" style="font-size: 10px;">Số điện thoại</label><input type="text" class="form-control" name="mobile" placeholder="Mobile" value="${sessionScope.us.mobile}"></div>&nbsp;
                                            <div class="row mt-4 col-md-6"><label class="labels" style="font-size: 10px;">Địa chỉ</label><input type="text" class="form-control" name="address" placeholder="Địa chỉ" value="${sessionScope.us.address}"></div>&nbsp;
                                            <div class="row mt-4 col-md-6"><label class="labels" style="font-size: 10px;">Email</label><input type="text" class="form-control" name="email" placeholder="Email" value="${sessionScope.us.email}" readonly></div>&nbsp;
                                            <div class="row mt-4 col-md-6"><label class="labels" style="font-size: 10px;">Ảnh đại diện</label><input type="file" class="form-control" name="avatar" placeholder="Ảnh đại diện" value="${sessionScope.us.avatar}"></div>&nbsp;
                                            <div class="row mt-4 col-md-3"><label class="labels" style="font-size: 10px;" name="gender" value="${sessionScope.us.gender}">Giới tính</label>
                                                <div><input name="gender" type="radio" value="1" ${sessionScope.us.gender == true ? 'checked' : ''}/>
                                                    Nam
                                                </div>
                                                <div><input name="gender" type="radio" value="0" ${sessionScope.us.gender == false ? 'checked' : ''}/>
                                                    Nữ
                                                </div>
                                                <input type="hidden" name="userId" value="${sessionScope.us.user_Id}"/>
                                            </div>
                                            <div class="row mt-4 col-md-6" hidden><label class="labels" style="font-size: 10px;">ID</label><input type="text" class="form-control" name="userId" placeholder="ID" value="${sessionScope.us.user_Id}"></div>&nbsp;
                                            <div class="row mt-4 col-md-3"><label class="labels" style="font-size: 10px;">Mật khẩu</label><a href="#" style="text-decoration: none;"><button type="button" data-toggle="modal" data-dismiss="modal" data-target="#ChangePasswordModal"  class="btn btn-dark" value="">Đổi mật khẩu</button></a></div>
                                        </div>
                                        <div class="row mt-5 col-md-6 text-center"><button class="btn btn-dark" type="submit">Lưu</button></div>
                                    </form>
                                    <div class="row mt-5 col-md-6 text-center d-flex"><a href="index.jsp"><button class="btn btn-dark" type="button">Trang chủ</button></a></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </section>
            </div>
        </div>
    </div>
</div> 

<!-- Change Password -->
<div class="modal fade col-md-12" role="dialog" id="ChangePasswordModal">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 10px; margin-top: 150px;">
            <div class="modal-header">
                <h1 style="text-align: center ; margin-left: 50px;">Thay đổi mật khẩu</h1>
            </div>
            <div class="modal-body">
                <form action="changepassword" method="post">
                    <input type="hidden" name="user_Id" value="${sessionScope.us.user_Id}"/>
                    <b>Nhập mật khẩu cũ</b>&nbsp;&nbsp;
                    <!--                                <i onclick="changeTypeOll_Pass()" class="fa fa-eye icon"></i>-->
                    <div class="form-group">
                        <input name="old_pass" type="password" class="form-control" placeholder="Mật khẩu cũ"style="border-radius: 100px;" required="">
                    </div>
                    <b>Nhập mật khẩu mới</b>&nbsp;&nbsp;
                    <!--<i onclick="changeTypeNew_Pass1()" class="fa fa-eye icon"></i>-->
                    <div class="form-group">
                        <input name="new_pass1" type="password" class="form-control" placeholder="Mật khẩu mới"style="border-radius: 100px;" required>
                    </div>
                    <b>Nhập lại mật khẩu mới</b>&nbsp;&nbsp;
                    <!--<i onclick="changeTypeNew_Pass2()" class="fa fa-eye icon"></i>-->
                    <div class="form-group">
                        <input name="new_pass2" type="password" class="form-control" placeholder="Nhập lại mật khẩu mới"style="border-radius: 100px;" required>
                    </div>
                    <br>
                    <center><button type="submit" class="btn btn-dark" style="padding-right: 160px;padding-left: 160px; border-radius: 100px;">Cập nhập mật khẩu</button></center>
                </form>
                <br><br>
                <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#loginModal" style="padding-left: 190px; text-decoration: none; border-radius: 100px;">Quay lại Login</a> 
            </div>
        </div>
    </div>
</div>

<!-- ResetPassword -->
<div class="modal fade col-md-12" role="dialog" id="ResetPasswordModal">
    <div class="modal-dialog">
        <div class="modal-content" style="border-radius: 10px; margin-top: 150px;">
            <div class="modal-header">
                <h1 style="text-align: center ; margin-left: 70px;">Cấp lại mật khẩu</h1>
            </div>
            <div class="modal-body">
                <form action="resetpassword" method="post">
                    <div class="form-group">
                        <input name="email" type="email" class="form-control" placeholder="Email của bạn"style="border-radius: 100px;" required>
                    </div>
                    <br>
                    <center>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    Kiểm tra
                                </button>
                            </div>
                        </div>
                    </center>
                </form>
                <br><br>
                <a type="button" data-toggle="modal" data-dismiss="modal" data-target="#loginModal" style="padding-left: 170px; text-decoration: none; border-radius: 100px;">Quay lại Đăng nhập</a> 
            </div>
        </div>
    </div>
</div>