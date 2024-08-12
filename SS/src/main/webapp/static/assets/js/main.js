// 검색창 클릭 시 토글 나오는 기능
var searchBarContainer = document.getElementById("searchBarContainer");
if (searchBarContainer) {
    searchBarContainer.addEventListener("click", function () {
        togglePopup("searchlistContainer");
    });
}

// 결과 리스트에서 항목 클릭 시 상세보기 페이지 팝업창
var spotContainer = document.getElementById("spotContainer");
if (spotContainer) {
    spotContainer.addEventListener("click", function () {
        togglePopup("detailContainer");
    });
}

// 팝업 토글 함수
function togglePopup(popupId) {
    var popup = document.getElementById(popupId);
    if (!popup) return;

    var popupStyle = popup.style;
    popupStyle.display = "flex";
    popupStyle.zIndex = 100;
    popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";
    popupStyle.alignItems = "center";
    popupStyle.justifyContent = "center";
    popup.setAttribute("closable", "");

    // 클릭 이벤트를 통해 팝업 닫기
    popup.onclick = function (e) {
        if (e.target === popup && popup.hasAttribute("closable")) {
            popupStyle.display = "none";
        }
    };
}
