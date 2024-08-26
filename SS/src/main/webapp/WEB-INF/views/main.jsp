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
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/순토리1.png">
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
</style>
</head>
<body>
	<div class="mainpage">
     <div class="searchbar">
          <div class="spotlist-frame">
               <div class="spot-list">
				<!-- <ul class="list"> 부분 -->
                    <div class="spot">
                         <img class="image-icon" alt="장소사진" src="Image.png">
                         <div class="spot-name">장소1</div>
                    </div>
               </div>
          </div>
          <div class="sidebar">
               <div class="categorybutton">
                    <a href="QrPage"><div class="qrbutton">
							<!--QR버튼-->
							<div class="label-text3">QR</div>
						</div></a>
                    <div class="button-lookall">
                         <div class="state-layer">
                              <b class="label-text">전체보기</b>
                         </div>
                    </div>
                    <div class="button-lookall">
                         <div class="state-layer">
                              <b class="label-text">대표 관광지</b>
                         </div>
                    </div>
                    <div class="button-lookall">
                         <div class="state-layer">
                              <b class="label-text">태그별로</b>
                         </div>
                    </div>
               </div>
               <div class="tag-list">
                    <div class="tags">
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#관광지</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#자연</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#체험</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">
                                        <p class="p">#사진찍기</p>
                                        <p class="p">좋은곳</p>
                                   </b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">
                                        <p class="p">#산책하기</p>
                                        <p class="p">좋은곳</p>
                                   </b>
                              </div>
                         </div> 
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#가족여행</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#역사</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#문화</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#힐링</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#불교</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#경치좋은곳</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#반려동물</b>
                              </div>
                         </div>
                         <div class="hashtag">
                              <div class="state-layer">
                                   <b class="label-text">#맛집</b>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
          <div class="header">
               <img class="logo_sunstory" alt="순토리" src="assets/images/순토리1.png">

	           				<div class="search-bar">
									<!--검색창-->
									<div class="state-layer3">
										<div class="content">
											<input class="supporting-text" type="search"
													placeholder="검색어를 입력하세요" title="검색어를 입력하세요">
										</div>
										<div class="trailing-elements">
											<div class="container">
			                                    <button type="button" class="button_search" id="searchBarContainer">
													<img class="search-icon" alt="검색" src="assets/images/Icon.svg">
												</button>
			                                </div>
			                            </div>
			                       </div>
	                        </div>
	               
          	</div>
           </div>

			<!-- 좌측 배너 div 끝 부분 -->
			<div class="map">
				<!--우측 지도창-->
				<div id="map" style="width: 100%; height: 100%; padding: 0; margin: 0;"></div>
			</div>

			<div id="detailContainer" class="popup-overlay" style="display: none">
				<!--장소 상세보기-->
				<div class="popup-content">
					<!-- <span class="close-popup">&times;</span> -->
					<div class="detail">
						<div class="detail-child">
							<div class="content-top">
								<img class="close-icon" alt="x" src="assets/images/close.svg">
								<img class="image-icon1" alt="장소 이미지"
									src="assets/images/${trip.name }.png">
		
								<div class="content-title">장소 1</div>
								<div class="subtitle">
									<p class="p" id="subtitle">추천할만한 장소 1</p>
									<p class="p" id="address">전남 순천시 XX면 XX로 XXX번길</p>
								</div>
								<div class="content-text">
									<p class="p" id="content-p">장소 1은 순천시의 관광지로서 추천할만한 장소로, XX해서
										XX한 장소이다.</p>
								</div>
								<div id="submap"></div>
								<div class="rectangle-using-info">
									<div class="show-storytelling">
										<!--스토리텔링 보기(스토리텔링 장소 리스트 토글버튼)-->
										<div class="show-storytelling-text">스토리텔링 보기</div>
									</div>
									<div class="frame-child"></div>
									<img class="headphones-icon" alt="스토리텔링 듣기"
										src="assets/images/Headphones.svg">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
		<script src="assets/js/main.js"></script>
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
	     document.addEventListener("DOMContentLoaded", function() {
	    	    // 기존 코드 유지
	    	    
	    	    document.body.addEventListener('click', function(event) {
	    	        if (event.target.closest('#button-common-lookall')) {
	    	            document.querySelectorAll('.button-common').forEach(function(btn) {
	    	                btn.classList.remove('active');
	    	            });
	    	            event.target.closest('.button-common').classList.add('active');
	    	        } else if (event.target.closest('#button-common-repre')) {
	    	            document.querySelectorAll('.button-common').forEach(function(btn) {
	    	                btn.classList.remove('active');
	    	            });
	    	            event.target.closest('.button-common').classList.add('active');
	    	        } else if (event.target.closest('#button-common-tag')) {
	    	            document.querySelectorAll('.button-common').forEach(function(btn) {
	    	                btn.classList.remove('active');
	    	            });
	    	            event.target.closest('.button-common').classList.add('active');
	    	        }
	
	    	        // 이벤트 위임을 이용해 동적으로 추가된 li 태그도 이벤트를 잡을 수 있게 함
	    	        if (event.target.closest('.popupContainer') || event.target.closest('li')) {
	    	            var target = event.target.closest('.popupContainer') || event.target.closest('li');
	    	            var data = {
	    	                tripname: target.getAttribute('data-tripname')
	    	            };
	    	            togglePopup("detailContainer", data);
	    	        }
	    	    });
	
	    	    // 팝업 관련 함수 유지
	    	    function togglePopup(popupId, data) {
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
	
	    	        popup.onclick = function (e) {
	    	            if (e.target === popup && popup.hasAttribute("closable")) {
	    	                popupStyle.display = "none";
	    	            }
	    	        };
	
	    	        var closeIcon = popup.querySelector(".close-icon");
	    	        if (closeIcon) {
	    	            closeIcon.onclick = function () {
	    	                popupStyle.display = "none";
	    	                console.log("닫음.");
	    	                console.log(audio);
	    	                if (!audio.paused) {
								audio.pause();
							}
	    	            };
	    	        }
	    	    }
	    	});
	

    </script>
</body>
</html>