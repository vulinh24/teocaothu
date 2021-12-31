<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/taglib/taglib.jsp"%>

<div class="left">
	<span class="left__icon"> <span></span> <span></span> <span></span>
	</span>
	<div class="left__content">
		<div class="left__logo" style="color: red;">SHOP TÈO CAO THỦ</div>
		<div class="left__profile">
			<div class="left__image">
				<img src="${pageContext.request.contextPath}/assets/admin.jpg"
					alt="">
			</div>
			<p class="left__name">Xin chào, ${USER}</p>
		</div>
		<ul class="left__menu">
			<li class="left__menuItem"><a
				href="${pageContext.request.contextPath }/admin" class="left__title"><img
					src="${pageContext.request.contextPath}/assets/icon-dashboard.svg"
					alt="">Dashboard</a></li>
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-tag.svg"
						alt="">ACC Đang Bán<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/account-add">Thêm
						ACC</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/accounts">Xem
						Danh Sách</a>
				</div>
			</li>
			
			<li class="left__menuItem"><a
				href="${pageContext.request.contextPath}/admin/selled-accounts"
				class="left__title"><img
					src="${pageContext.request.contextPath}/assets/icon-tag.svg"
					alt="">Acc Đã Bán</a>
			</li>
			
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-edit.svg"
						alt="">Danh Mục<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/category-add">Thêm
						Mới</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/categories">Xem
						Danh Sách</a>
				</div>
			</li>
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-edit.svg"
						alt="">Rank<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/rank-add">Thêm
						Mới</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/ranks">Xem
						Danh Sách</a>
				</div>
			</li>
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-edit.svg"
						alt="">Skin tướng<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/skin-add">Thêm
						Mới</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/skins">Xem
						Danh Sách</a>
				</div>
			</li>
			<li class="left__menuItem">
				<div class="left__title">
					<img
						src="${pageContext.request.contextPath}/assets/icon-settings.svg"
						alt="">Banner<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/banner-add">Thêm
						banner</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/banners">Xem
						banner</a>
				</div>
			</li>
			<li class="left__menuItem"><a
				href="${pageContext.request.contextPath}/admin/customers"
				class="left__title"><img
					src="${pageContext.request.contextPath}/assets/icon-users.svg"
					alt="">Khách Hàng</a></li>
			
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-book.svg"
						alt="">Tiền Của Khách<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/add-money">Thêm
						Tiền</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/money-customers">Xem
						Danh Sách</a>
				</div>
			</li>
			
			<li class="left__menuItem">
				<div class="left__title">
					<img src="${pageContext.request.contextPath}/assets/icon-user.svg"
						alt="">Admin<img class="left__iconDown"
						src="${pageContext.request.contextPath}/assets/arrow-down.svg"
						alt="">
				</div>
				<div class="left__text">
					<a class="left__link"
						href="${pageContext.request.contextPath}/admin/decentralization-add">Thêm
						Admin</a> <a class="left__link"
						href="${pageContext.request.contextPath}/admin/decentralization">Xem
						Admins</a>
				</div>
			</li>
			<li class="left__menuItem"><a
				href="${pageContext.request.contextPath}/" class="left__title"><img
					src="${pageContext.request.contextPath}/assets/icon-logout.svg"
					alt="">Trang chủ</a></li>
			<li class="left__menuItem"><a
				href="${pageContext.request.contextPath}/logout" class="left__title"><img
					src="${pageContext.request.contextPath}/assets/icon-logout.svg"
					alt="">Đăng Xuất</a></li>

		</ul>
	</div>
</div>