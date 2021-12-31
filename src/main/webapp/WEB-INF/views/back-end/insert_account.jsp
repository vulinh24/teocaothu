<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- SPRING FORM -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>
.checkBox {
	display: inline-block;
	font-size: 25px;
}

.checkBox span {
	margin-right: 20px;
	padding-right: 20px;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<div class="dashboard">
				<jsp:include page="/WEB-INF/views/back-end/common/menu.jsp"></jsp:include>
				<div class="right">
					<div class="right__content">
						<div class="right__title">Bảng điều khiển</div>
						<p class="right__desc">Chèn account</p>
						<div class="right__formWrapper">

							<form:form
								action="${pageContext.request.contextPath}/admin/account-add"
								method="post" modelAttribute="account"
								enctype="multipart/form-data">
								<form:hidden path="id" />

								<div class="right__inputWrapper">
									<label>Danh mục</label>
									<form:select class="form-control form-control-line"
										path="category.id">
										<form:options items="${categories}" itemValue="id"
											itemLabel="name" multiple="true" />
									</form:select>
									<small style="color: red;" id="emailHelp"
										class="form-text text-muted"> Lưu ý nhập lại khi sửa.
									</small>
								</div>

								<div class="right__inputWrapper">
									<label>Rank</label>
									<form:select class="form-control form-control-line"
										path="rank.id">
										<form:options items="${ranks}" itemValue="id" itemLabel="name" />
									</form:select>
									<small style="color: red;" id="emailHelp"
										class="form-text text-muted"> Lưu ý nhập lại khi sửa.
									</small>
								</div>


								<div class="right__inputWrapper">
									<label>Ngày nhập</label>
									<form:input type="text" class="form-control" path="createdDate"
										value="${account.createdDate }" />
									<small id="emailHelp" class="form-text text-muted"> Mặc
										định là ngày nhập trên web. Nếu nhập, nhập đúng định dang:
										yyyy-MM-dd 
									</small>
								</div>

								<div class="right__inputWrapper">
									<label>Ingame</label>
									<form:input type="text" class="form-control" path="ingame" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 50 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Level</label>
									<form:input type="text" class="form-control" path="level" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 15 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Số tướng</label>
									<form:input type="text" class="form-control" path="numOfChamp" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 15 kí tự. </small>
								</div>
								
								<div class="right__inputWrapper">
									<label>Số skin</label>
									<form:input type="text" class="form-control" path="numSkin" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 15 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Miêu tả</label>
									<form:input type="text" class="form-control" path="description" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 100 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Giá nhập</label>
									<form:input type="text" class="form-control" path="importPrice" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 15 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Giá bán</label>
									<form:input type="text" class="form-control" path="sellPrice" />
									<small id="emailHelp" class="form-text text-muted"> Tối
										đa 15 kí tự. </small>
								</div>

								<div class="right__inputWrapper">
									<label>Ảnh</label> <input type="file" name="account_images"
										class="form-control" multiple="multiple"> <small
										id="emailHelp" class="form-text text-muted"> Nhập đúng
										trình tự ảnh mong muốn! </small>
								</div>

								<c:if test="${account.id == null }">
									<h4 style="font-weight: bold;">Danh sách skin vip</h4>
									<h5 style="color: red;">Nhập chính xác không phải xóa, nhập
										lại acc đấy :)</h5>
									
									<div class="row">
										<c:forEach var="skin" items="${skins }">
											<div class="col-lg-4 col-md-6 col-sm-6">
												<input style="margin: 7px 2px 7px;" id="skin${skin.id}"
													type="checkbox" value="${skin.id}" name="listskins">
												<label for="skin${skin.id}">${skin.name}</label>
											</div>
										</c:forEach>
									</div>
								</c:if>
								
								<button style="margin-top: 30px;" class="btn" type="submit">Thêm</button>


							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script type="text/javascript">
		<c:if test="${not empty param.status}">
			alert("Thêm thành công!");
		</c:if>
	</script>
	<script>
		$('#txtDetailDescription').summernote(
				{
					placeholder : 'Hello, love the world!',
					tabsize : 2,
					height : 120,
					toolbar : [ [ 'style', [ 'style' ] ],
							[ 'font', [ 'bold', 'underline', 'clear' ] ],
							[ 'color', [ 'color' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'table', [ 'table' ] ],
							[ 'insert', [ 'link', 'picture', 'video' ] ],
							[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ]
				});
	</script>
</body>
</html>