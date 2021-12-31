<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/views/back-end/common/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
   	<style type="text/css">
   		.control {
   			margin-top : 50px;
   			background-color: white;
		    border-radius: 5px;
		    width:100%;height:250px;
   		}
   		.control h2,h4,p {
   			margin-left : 20px;
   			font-weight: bold;
   		}
   		.control button {
   			margin-bottom: 20px;
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
                        <p class="right__desc">Bảng điều khiển</p>
                        <div class="right__cards">
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/accounts">
                                <div class="right__cardTitle">Tài khoản đang bán</div>
                                <div class="right__cardNumber">${qualityOfProduct }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/selled-accounts">
                                <div class="right__cardTitle">Tài khoản đã bán</div>
                                <div class="right__cardNumber">${qualityOfSelledProduct }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/customers">
                                <div class="right__cardTitle">Khách Hàng</div>
                                <div class="right__cardNumber">${qualityOfUser }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                            <a class="right__card" href="${pageContext.request.contextPath }/admin/categories">
                                <div class="right__cardTitle">Danh Mục</div>
                                <div class="right__cardNumber">${qualityOfCategory }</div>
                                <div class="right__cardDesc">Xem Chi Tiết <img src="${pageContext.request.contextPath}/assets/arrow-right.svg" alt=""></div>
                            </a>
                           
                        </div>
                        <div class="row control">
                        <button type="button" class="btn btn-primary" onclick="thongke();">Thống Kê</button>
                        	<div class="col-sm-6">
                        		<h4>Số tài khoản đã bán trong ngày: <span id="countDay"></span></h4>
                        		<h4>Doanh thu: <span id="sumDay"></span></h4>
                        	</div>
                        	<div class="col col-sm-6">
                        		<h4>Số tài khoản đã bán trong tháng: <span id="countMonth"></span></h4>
                        		<h4>Doanh thu: <span id="sumMonth"></span></h4>
                        	</div>
                        	<p>====================================================================================================</p>
                        	<div class="col col-sm-6">
                        		<h4>Tổng lãi tháng: <span id="monthInterest"></span></h4>
                        		<h4>Tổng lãi      : <span id="totalInterest"></span></h4>
                        	</div>
                        	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/back-end/common/js.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script type="text/javascript">
	   	function thongke() {
	   		$.ajax({
	   			url : "${pageContext.request.contextPath}/api/thong-ke",
    			type : "get",
    			success : function(body,status,xhr) {
    				var tk = body;
    				console.log(tk);
					var stt = parseInt(xhr.status);
					if (stt == 200) {
						$("#countDay").html(tk.countDay);
						$("#countMonth").html(tk.countMonth);
						$("#sumDay").html(tk.sumDay);
						$("#sumMonth").html(tk.sumMonth);
						$("#monthInterest").html(tk.monthInterest);
						$("#totalInterest").html(tk.totalInterest);
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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/highcharts/8.1.2/es-modules/parts/Chart.min.js"></script>
</body>
</html>