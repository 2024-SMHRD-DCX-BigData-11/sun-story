<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="assets/css/main.css">
<title>Sun-Story</title>
</head>
<body>
   <div class="mainpage">
          <div class="searchbar"><!--좌측 검색배너-->
               <div class="header"><!--좌상단 헤더부분-->
                    <div class="category"><!--카테고리 버튼들-->
                                    <div class="button-tag">
                              <div class="state-layer">
                                   <b class="category-text">태그별로</b>
                              </div>
                         </div>
                         <div class="button-repre">
                              <div class="state-layer">
                                   <b class="category-text">대표 관광지</b>
                              </div>
                         </div>
                         <div class="button-lookall">
                              <div class="state-layer">
                                   <b class="category-text">전체보기</b>
                              </div>
                         </div>
                    </div>
                    <div class="search-bar" id="searchBarContainer"><!--검색창-->
                         <form action="#" method="post">
                            <div class="state-layer3">
                              <div class="content">
                                   <input class="supporting-text" type="text" placeholder="검색어를 입력하세요"> 
                              </div>
                              <div class="trailing-elements">
                                   <div class="st-trailing-icon">
                                        <div class="container">
                                             <div class="state-layer4">
                                                  <img class="search-icon" alt="검색" src="assets/images/Icon.svg">
                                                  
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                        </form>
                    </div>
                    <img class="logo_sunstory" alt="순토리" src="assets/images/순토리1.png">
                    
               </div>
               <div class="spotlist-bar"><!--검색결과 리스트창-->
                    <div class="all-list"> <!--전체보기-->
                         <div class="spot" id="spotContainer"><!--리스트내의 각 검색결과 항목들-->
                              <img class="image-icon" alt="장소 사진" src="assets/images/순토리1.png">
                              
                              <div class="spot-name">#끝내주는곳</div>
                              <div class="spot-address">순천시 XX면  XX길</div>
                              <div class="spot-subtitle">끝내주는 장소 1</div>
                              <div class="spot-tag">장소1</div>
                         </div>
                    </div>
               </div>
          </div>
          <div class="map"><!--우측 지도창-->
               <img class="map-frame-icon" alt="지도 부분을 사진으로 표현해놓음" src="assets/images/순토리1.png">
               
               <div class="qrbutton"><!--QR버튼-->
                    <div class="state-layer5">
                         <div class="label-text3">QR</div>
                    </div>
               </div>
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
          
          <div class="detail">
               <div class="detail-child">
               </div>
               <div class="pay-text">요금</div>
               <img class="image-icon1" alt="" src="assets/images/Image.png">
               
               <div class="content-title">장소 1</div>
               <div class="subtitle">
                    <p class="p">추천할만한 장소 1</p>
                    <p class="p">전남 순천시 XX면 XX로 XXX번길 </p>
               </div>
               <div class="content-text">
                    <p class="p"> 장소 1은 순천시의 관광지로서 추천할만한 장소로, XX해서 XX한 장소이다.</p>
                    <p class="p">당신이 순천에 방문한다면 한번쯤은 방문해보는 것을 추천한다.</p>
               </div>
               <img class="close-icon" alt="" src="assets/images/close.svg">
               
               <div class="more-info"><!--추가정보조회 버튼-->
                    <div class="more-info-state-layer">
                         <div class="button-text">더 많은 정보를 보고싶다면 클릭!</div>
                    </div>
               </div>
               <div class="using-info">이용정보</div>
               <div class="rectangle-using-info">
                    <div class="frame-child">
                    </div>
                    <img class="headphones-icon" alt="" src="assets/images/Headphones.svg">
                    
                    <div class="show-storytelling"><!--스토리텔링 보기(스토리텔링 장소 리스트 토글버튼)-->
                         <div class="show-storytelling-text">스토리텔링 보기</div>
                    </div>
               </div>
               <div class="use-time">운영시간</div>
          </div>
          
          
     </div>

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
     <script src="assets/js/main.js"></script>
     
     <script>
     var audio;	
     
     $( document ).ready( function( event ) {
    	 var AudioContext;
    	 var audioContext;

    	 window.onload = function() {
    	     navigator.mediaDevices.getUserMedia({ audio: true }).then(() => {
    	         AudioContext = window.AudioContext || window.webkitAudioContext;
    	         audioContext = new AudioContext();
    	         audioPlay(1);
    	     }).catch(e => {
    	         console.error(`Audio permissions denied: ${e}`);
    	     });
    	 }
     });
     	async function audioPlay( idx ) {
     		$.ajax({
     			url : "audio",
     			data : { idx : idx },
     			type : "post"
     		}).done( function( response ) {
     			if( response.resultCode == 200 ) {
     				audio = new Audio( response.result );
         			audio.play();
     			} else {
     				
     			}
     		});
     	}
     </script>
</body>
</html>