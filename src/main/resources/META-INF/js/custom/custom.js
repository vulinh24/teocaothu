
$('.sl-icmenu').click(function() {
	$('.sl-menu').toggleClass('slshowmn');
});


$('.slchgame').swiper({
	slidesPerView: 5,
	paginationClickable: true,
	preventClicks: false,
	spaceBetween: 20,
	scrollbarHide: false,
	scrollbarDraggable: true,
	scrollbar: '.slchgame .swiper-scrollbar',
	breakpointsInverse: true,
	breakpoints: {
		992: {
			slidesPerView: 3
		}
	}
});
function popupacc(id) {
	swal({
		title: "SHOP TÈO CAO THỦ",
		text: "Với acc trắng thông tin ae chuyển tiền qua momo, bank với nội dung: ACC " + id + "<cách> SĐT\n"
		+ "Với acc có thông tin, ae liên hệ fanpage facebook để giao dịch"
		+ "\nKhi nhận được tiền bên mình sẽ gửi tài khoản qua SĐT sớm nhất có thể, mọi thắc mắc liên hệ fanpage facebook"
		+ "\nMOMO : 0963129036 , BANK: 19037833166011 - techcombank - trinh trong toan",
		showCancelButton: false,
		confirmButtonColor: "#DD6B55",
		confirmButtonText: "Thoát",
		closeOnConfirm: true,
		showLoaderOnConfirm: true
	}, function() {
		
	});
}