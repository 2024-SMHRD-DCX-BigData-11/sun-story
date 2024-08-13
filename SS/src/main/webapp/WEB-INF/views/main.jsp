<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="static/assets/css/main.css">
<title>Sun-Story</title>
</head>
<body>
 <div class="mainpage">
          <div class="map">
               <img class="map-child" alt="" src="static/images/순토리1.png">
               
               <div class="qrbutton">
                    <div class="state-layer">
                         <div class="label-text">QR</div>
                    </div>
               </div>
          </div>
          <div class="searchbar">
               <div class="header">
                    <div class="header-child">
                    </div>
                    <div class="categorybutton">
                         <div class="button">
                              <div class="state-layer1">
                                   <b class="label-text1">태그별로</b>
                              </div>
                         </div>
                         <div class="button1">
                              <div class="state-layer1">
                                   <b class="label-text1">대표관광지</b>
                              </div>
                         </div>
                         <div class="button2">
                              <div class="state-layer1">
                                   <b class="label-text1">전체보기</b>
                              </div>
                         </div>
                    </div>
                    <div class="search-bar" id="searchBarContainer">
                         <div class="state-layer4">
                              <div class="content">
   								 <input type="text" placeholder="검색어 입력" />
   								 <button type="submit">전송</button>
									</div>


                              <div class="trailing-elements">
                                   <div class="st-trailing-icon">
                                        <div class="container">
                                             <div class="state-layer5">
                                                  <img class="icon" alt="" src="static/images/Icon.svg">
                                                  
                                             </div>
                                        </div>
                                   </div>
                              </div>
                         </div>
                    </div>
                    <img class="icon1" alt="" src="static/images/순토리1.png">
                    
               </div>
          </div>
          <div class="spotlistbar">
               <div class="alllist">
                    <div class="spot" id="spotContainer">
                         <div class="spot-child">
                         </div>
                         <img class="image-icon" alt="" src="static/images/location_on.svg">
                         
                         <div class="div">장소1</div>
                         <div class="div1">끝내주는 장소 1</div>
                         <div class="xx-xx">순천시 XX면  XX길</div>
                         <div class="div2">#끝내주는곳</div>
                    </div>
               </div>
          </div>
     </div>
     
     <div id="searchlistContainer" class="popup-overlay" style="display:none">
          
          <div class="searchlist">
               <div class="result">
                    <div class="result-child">
                    </div>
                    <b class="b">검색결과 1</b>
                    <div class="xx-xxx">순천시 XX면 XXX길</div>
               </div>
               <div class="result1">
                    <div class="result-child">
                    </div>
                    <b class="b">검색결과 1</b>
                    <div class="xx-xxx">순천시 XX면 XXX길</div>
               </div>
               <div class="result2">
                    <div class="result-child">
                    </div>
                    <b class="b">검색결과 1</b>
                    <div class="xx-xxx">순천시 XX면 XXX길</div>
               </div>
          </div>
          
          
     </div>
     
     <div id="detailContainer" class="popup-overlay" style="display:none">
          
          <div class="detail">
               <div class="detail-child">
               </div>
               <div class="div3">요금</div>
               <img class="image-icon1" alt="" src="static/images/Image.png">
               
               <div class="div4">장소 1</div>
               <div class="xx-xx-xxx-container">
                    <p class="p">추천할만한 장소 1</p>
                    <p class="xx-xx-xxx">전남 순천시 XX면 XX로 XXX번길 </p>
               </div>
               <div class="xx-xx-container">
                    <p class="p"> 장소 1은 순천시의 관광지로서 추천할만한 장소로, XX해서 XX한 장소이다.</p>
                    <p class="xx-xx-xxx">당신이 순천에 방문한다면 한번쯤은 방문해보는 것을 추천한다.</p>
               </div>
               <img class="close-icon" alt="" src="static/images/close.svg">
               
               <div class="button3">
                    <div class="state-layer6">
                         <div class="label-text4">더 많은 정보를 보고싶다면 클릭!</div>
                    </div>
               </div>
               <div class="div5">이용정보</div>
               <div class="rectangle-parent">
                    <div class="frame-child">
                    </div>
                    <img class="headphones-icon" alt="" src="static/images/Headphones.svg">
                    
                    <div class="button4">
                         <div class="button5">스토리텔링 보기</div>
                    </div>
               </div>
               <div class="div6">운영시간</div>
          </div>
          
          
     </div>
     
     
     <script src="static/assets/js/main.js"></script>
     <script>
        </script>
</body>
</html>