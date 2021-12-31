<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login</title>
<meta name="title" content="Trang chủ" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/favicon.ico">
<meta name="description"
	content="shop nick lien minh, shop mot champ, shop one champ, one champ, shops one champ, shop acc one champ, shops acc một champ, mua acc liên minh, mua nick liên minh, shop acc lmht, mua acc lmht, mua nick lmht, nick lmht giá rẻ, shop acc giá rẻ, shop nick giá rẻ" />
<meta name="keywords"
	content="Shop Acc Liên Minh Huyền Thoại Tèo cao thủ" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta property="og:image:width" content="600">
<meta property="og:image:height" content="315">
<!--css-->
<jsp:include page="/WEB-INF/views/front-end/common/css.jsp"></jsp:include>
<!-- JS -->
<jsp:include page="/WEB-INF/views/front-end/common/js.jsp"></jsp:include>
</head>
<body>

	<!-- header -->
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include>

	<div class="sl-search">
		<div class="container">
			<div class="sl-sebox">
				<div class="sl-row clearfix">
					<div class="sl-col col-md-12 col-xs-12">
						<ul class="sa-lognav-tabs" role="tablist"
							style="margin-bottom: 0px;">
							<li role="presentation" class="active"><a href="#login" role="tab"
								data-toggle="tab" aria-expanded="true">ĐĂNG NHẬP</a></li>
							<li role="presentation" class=""><a href="#register"
								role="tab" data-toggle="tab" aria-expanded="false">ĐĂNG KÝ</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sa-mainsa">
		<div class="container">
			<div class="sa-logmain sa-themain">
				<div class="sa-charingbox">
					<div class="sa-logtct">
						<div class="row">
							<div class="col-md-12">

								<div class="sa-logtct tab-content">
									<div role="tabpanel" class="tab-pane active" id="login">
										<div class="col-md-3 col-sm-3"></div>
										<div class="col-md-6 tab-content">
											<form action="/action-form-login" method="POST">
												<ul>
													<c:if test="${not empty param.page_error}">
														<li class="sa-lichek">
															<div class="alert alert-danger" role="alert">Tài
																khoản hoặc mật khẩu không chính xác!</div>
														</li>
													</c:if>
													<li class="sa-lichek"><input type="text"
														class="form-control" placeholder="Tên đăng nhập" required
														name="username" maxlength="50"></li>
													<li class="sa-lichek"><input type="password"
														class="form-control" placeholder="Mật khẩu" required
														name="password" maxlength="50"></li>
													<li class="sa-librow"><span style="width: 100%;"><button
																type="submit" class="btn btn-danger" style="background-color: #fde100;color:black;" >
																ĐĂNG NHẬP
															</button></span></li>

												</ul>
											</form>
										</div>
									</div>
									<div role="tabpanel" class="tab-pane " id="register">
										<div class="col-md-3 col-sm-3"></div>
										<div class="col-md-6 tab-content">
											<form method="POST" action="/registion">
												<ul>
													<li class="sa-lichek"><input type="text"
														name="reg_username" class="form-control"
														placeholder="Tên đăng nhập" required maxlength="15" ></li>
													<li class="sa-lichek"><input type="text"
														class="form-control" name="reg_phone"
														placeholder="Số điện thoại" maxlength="11" required></li>
													<li class="sa-lichek"><input type="password"
														id="passwordr" name="reg_pass" class="form-control"
														placeholder="Mật khẩu" maxlength="20" required></li>
													<li class="sa-lichek"><input type="password"
														id="confirm_passwordr" name="reg_repass" class="form-control"
														placeholder="Nhập lại mật khẩu" maxlength="20" required></li>
													<small id="messager" style="font-size: 10px;"></small>
													<li class="sa-librow clearfix"><span><button
																type="submit" class="btn btn-danger" style="background-color: #fde100;color:black;">
																ĐĂNG KÝ 
															</button></span> <span><button type="reset"
																class="sa-lib-del btn btn-default">NHẬP LẠI</button></span></li>
												</ul>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/custom/custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom/luauytin.js"></script>
	<script type="text/javascript" defer="defer">
		<c:if test="${not empty param.userexist}">
		window.alert("Tên tài khoản đã tồn tại!");
		</c:if>
		<c:if test="${not empty param.notsimilar}">
		window.alert("Mật khẩu không giống nhau!");
		</c:if>
		<c:if test="${not empty param.successr}">
		window.alert("Đăng kí thành công!");
		</c:if>
		$('#passwordr, #confirm_passwordr').on('keyup', function () {
	   		  if ($('#passwordr').val() == $('#confirm_passwordr').val()) {
	   		    $('#messager').html('Hợp lệ').css('color', 'green');
	   		  } else 
	   		    $('#messager').html('Không khớp').css('color', 'red');
	   		});
	</script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
</body>
</html>