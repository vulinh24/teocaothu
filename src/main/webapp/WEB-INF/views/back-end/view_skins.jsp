<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <link href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet">
    <style>
    .add{
    	padding: 20px 10px;
    	width: 150px;
    	float:right;
    	border: 1px solid black;
    	border-radius: 15px;
    	color: black;
    	background-color: white;
    	margin-bottom: 20px;
    	font-weight: bolder;
    	
    }
    
    .add:hover{
    	background-color:black;
    	color:white;
    	transition: 0.5s;
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
                        <p class="right__desc">Xem skin <a href="${pageContext.request.contextPath }/admin/skin-add"><button type="button" class="add btn-outline-dark">Thêm skin</button></a></p>
                   
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable">
                                    <thead>
                                        <tr>
                                            <th scope="col">STT</th>
                                            <th scope="col">Tiêu đề</th>
                                            <th scope="col">Sửa</th>
                                            <th scope="col">Xoá</th>
                                        </tr>
                                    </thead>
                            
                                    <tbody>
                                        <c:forEach items="${skins }" var="skin" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" scope="row">${loop.index + 1}</td>
	                                            <td data-label="Tiêu đề">${skin.name }</td>
	                                            <td data-label="Sửa" class="right__iconTable"><a href="${pageContext.request.contextPath }/admin/skins/${skin.id}"><img src="${pageContext.request.contextPath}/assets/icon-edit.svg" alt=""></a></td>
	                                            <td data-label="Xoá" class="right__iconTable"><a onclick="myFunction(${skin.id})"><img src="${pageContext.request.contextPath}/assets/icon-trash-black.svg" alt=""></a></td>
	                                        </tr>
                                        </c:forEach>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script>
	function myFunction(id){
		  if(confirm("Bạn có muốn xoá skin này ?")) {
			event.stopPropagation(); event.preventDefault();
		    window.location = "${pageContext.request.contextPath }/admin/skins-delete/" + id;
		  } else {
			  event.stopPropagation(); event.preventDefault();
		  }
	}

	$(document).ready( function () {
	    $('#myTable').DataTable();
	} );
	</script>
	<script type="text/javascript">
		<c:if test="${not empty param.status}">
			alert("Cập nhật thành công!");
		</c:if>
	</script>
</body>
</html>