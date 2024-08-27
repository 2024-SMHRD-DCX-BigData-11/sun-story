// 검색창 클릭 시 토글 나오는 기능
var searchBarContainer = document.getElementById("searchBarContainer");
if (searchBarContainer) {
	searchBarContainer.addEventListener("click", function() {
		togglePopup("searchlistContainer");
	});
}

// 결과 리스트에서 항목 클릭 시 상세보기 페이지 팝업창

$(".show-storytelling").off().on("click", function(e) {
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
	popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";
	popupStyle.alignItems = "center";
	popupStyle.justifyContent = "center";
	popup.setAttribute("closable", "");

	// 클릭 이벤트를 통해 팝업 닫기
	var closeIcon = popup.querySelector(".close-icon");
	if (closeIcon) {
		closeIcon.onclick = function() {
			popupStyle.display = "none";
			console.log("닫음.");
			console.log(audio);
			if (!audio.paused) {
				audio.pause();
			}
			if ($("#audioPlayer").css("display") != "none") {
				$("#audioPlayer").css("display", "none");
			}
		};
	}
};


