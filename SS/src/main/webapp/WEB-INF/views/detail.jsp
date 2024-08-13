<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link rel="stylesheet" type="text/css" href="assets/css/detail.css">
<title>Detail page</title>
</head>
<body>
<div class="detaillist">
          <div class="detaillist-child">
          </div>
          <div class="table">
               <div class="row">
                    <div class="row1">
                         <div class="cell" id="cellContainer">
                              <div class="content">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                         <div class="cell">
                              <div class="content1">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="row1">
                         <div class="cell">
                              <div class="content">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                         <div class="cell">
                              <div class="content1">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="row">
                    <div class="row1">
                         <div class="cell">
                              <div class="content">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                         <div class="cell">
                              <div class="content1">
                                   <div class="text"> · 세부장소 </div>
                              </div>
                         </div>
                    </div>
               </div>
          </div>
     </div>
     
     <div id="showstorytellingContainer" class="popup-overlay" style="display:none">
          
          <div class="showstorytelling">
               <div class="showstorytelling-child">
               </div>
               <div class="xx-xx-container">
                    <p class="xx-xx"> 장소 1은 XX해서 XX한 곳이랍니다~~</p>
                    <p class="xx">XX 한 사람들에게 추천드려요~~~</p>
               </div>
               <div class="div">스토리텔링 보기</div>
               <img class="close-icon" alt="" src="assets/images/close.svg">
               
               <img class="headphones-icon" alt="" src="assets/images/Headphones.svg">
               
          </div>
          
          
     </div>
     
     
     
     <script>
          var cellContainer = document.getElementById("cellContainer");
          if(cellContainer) {
               cellContainer.addEventListener("click", function () {
                    var popup = document.getElementById("showstorytellingContainer");
                    if(!popup) return;
                    var popupStyle = popup.style;
                    if(popupStyle) {
                         popupStyle.display = "flex";
                         popupStyle.zIndex = 100;
                         popupStyle.backgroundColor = "rgba(113, 113, 113, 0.3)";
                         popupStyle.alignItems = "center";
                         popupStyle.justifyContent = "center";
                    }
                    popup.setAttribute("closable", "");
                    
                    var onClick = popup.onClick || function(e) {
                         if(e.target === popup && popup.hasAttribute("closable")) {
                              popupStyle.display = "none";
                         }
                    };
                    popup.addEventListener("click", onClick);
               });
          }</script>
</body>
</html>