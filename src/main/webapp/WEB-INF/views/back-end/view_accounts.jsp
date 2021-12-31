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
    <link href="http://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/sweetalert.css">
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
                        <p class="right__desc">Xem account: <a href="${pageContext.request.contextPath }/admin/account-add"><button type="button" class="add btn-outline-dark">Thêm account</button></a></p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable" class="stripe row-border order-column" style="width:100%" >
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>ID</th>
                                            <th>Ingame</th>
                                            <th>Level</th>
                                            <th>Rank</th>
                                            <th>Số Tướng</th>
                                            <th>Giá Nhập</th>
                                            <th>Giá Bán</th>
                                            <th>Ngày Nhập</th>
                                            <th>Đã Bán</th>
                                            <th>Xem Skin</th>
                                            <th>Sửa</th>
                                            <th>Xoá</th>
                                            <th>Thể Loại</th>
                                            <th>Miêu Tả</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="account" items="${accounts }" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" scope="row">${loop.index + 1}</td>
	                                            <td data-label="ID" onclick="getdetail(${account.id});" >ACC${account.id }</td>
	                                            <td data-label="Ingame">${account.ingame }</td>
	                                            <td data-label="Level">${account.level }</td>
	                                            <td data-label="Rank">${account.rank.name }</td>
	                                            <td data-label="Số Tướng">${account.numOfChamp }</td>
	                                            <td data-label="Giá Nhập"><fmt:formatNumber value="${account.importPrice }" type="number"/></td>
	                                            <td data-label="Giá Bán"><fmt:formatNumber value="${account.sellPrice }" type="number"/></td>
	                                           	<td data-label="Ngày Nhập">${account.createdDate }</td>
	                                            <td data-label="Đã bán"><a onclick="sellFunction(${account.id})" class="right__iconTable" ><img src="${pageContext.request.contextPath}/assets/icon-check.svg" alt=""></a></td>
	                                            <td data-label="Xem Skin" class="right__iconTable"><a href="#"><img src="${pageContext.request.contextPath }/assets/icon-edit.svg" alt=""></a></td>
	                                            <td data-label="Sửa" class="right__iconTable"><a href="${pageContext.request.contextPath }/admin/account-add/${account.id}"><img src="${pageContext.request.contextPath }/assets/icon-edit.svg" alt=""></a></td>
	                                            <td data-label="Xoá" class="right__iconTable"><a href="javascript:void(0)" onclick="myFunction(${account.id})"><img src="${pageContext.request.contextPath }/assets/icon-trash-black.svg" alt=""></a></td>
	                                            <td data-label="Thể loại" style="font-size: 10px;" >${account.category.name }</td>
	                                            <td data-label="Miêu Tả" style="font-size: 10px;width:50px;">${account.description }</td>
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
    <script type="text/javascript">
    	function getdetail(id) {
    		$.ajax({
    			url : "${pageContext.request.contextPath}/api/account-detail/" + id,
    			type : "get",
    			success : function(body,status,xhr) {
    				var acc = body;
					var stt = parseInt(xhr.status);
					if (stt == 200) {
						swal({
					       	title: "Tài Khoản Số #" + acc.id,
					        text: "Tài khoản số: #" + acc.id + "\nIngame: " + acc.ingame + "\nLevel: " + acc.level + ", Số tướng: " + acc.numOfChamp
					         + ", Số skin: " + acc.numSkin + ", Rank: " + acc.rank+ "\nGiá bán: " + acc.sellPrice + "\nThể loại: " + acc.category  + "\nMiêu tả: " + acc.description,
					        showCancelButton: true,
					        confirmButtonColor: "#DD6B55",
					        confirmButtonText: "Copy",
					        cancelButtonText: "Thoát",
					        closeOnConfirm: true,
					        showLoaderOnConfirm: true
					    }, function() {
					    	const mySmartTextarea = document.createElement('textarea');
					        mySmartTextarea.innerHTML = "Tài khoản số: #" + acc.id + "\nIngame: " + acc.ingame + ",Level: " + acc.level + ", Số tướng: " + acc.numOfChamp
					         + ", Số skin: " + acc.numSkin + ", Rank: " + acc.rank + "\nGiá bán: " + acc.sellPrice ;
					        const parentElement = document.body.appendChild(mySmartTextarea);
					        mySmartTextarea.select();
					        document.execCommand('copy');
					        document.body.removeChild(mySmartTextarea);
					    	alert("Copied the text");
					    } );
					}
					else {
						alert("Có lỗi xảy ra!");
					}
    			},
    			error : function(error) {
    				alert("Có lỗi xảy ra!");
    			}
    		});
    	}
    </script>
    <script type="text/javascript">
	    function sellFunction(id){
	    	var price = prompt("Bạn có chắc tài khoản: ACC" + id +  " này đã bán ? Nhập giá đã bán bên dưới:");
	    	if (price != null) window.location = "${pageContext.request.contextPath }/admin/account-selled?id=" + id + "&price=" + price;
		}
    </script>
    <script>
	    function myFunction(id){
			if(confirm("Bạn có muốn xoá account này ?")) {
				event.stopPropagation(); event.preventDefault();
			    window.location = "${pageContext.request.contextPath }/admin/account-delete/" + id;
			  } else {
				  event.stopPropagation(); event.preventDefault();
			  }
		}
	    
	    
		
		$(document).ready(function() {
		    var table = $('#myTable').DataTable( {
		    	scrollY:        true,
		        scrollX:        true,
		        scrollCollapse: true,
		        paging:         false,
		        columnDefs: [
		            { width: 200, targets: 0 }
		        ],
		        fixedColumns: true
		    } );
		} );
	</script>
	<script type="text/javascript">
		<c:if test="${not empty param.status}">
			alert("Cập nhật thành công!");
		</c:if>
	</script>
	<script src="${pageContext.request.contextPath}/js/sweetalert.min.js"></script>
</body>
</html>