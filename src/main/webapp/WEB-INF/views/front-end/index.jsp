<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Shop Tèo cao thủ</title>
<meta name="title" content="Trang chủ" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/favicon.ico">
<meta name="description"
	content="shop nick lien minh,shop acc lien minh, tai khoan lien minh, shop one champ, one champ, shops one champ, shop acc one champ, shops acc một champ, mua acc liên minh, mua nick liên minh, shop acc lmht, mua acc lmht, mua nick lmht, nick lmht giá rẻ, shop acc giá rẻ, shop nick giá rẻ" />
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
						<h1 class="sl-htit text-center" style="font-size: 33px;">GAME
							LIÊN MINH</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="sl-lprod">
		<div class="container">
			<div class="sllpbox">

				<div class="sl-produl clearfix">
					<c:forEach var="category" items="${categories }">
						<div class="sl-prodli">
						<div class="sl-prodbox">
							<a class="sl-prlinks" href="${pageContext.request.contextPath}/shop?cate=${category.id }"
								title="${category.name }">
								<h3 class="sl-prcode text-center">
									<span>${category.name }</span>
								</h3>
								<p class="sl-primg">
									<img src="${pageContext.request.contextPath}/upload/${category.image}"
										alt="Shop tèo cao thủ">
								</p>
							</a>
							<div class="sl-prifs">
								<div class="sl-prifbot">
									<ul>
										<li>${category.description }</li>
										<li>TÀI KHOẢN ĐÃ BÁN: 1,689</li>
									</ul>
								</div>

								<p class="sl-prbot">
									<a href="${pageContext.request.contextPath}/shop?cate=${category.id }" title="XEM TẤT CẢ" class="sl-btnod">XEM
										TẤT CẢ</a>
								</p>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div class="container" style="margin-top: 15px;">
		<div class="fan">
			<div class="col-md-6 features">
				<h3>VỀ CHÚNG TÔI</h3>
				<div class="shipping">
					<div class="col-md-2 ficon hvr-rectangle-out">
						<a href="https://www.tiktok.com/@teocaothu1"><i
						style="line-height: 55px;"	class="fab fa-tiktok" aria-hidden="true"></i></a>
					</div>
					<div class="col-md-10 ftext">
						<h4>Tiktok cá nhân: @teocaothu1</h4>
						<p>Vui lòng check thông tin trên tiktok trước khi giao dịch.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="shipping">
					<div class="col-md-2 ficon hvr-rectangle-out">
						<a href="https://www.facebook.com/Teocaothu1"><i
						style="line-height: 55px;"	class="fab fa-facebook" aria-hidden="true"></i></a>
					</div>
					<div class="col-md-10 ftext">
						<h4>Fanpage facebook: Tèo cao thủ</h4>
						<p>Liên hệ nếu có câu hỏi.</p>
					</div>
					<div class="clearfix"></div>
				</div>

				<div class="shipping">
					<div class="col-md-2 ficon hvr-rectangle-out">
						<i class="fa fa-bus" aria-hidden="true"></i>
					</div>
					<div class="col-md-10 ftext">
						<h4>Giao dịch an toàn</h4>
						<p>Giao dịch thủ công thông qua các thông tin trong phần liên
							hệ.</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="money-back">
					<div class="col-md-2 ficon hvr-rectangle-out">

						<i style="line-height: 55px;" class="fas fa-money-bill-alt" aria-hidden="true"></i>
					</div>
					<div class="col-md-10 ftext">
						<h4>Uy tín hàng đầu</h4>
						<p>Cam kết tất cả tài khoản trên website đều đúng như thông
							tin và hình ảnh trên web.</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			
			<div class="col-md-6 testimonials">
				<div class="test-inner">
					<img src="${pageContext.request.contextPath}/img/avatar.png" alt="avatar">
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		
	</div>

	<script src="${pageContext.request.contextPath}/js/custom/custom.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom/luauytin.js"></script>
	
	<!-- focus here -->
	<style type="text/css">
.sa-logo img {
	width: 210px;
	height: 53px;
}

#cfacebook {
	position: fixed;
	bottom: 0px;
	right: 10px;
	z-index: 999999999999999;
	width: 185px;
	height: 40px;
	box-shadow: 6px 6px 6px 10px rgba(0, 0, 0, 0.2);
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	overflow: hidden;
	background-color: #3a5795;
	line-height: 40px;
	padding-left: 18px;
}

#cfacebook .fchat {
	float: left;
	width: 100%;
	height: 350px;
	overflow: hidden;
	display: none;
	background-color: #fff;
}

#cfacebook .fchat .fb-page {
	float: left;
}

#cfacebook a.chat_fb {
	background: #3a5795 url(${pageContext.request.contextPath}/images/ic_arrow_up_white.png) 225px 15px
		no-repeat;
	float: left;
	width: 250px;
	height: 40px;
	color: #fff;
	text-decoration: none;
	line-height: 40px;
	text-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
	border: 0;
	border-bottom: 1px solid #133783;
	z-index: 9999999;
	font-size: 13px;
	text-align: center;
	text-transform: uppercase;
	padding: 50px;
	padding-left: 100px;
}

#cfacebook a.chat_fb img {
	position: absolute;
	top: 10px;
	left: 10px;
}

#cfacebook a.chat_fb:hover {
	color: yellow;
	text-decoration: none;
}

a.float-btn {
	background: #000;
	width: 180px;
	height: 41px;
	display: block;
	border: 2px solid #000;
	font-size: 17px;
	line-height: 34px;
	text-align: center;
	color: #fff;
	margin: 0 0 1px 0;
}

.float-menu {
	width: 179px;
	position: fixed;
	right: 0;
	top: 40%;
	z-index: 999;
	transition: all ease 0.3s;
	-moz-transition: all ease 0.3s;
	-ms-transition: all ease 0.3s;
	-o-transition: all ease 0.3s;
	-webkit-transition: all ease 0.3s;
}

.sa-logo img {
	width: 210px;
	height: 53px;
}

.embed-container {
	position: relative;
	padding-bottom: 45.25%;
	height: 0;
	overflow: hidden;
	max-width: 100%;
}

.embed-container iframe, .embed-container object, .embed-container embed
	{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}
</style>
	<!-- Messenger Plugin chat Code -->
	<div id="fb-root"></div>

	<!-- Your Plugin chat code -->
	<div id="fb-customer-chat" class="fb-customerchat"></div>

	<script>
		var chatbox = document.getElementById('fb-customer-chat');
		chatbox.setAttribute("page_id", "109665707939077");
		chatbox.setAttribute("attribution", "biz_inbox");
		window.fbAsyncInit = function() {
			FB.init({
				xfbml : true,
				version : 'v10.0'
			});
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	
	<!-- end focus -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/front-end/common/footer.jsp"></jsp:include>
</body>
</html>