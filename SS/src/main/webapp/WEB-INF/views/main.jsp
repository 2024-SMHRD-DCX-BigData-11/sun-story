<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">	
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/images/순토리1.png">
<title>Sun-Story</title>

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
}
ul {
	margin: 0;
	padding: 5px;
}

li {
	list-style: none;
}
</style>
</head>
<body>
   <div class="mainpage">
          <div class="searchbar"><!--좌측 검색배너-->
               <div class="header"><!--좌상단 헤더부분-->
                   <img class="logo_sunstory" alt="순토리" src="assets/images/순토리1.png">
                   <div class="three">
                   		<div class="two">
		                    <div class="search-bar"><!--검색창-->
		                         <form action="#" method="post">
		                            <div class="state-layer3">
		                              <div class="content">
		                                   <input class="supporting-text" type="search" placeholder="검색어를 입력하세요" title="검색어를 입력하세요"> 
		                              </div>
		                              <div class="trailing-elements">
		                                <div class="container">
		                                  <button type="button" class="button_search" id="searchBarContainer">
		                                    <img class="search-icon" alt="검색" src="assets/images/Icon.svg">
		                                  </button>
		                                 </div>
		                              </div>
		                         </div>
		                        </form>
		                    </div>
		                    <a href="QrPage"><div class="qrbutton"><!--QR버튼-->
			                  <div class="label-text3">QR</div>
	               			</div></a>
                   	</div>
						<div class="category">
						    <div class="button-common lookall">
						        <b class="category-text">전체</b>
						    </div>
						    <div class="button-common repre">
						        <b class="category-text">대표 관광지</b>
						    </div>
						    <div class="button-common tag">
						        <b class="category-text">태그별</b>
						    </div>
						</div>
                   </div>
                  	 <div style="height: 75%; display: flex; flex-direction: column;">
				<ul id="list" style="overflow-y: scroll">
					<c:forEach var="trip" items="${list}">
						<li id="popupContainer"
							style="width: 100%; height: 100px; display: flex; flex-direction: row;">
							<div>
								<img style="width: 100px; height: 100px;"
									src="assets/images/관광지/${trip.name }.jpg">
							</div>
							<div style="width: 100%; text-align: left">
								<h3 style="font-weight: bold;">${trip.name }</h3>
								<h3>${trip.address }</h3>
							</div>
						</li>
					</c:forEach>
				</ul>
				</div>
               </div>
              
          </div><!-- 좌측 배너 div 끝 부분 -->
          <div class="map"><!--우측 지도창-->
			<div id="map" style="width: 100%; height: 100%; padding: 0; margin: 0;"></div>
          </div>
     </div>
     
     <div id="searchlistContainer" class="popup-overlay" style="display:none"><!--검색창의 검색어 자동완성 토글-->
          
          <div class="searchlist">
               <div class="result">
                    <div class="result-child">
                    </div>
                    <b class="result-name">검색결과 1</b>
                    <div class="address">순천시 XX면 XXX길</div>
               </div>
               <div class="result">
                    <div class="result-child">
                    </div>
                    <b class="result-name">검색결과 1</b>
                    <div class="address">순천시 XX면 XXX길</div>
               </div>
               <div class="result">
                    <div class="result-child">
                    </div>
                    <b class="result-name">검색결과 1</b>
                    <div class="address">순천시 XX면 XXX길</div>
               </div>
          </div>
          
          
     </div>
     
     <div id="detailContainer" class="popup-overlay" style="display:none"> <!--장소 상세보기-->
    	<div class="popup-content">
        	<!-- <span class="close-popup">&times;</span> -->
	          <div class="detail">
	               <div class="detail-child">
		               <img class="close-icon" alt="x" src="assets/images/close.svg">
		               <img class="image-icon1" alt="장소 이미지" src="assets/images/Image.png">
		               
		               <div class="content-title">장소 1</div>
		               <div class="subtitle">
		                    <p class="p">추천할만한 장소 1</p>
		                    <p class="p">전남 순천시 XX면 XX로 XXX번길 </p>
		               </div>
		               <div class="content-text">
		                    <p class="p"> 장소 1은 순천시의 관광지로서 추천할만한 장소로, XX해서 XX한 장소이다.</p>
		                    <p class="p">당신이 순천에 방문한다면 한번쯤은 방문해보는 것을 추천한다.</p>
		               </div>
		               
		               <div class="rectangle-using-info">
		                    <div class="show-storytelling"><!--스토리텔링 보기(스토리텔링 장소 리스트 토글버튼)-->
		                         <div class="show-storytelling-text">스토리텔링 보기</div>
		                    </div>
		                    <div class="frame-child">
		                    </div>
		                    <img class="headphones-icon" alt="스토리텔링 듣기" src="assets/images/Headphones.svg">
		                    
		               </div>
			               <div class="using-info">이용정보</div>
			               <div class="use-time">운영시간</div>
			               <div class="pay-text">요금</div>
			               <div class="more-info"><!--추가정보조회 버튼-->
			                    <div class="more-info-state-layer">
			                         <div class="button-text">더 많은 정보를 보고싶다면 클릭!</div>
			                    </div>
			               </div>
		               
	               </div>
	          </div>
	    </div>
	</div>
          
    <script src="assets/js/main.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gd84en4c8l"></script>
	<script type="text/javascript" src="assets/js/MarkerClustering.js"></script>
	<script type="text/javascript" src="assets/js/navermap.js"></script>

	<script>
     var audio;
     var AudioContext;
     var audioContext;

     $(document).ready(function(event) {
         navigator.mediaDevices.getUserMedia({ audio: true })
             .then(() => {
                 AudioContext = window.AudioContext || window.webkitAudioContext;
                 audioContext = new AudioContext();
                 audioPlay(1);
             })
             .catch(e => {
                 console.error(`Audio permissions denied: ${e}`);
                 alert("Audio permissions were denied. Please allow microphone access and try again.");
             });
     });

     async function audioPlay(idx) {
         $.ajax({
             url: "audio",
             data: { idx: idx },
             type: "post"
         }).done(function(response) {
             if (response.resultCode == 200) {
                 audio = new Audio(response.result);
                 audio.play();
             } else {
                 // Error handling
             }
         });
     }
     </script>
     <script>
	  /* // 팝업 열기
	     function openPopup() {
	         document.getElementById('popupContainer').style.display = 'flex';
	     }
	
	     // 팝업 닫기
	     function closePopup() {
	         document.getElementById('popupContainer').style.display = 'none';
	     }
	
	     // 팝업 닫기 버튼 클릭 이벤트
	     document.querySelector('.close-popup').addEventListener('click', closePopup);
	
	     // 예시: 특정 버튼을 클릭하면 팝업이 열리도록 설정
	     document.querySelector('.button-tag').addEventListener('click', openPopup); */

	  // 팝업을 토글하는 함수
	     function togglePopup(popupId) {
	         var popup = document.getElementById(popupId);
	         if (!popup) return;

	         var popupStyle = popup.style;
	         if (popupStyle.display === "none" || popupStyle.display === "") {
	             popupStyle.display = "flex"; // 팝업 열기
	         } else {
	             popupStyle.display = "none"; // 팝업 닫기
	         }

	         popupStyle.zIndex = 100;
	         popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";
	         popupStyle.alignItems = "center";
	         popupStyle.justifyContent = "center";
	         popup.setAttribute("closable", "");

	         // 팝업 외부 클릭 시 닫기
	         popup.onclick = function (e) {
	             if (e.target === popup && popup.hasAttribute("closable")) {
	                 popupStyle.display = "none";
	             }
	         };

	         // 팝업 닫기 아이콘 클릭 시 닫기
	         var closeIcon = popup.querySelector(".close-icon");
	         if (closeIcon) {
	             closeIcon.onclick = function () {
	                 popupStyle.display = "none";
	             };
	         }
	     }

	     // 모든 li 요소에 이벤트 리스너 추가
	     document.querySelectorAll("#popupContainer").forEach(function (item) {
	         item.addEventListener("click", function () {
	             togglePopup("detailContainer");
	         });
	     });


     </script>
</body>
</html>