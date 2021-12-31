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

	<div class="container">
		<div class="sl-dtprmain">
			<div class="sa-lsnmain clearfix">
				<div class="row">
					<div class="col-sm-4">
						<div class="sa-ttactit clearfix">
							<h1 class="sa-ttacc-tit">
								Tài khoản liên minh #<span style="color: #0070ff;">${account.id} </span>
							</h1>
						</div>
					</div>
					<div class="col-sm-8">
						<div class="hidden-sm hidden-md hidden-lg"
							style="text-align: center;">
							<div class="row">
								<div class="col-xs-6">
									<button class="sa-lib-dk btn btn-danger" type="submit"
										style="width: 300px; margin-bottom: 30px; border-radius: 0; font-size: 20px; font-weight: bold; padding: 5px; color: #333; font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;"
										onclick="popupacc(${account.id});">
										<p style="font-size: 13px; font-weight: bold;">MUA HÀNG</p>
										<p style="color: #e00d0d; font-weight: bold;">
											<fmt:formatNumber value="${account.sellPrice }" type="number"></fmt:formatNumber><sup>đ</sup>
										</p>
									</button>
								</div>
								
							</div>
						</div>
						<div class="pull-right hidden-xs">
							<div class="row">
								<div class="col-sm-12">
									<button class="sa-lib-dk btn btn-danger" type="submit"
										style="width: 300px; margin-bottom: 30px; border-radius: 0; font-size: 20px; font-weight: bold; padding: 5px; color: #333; font-family: Lato, 'Helvetica Neue', Arial, Helvetica, sans-serif;"
										onclick="popupacc(${account.id});">
										<p style="font-size: 13px; font-weight: bold;">MUA HÀNG</p>
										<p style="color: #e00d0d; font-weight: bold;">
											<fmt:formatNumber value="${account.sellPrice }" type="number"></fmt:formatNumber><sup>đ</sup>
										</p>
									</button>
								</div>

							</div>
						</div>
					</div>
					<h2 class="sl-htit sl-ht3" style="color: #41ff20;margin-left:16px;">THỂ LOẠI: ${account.category.name.toUpperCase() }</h2>
					<h2 style="color: #41ff20; width:100%;padding:10px;">${account.description }</h2>
					<ul class="sa-ttacc-tabs clearfix">
						<li class="active"><a href="#tab-info" data-toggle="tab">THÔNG
								TIN</a></li>
						<li><a href="#tab-skin" data-toggle="tab">Skin<span>${account.numSkin }</span></a></li>
						<li><a>Ingame <span>${account.ingame }</span></a></li>
						<li><a>Level <span>${account.level }</span></a></li>
						<li><a>Rank <span>${account.rank.name }</span></a></li>
						<li><a>Champs <span>${account.numOfChamp }</span></a></li>
					</ul>
					
					<span class="clothes-bg-top"></span>
					
					<div class="sa-ttacc-tcont tab-content">
						<div class="tab-pane fade in active text-center" id="tab-info">
							<div class="tab-content-detail">
								<c:forEach var="item" items="${images }">
									<div style="margin-bottom: 10px;">
										<img src="${pageContext.request.contextPath}/upload/${item.path}">
									</div>
								</c:forEach>
							</div>
						</div>
		
						<div class="tab-pane fade text-center" id="tab-skin">
							<span style="background-image: none;" class="clothes-bg-top"><h5>MỘT SỐ SKIN XỊN</h5></span>
							<ul>
							<c:forEach var="item" items="${skins }">
								<li class="liskin">${item.name }</li>
							</c:forEach>
							</ul>
							
						</div>
					</div>


					<span class="clothes-bg-bottom"></span>
					<h1 class="sl-htit sl-ht3 text-center" style="margin-top: 10px">TÀI
						KHOẢN LIÊN QUAN</h1>
					<c:forEach var="account" items="${accounts }">
						<div class="sl-prodli">
							<div class="sl-prodbox">
								<a class="sl-prlinks" href="${pageContext.request.contextPath}/acc-detail/${account.id}"> <span
									class="sl-lpcode">INGAME: ${account.ingame }</span>
									<p class="sl-primg">
										<img
											src="${pageContext.request.contextPath}/upload/game-lm1.png">
									</p>
									<div class="sl-prcode">
										<span>ACC #${account.id }</span>
									</div>
									<div class="sl-priftop">
										<p class="sl-prcode">
											<span>ACC #${account.id }</span>
										</p>
										<ul>
											<li>Level: ${account.level }</li>
											<li>Trang Phục: ${account.numSkin }</li>
											<li>Tướng: ${account.numOfChamp }</li>
											<li>Rank: ${account.rank.name }</li>
											<li>${account.description }</li>
										</ul>
									</div>
								</a>
								<div class="sl-prifs">
									<span class="sl-prpri sl-prpri1 hidden-xs"><img
										src="${pageContext.request.contextPath}/upload/${account.rank.image}"
										width="45" height="45"></span> <span class="sl-prpri sl-prpri2"><fmt:formatNumber
											value="${account.sellPrice }" type="number" /></span>
									<div class="sl-prifbot">
										<ul>
											<li>Level: ${account.level }</li>
											<li>Trang Phục: ${account.numSkin }</li>
											<li>Tướng: ${account.numOfChamp }</li>
										</ul>
									</div>
									<p class="sl-prbot">
										<a style="cursor: pointer;" class="sl-btnod" onclick="popupacc(${account.id})" >MUA NGAY</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>

	<!-- focus -->

	<script src="${pageContext.request.contextPath }/js/custom/custom.js"></script>
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
	background: #3a5795 url(/assets/images/ic_arrow_up_white.png) 225px 15px
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