<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="sl-header">
	<div class="container">
		<span class="sl-icmenu"><i style="border: none;" class="fas fa-bars"></i></span> <a class="sl-logo"
			href="${pageContext.request.contextPath}/" title="Trang chủ"><img src="${pageContext.request.contextPath}/img/img-logo.png"
			style="max-width: 220px;"></a>
		<ul class="sl-menu clearfix">
			<li><a href="${pageContext.request.contextPath}/" title="TRANG CHỦ">TRANG CHỦ</a></li>
			<li><a href="${pageContext.request.contextPath}/shop" title="TRANG CHỦ">SHOP ACC</a></li>
			<li><a href="#" title="Hướng Dẫn">HƯỚNG DẪN
					GIAO DỊCH</a></li>
			<li><a
				href="https://www.facebook.com/Teocaothu1"
				title="fanpage">FANPAGE HỖ TRỢ</a></li>
		</ul>
		


	</div>
</div>

<div class="sl-hdtop">
	<div class="container">
		<div class="sl-boxs">
			<div class="sl-row clearfix">
				<div class="sl-col sl-col1 hidden-xs">
					<div class="sl-hdcbox">
						<h4 class="sl-htit sl-ht1">TOP ACC VIP</h4>
						<ul class="sl-htul">
							 <c:choose>
							 	<c:when test="${topaccounts.size() >= 5 }">
							 		<c:forEach begin="0" end="4" items="${topaccounts }" varStatus="loop">
										<li onclick="redir(${topaccounts.get(loop.index).id})"><i>${loop.index + 1 }</i> <span>ACC ${topaccounts.get(loop.index).id }</span> <label><fmt:formatNumber value="${topaccounts.get(loop.index).sellPrice }" type="number"></fmt:formatNumber><sup>VNĐ</sup></label>
										</li>
									</c:forEach>
							 	</c:when>
							 	<c:otherwise>
							 		<c:forEach var="account" items="${topaccounts }" varStatus="loop">
										<li><i>${loop.index + 1 }</i> <span>ACC ${account.id }</span> <label><fmt:formatNumber value="${account.sellPrice }" type="number"></fmt:formatNumber><sup>VNĐ</sup></label>
										</li>
									</c:forEach>
							 	</c:otherwise>
							 </c:choose>
							
						</ul>
					</div>
				</div>

				<div class="sl-col sl-col2">
					<div class="sl-hdcbox">
						<div class="swiper-container slhdbner swiper-container-horizontal">
							<div class="swiper-wrapper">
								<div class="swiper-slide">
									<img src="${pageContext.request.contextPath }/upload/${banner.image}"
										width="100%">
								</div>
							</div>
							<div class="fsbn-p"></div>
							<div class="fsbn-n"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="sl-search">
    <div class="container">
        <div class="col-sm-12" style="background-color: #323131;font-size: 17px;color: #fff;">
            <marquee scrollamount="4" style="padding-top: 8px;">
				<img src="${pageContext.request.contextPath }/img/run.gif" ><b style="color: #9cee4a;"> SHOP TÈO CAO THỦ, PHỤC VỤ UY TÍN, CHẤT LƯỢNG !!! CẢM ƠN AE ĐÃ GHÉ THĂM </b> <img src="${pageContext.request.contextPath }/img/run.gif" > 
            </marquee>
        </div>
    </div>
</div>
<script>
	
</script>
