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
                        <p class="right__desc">Xem tài khoản đã bán: </p>
                        <div class="right__table">
                            <div class="right__tableWrapper">
                                <table id="myTable" class="stripe row-border order-column" style="width:100%" >
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Ingame</th>
                                            <th>Giá Nhập</th>
                                            <th>Giá Bán</th>
                                            <th>Người Bán</th>
                                            <th>Ngày Bán</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="account" items="${accounts }" varStatus="loop">
	                                        <tr>
	                                            <td data-label="STT" scope="row">${loop.index + 1}</td>
	                                            <td data-label="Ingame">${account.ingame }</td>
	                                            <td data-label="Giá Nhập"><fmt:formatNumber value="${account.importPrice }" type="number"/></td>
	                                            <td data-label="Giá Bán"><fmt:formatNumber value="${account.sellPrice }" type="number"/></td>
	                                           	<td data-label="Ngày Bán">${account.selledBy }</td>
	                                           	<td data-label="Ngày Bán">${account.selledDate }</td>
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
	  
		
		$(document).ready(function() {
		    var table = $('#myTable').DataTable();
		} );
	</script>
</body>
</html>