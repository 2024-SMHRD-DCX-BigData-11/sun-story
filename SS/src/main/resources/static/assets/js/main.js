var clickEvent = (function() {
  if ('ontouchstart' in document.documentElement === true) {
    return 'touchstart';
  } else {
    return 'click';
  }
})();

// 검색창 클릭 시 토글 나오는 기능
var searchBarContainer = document.getElementById("searchBarContainer");
if (searchBarContainer) {
	searchBarContainer.addEventListener(clickEvent, function() {
		togglePopup("searchlistContainer");
	});
}

// 결과 리스트에서 항목 클릭 시 상세보기 페이지 팝업창

$(".show-storytelling").off().on(clickEvent, function(e) {
	console.log("클릭");
	console.log($("#audioPlayer").css("display"));
	if ($("#audioPlayer").css("display") == "none") {
		$("#audioPlayer").css("display", "block");
	} else if ($("#audioPlayer").css("display") == "block") {
		$("#audioPlayer").css("display", "none");
	}
});




// 팝업 토글 함수
function togglePopup(popupId) {
	var popup = document.getElementById(popupId);
	if (!popup) return;
	if ($("#audioPlayer").css("display") != "none") {
				$("#audioPlayer").css("display", "none");
			}
	$('.popup-content').scrollTop(0);
	var popupStyle = popup.style;
	popupStyle.display = "flex";
	popupStyle.zIndex = 100;
	/*popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";*/
	popupStyle.alignItems = "center";
	popupStyle.justifyContent = "center";
	popup.setAttribute("closable", "");

	// 클릭 이벤트를 통해 팝업 닫기
	var closeIcon = popup.querySelector(".close-icon");
	console.log(closeIcon);
	if (closeIcon) {
		closeIcon.addEventListener(clickEvent,function() {
			popupStyle.display = "none";
			console.log("닫음.");
			console.log(audio);
			if (!audio.paused) {
				audio.pause();
			}
			if ($("#audioPlayer").css("display") != "none") {
				$("#audioPlayer").css("display", "none");
			}
		});
	}
};

// 클릭 시 색상 바뀜

$(document).ready(function() {
    // .button-lookall 요소를 클릭했을 때 배경색을 red로 변경
    $('.state-layer button').on('click', function() {
        console.log('lookall clicked');  // 콘솔 로그 추가
		// 모든 .hashtag 요소의 배경색을 초기화 (원래 색상으로 되돌리기)
        $('.state-layer button').css('background-color', '');
        $(this).css('background-color', '#f94b00');
    });

    // .hashtag 요소를 클릭했을 때 해당 요소만 배경색을 blue로 변경
    $('.hashtag').on('click', function() {
        // 모든 .hashtag 요소의 배경색을 초기화 (원래 색상으로 되돌리기)
        $('.hashtag').css('background-color', '');

        // 클릭된 요소만 배경색을 blue로 변경
        $(this).css('background-color', '#00877c');
    });
});

