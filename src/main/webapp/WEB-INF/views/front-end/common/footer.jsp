<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="sl-footer" style="margin-bottom: 50px;">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6">
				<div class="sa-fthotline">
					<div class="sa-ftarow clearfix">
						<div class="sa-ftacol sa-fthnum">
							<p>Hỗ trợ & báo lỗi</p>
							<p>
								<a target="_blank" href="https://www.facebook.com/Tecaothu.spt/">Toàn
									Trịnh</a>
							</p>
						</div>
						<div class="sa-ftacol sa-fthwork">Thời gian làm việc: Chúng tôi sẽ trả lời sớm nhất có thể!</div>
					</div>
				</div>

			</div>
			<div class="col-xs-12 col-sm-12 col-md-6">
				<ul class="sl-ftviews">
					<li><span class="sl-fti2"><img
							src="${pageContext.request.contextPath}/img/b1.png"></span>
						<p>
							<strong>${sellAcc }</strong> Acc đã bán
						</p></li>
					<li><span class="sl-fti3"><img
							src="${pageContext.request.contextPath}/img/b3.png"></span>
						<p>
							<strong class="vistor-total">${acc }</strong> Acc đang bán
						</p></li>
				</ul>
			</div>
		</div>
	</div>
</div>