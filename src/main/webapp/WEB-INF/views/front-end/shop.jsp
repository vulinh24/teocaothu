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
<title>Shop Tèo cao thủ</title>
<meta name="title" content="Trang chủ" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/img/favicon.ico">
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

	<!-- header 
	<jsp:include page="/WEB-INF/views/front-end/common/header.jsp"></jsp:include> -->

	<div class="sl-header">
		<div class="container">
			<span class="sl-icmenu"><i style="border: none;"
				class="fas fa-bars"></i></span> <a class="sl-logo"
				href="${pageContext.request.contextPath}/" title="Trang chủ"><img
				src="${pageContext.request.contextPath}/img/img-logo.png"
				style="max-width: 220px;"></a>
			<ul class="sl-menu clearfix">
				<li><a href="${pageContext.request.contextPath}/"
					title="TRANG CHỦ">TRANG CHỦ</a></li>
				<li><a href="${pageContext.request.contextPath}/shop"
					title="TRANG CHỦ">SHOP ACC</a></li>
				<li><a href="#" title="Hướng Dẫn">HƯỚNG DẪN GIAO DỊCH</a></li>
				<li><a href="https://www.facebook.com/Teocaothu1"
					title="fanpage">FANPAGE HỖ TRỢ</a></li>
			</ul>
			
		</div>
	</div>

	<!-- Search -->
	<script>
		var type = "lien-minh";
	</script>
	<script
		src="${pageContext.request.contextPath}/js/bootstrap3-typeahead.min.js"></script>
	<div class="sl-search" style="padding-top: 25px;">
		<div class="container">
			<div class="sl-sebox">
				<div class="sl-row clearfix">
					<div class="sl-col col-md-12 col-xs-12 filter">
						<h4 class="sl-htit sl-ht2">TÀI KHOẢN LIÊN MINH</h4>
						<form:form action="/shop/filter-accounts" method="post"
							modelAttribute="filter">
							<ul class="sl-seauls clearfix">
								<li><form:select class="form-control property-filter"
										path="category">
										<form:option value="0">Tìm theo danh mục</form:option>
										<c:forEach var="item" items="${categories }">
											<c:choose>
												<c:when test="${item.id eq filter.category }">
													<form:option value="${item.id }" selected="true">${item.name }</form:option>
												</c:when>
												<c:otherwise>
													<form:option value="${item.id }">${item.name }</form:option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select></li>
								<li><form:select class="form-control property-filter"
										path="price">
										<option value="0">Tìm theo giá</option>
										<c:choose>
											<c:when test="${filter.price eq 1 }">
												<form:option value="1" selected="true">100K trở xuống</form:option>
											</c:when>
											<c:otherwise>
												<option value="1">100K trở xuống</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${filter.price eq 2 }">
												<form:option value="2" selected="true">Từ 100K đến 300K</form:option>
											</c:when>
											<c:otherwise>
												<option value="2">Từ 100K đến 300K</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${filter.price eq 3 }">
												<form:option value="3" selected="true">Từ 300K đến 500K</form:option>
											</c:when>
											<c:otherwise>
												<option value="3">Từ 300K đến 500K</option>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${filter.price eq 4 }">
												<form:option value="4" selected="true">Từ 500k trở lên</form:option>
											</c:when>
											<c:otherwise>
												<option value="4">Từ 500k trở lên</option>
											</c:otherwise>
										</c:choose>
									</form:select></li>
								<li><form:select class="form-control property-filter"
										path="rank">
										<form:option value="0">Tìm theo rank</form:option>
										<c:forEach var="item" items="${ranks }">
											<c:choose>
												<c:when test="${item.id eq filter.rank }">
													<form:option value="${item.id }" selected="true">${item.name }</form:option>
												</c:when>
												<c:otherwise>
													<form:option value="${item.id }">${item.name }</form:option>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</form:select></li>
								<li><form:select class="form-control property-filter"
										path="sort">
										<option value="0">Sắp xếp theo</option>
										<c:choose>
											<c:when test="${filter.sort eq 1 }">
												<form:option value="1" selected="true">Giá giảm dần</form:option>
											</c:when>
											<c:otherwise>
												<option value="1">Giá giảm dần</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${filter.sort eq 2 }">
												<form:option value="2" selected="true">Giá tăng dần</form:option>
											</c:when>
											<c:otherwise>
												<option value="2">Giá tăng dần</option>
											</c:otherwise>
										</c:choose>
									</form:select> 
									</li>
									<li>
									<form:input id="search" type="text" list = "searchresults" class="form-control property-filter" placeholder="Tìm Theo Skin Xịn" path="skin" autocomplete="off" />
										<datalist id="searchresults" >
											
	                                    </datalist>
	                                    <template id="resultstemplate">
    										 <c:forEach var="item" items="${skins }">
												<option>${item.name}</option>
											</c:forEach>
    									</template>
									</li>
									

							</ul>
							<ul class="sl-sebtns">
								<li><button class="sl-sebt1" type="submit">LỌC</button></li>
								<li><button class="sl-sebt2" type="reset" onclick="redirect();">BỎ LỌC</button></li>
							</ul>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="sllpbox">
			<div id="list-account">
				<div class="sl-produl clearfix">
					<c:if test="${accounts.isEmpty()}"><h3 class="text-center" style="font-size: 22px;padding: 10px;">KHÔNG TÌM THẤY TÀI KHOẢN NÀO !</h3></c:if>
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
										<a style="cursor: pointer;" class="sl-btnod" onclick="popupacc(${account.id})">MUA NGAY</a>
									</p>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
				<div class="sl-paging">
					<ul>
						<c:forEach begin="1" end="${filterModel.totalPage }" varStatus="loop">
							<c:choose>
								<c:when test="${filterModel.currenPage eq loop.index }">
									<li class="item active"><a href="${pageContext.request.contextPath}/shop/filter-accounts?page=${loop.index}">${loop.index }</a></li>
								</c:when>
								<c:otherwise>
									<li class="item"><a href="${pageContext.request.contextPath}/shop/filter-accounts?page=${loop.index}">${loop.index }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</ul>
				</div>
			</div>
			
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/custom/custom.js"></script>
	<script type="text/javascript">
		var search = document.querySelector('#search');
		var results = document.querySelector('#searchresults');
		var templateContent = document.querySelector('#resultstemplate').content;
		search.addEventListener('keyup', function handler(event) {
		    while (results.children.length) results.removeChild(results.firstChild);
		    var inputVal = new RegExp(search.value.trim(), 'i');
		    var clonedOptions = templateContent.cloneNode(true);
		    var set = Array.prototype.reduce.call(clonedOptions.children, function searchFilter(frag, el) {
		 if (inputVal.test(el.textContent) && frag.children.length < 5) frag.appendChild(el);
		        return frag;
		    }, document.createDocumentFragment());
		    results.appendChild(set);
		});
	</script>
	<!-- focus -->
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
	background: #3a5795
		url(${pageContext.request.contextPath}/images/ic_arrow_up_white.png)
		225px 15px no-repeat;
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
	<script type="text/javascript">
		function redirect() {
			location.href = "${pageContext.request.contextPath}/shop";
		}
	</script>
</body>
</html>