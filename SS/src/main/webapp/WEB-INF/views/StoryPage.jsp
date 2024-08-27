<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" ma
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="assets/css/detail.css">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/images/순토리1.png">
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.5.1/uicons-thin-straight/css/uicons-thin-straight.css'>
<link rel='stylesheet'
	href='https://cdn-uicons.flaticon.com/2.5.1/uicons-thin-rounded/css/uicons-thin-rounded.css'>
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
	<div id="detailContainer" class="popup-overlay">
		<!--장소 상세보기-->
		<div class="popup-content">
			<div class="detail">
				<div class="detail-child">
					<div class="content-top">
						<h6 style="margin: 3px;"></h6>
						<img class="image-icon1" alt="장소 이미지"
							src="assets/images/관광지/${list.tourphoto}.jpg">
						<input type="hidden" id="lat" value="${list.lat }"/>
						<input type="hidden" id="lon" value="${list.lon }"/>
						<div class="content-title">${list.toursite }</div>
						<div class="subtitle">
							<div class="subtitle-1">
								<img class="image-info" alt="소개이미지" src="assets/images/info.png">
								<p class="p" id="subtitle" style="font-weight: bold;">${list.tourtitle }</p>
							</div>
							<div class="subtitle-2">
								<img class="image-location" alt="위치이미지"
									src="assets/images/location.png">
								<p class="p" id="address">${list.touraddr }</p>
							</div>
						</div>
						<div class="content-text">
							<p class="p" id="content-p">${list.tourdesc }</p>
						</div>
						<div class="rectangle-using-info">
							<div class="show-storytelling">
								<!--스토리텔링 보기(스토리텔링 장소 리스트 토글버튼)-->
								<div class="show-storytelling-text">스토리텔링 보기</div>
							</div>
						</div>
						<div id="audioPlayer">
							<img id="coverImage" src="assets/images/순토리1.png"
								alt="Cover Image">
							<audio id="audio" src="assets/mp3/긴배경음.mp3" preload="metadata"
								controls controlsList="nodownload"></audio>
						</div>
					</div>
					<div id="submap"></div>

				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gd84en4c8l"></script>
	<script type="text/javascript" src="assets/js/Story.js"></script>
</body>
</html>