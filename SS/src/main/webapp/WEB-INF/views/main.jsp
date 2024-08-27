<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn-uicons.flaticon.com/2.5.1/uicons-regular-straight/css/uicons-regular-straight.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" ma
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
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
	<div class="mainpage">
		<div class="searchbar">
			<div class="spotlist-frame">
				<div class="spot-list">
					<!-- <ul class="list"> 부분 -->
					<div class="spot">
						<input class="idx" type="hidden" /> <img class="image-icon"
							alt="장소사진" src="assets/images/image.png">
						<div class="spot-name">장소1</div>
					</div>
				</div>
			</div>
			<div class="sidebar">
				<div class="categorybutton">
					<a href="QrPage"><div class="qrbutton">
							<!--QR버튼-->
							<div class="label-text3">
								<i class="fi fi-rs-qr"></i><p style="margin:0; font-size: 10px;"></p>
							</div>
						</div>
						<div class="info" style="padding-top:0.4rem;">QR</div></a>
					<div class="button-lookall">
						<div class="state-layer">
							<button class="lookall">
								<i class="fi fi-tr-plane-alt" style="font-size: 25px"></i>
							</button>
						</div>
					</div>
					<div class="info">ALL</div>
					<div class="button-lookall">
						<div class="state-layer">
							<button class="repre">
								<i class="fi fi-ts-ranking-star" style="font-size: 25px"></i>
							</button>
						</div>
					</div>
					<div class="info">TOP</div>
					<div class="button-lookall">
						<div class="state-layer">
							<button class="tag">
								<i class="fi fi-tr-tags" style="font-size: 25px"></i>
							</button>
						</div>
					</div>
					<div class="info">TAG</div>
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
								<b class="label-text">#사진찍기좋은곳</b>
							</div>
						</div>
						<div class="hashtag">
							<div class="state-layer">
								<b class="label-text">#산책하기좋은곳</b>
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
			<a href="main">
				<img class="logo_sunstory" alt="순토리" src="assets/images/순토리1.png">
			</a>
				<div class="search-bar">
					<!-- 검색창 -->
					<div class="state-layer3">
						<div class="content">
							<input class="supporting-text" type="search"
								placeholder="검색어를 입력하세요" title="검색어를 입력하세요">
						</div>
						<div class="trailing-elements">
							<div class="container">
								<button type="button" class="button_search"
									id="searchBarContainer">
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
			<div id="map"
				style="width: 100%; height: 100%; padding: 0; margin: 0;"></div>
		</div>

		<div id="detailContainer" class="popup-overlay" style="display: none">
			<!--장소 상세보기-->
			<div class="popup-content">
				<!-- <span class="close-popup">&times;</span> -->
				<div class="detail">
					<div class="detail-child">
						<div class="content-top">
						<h6 style="margin:3px;"></h6>
							<img class="close-icon" alt="x" src="assets/images/close.svg">
							<img class="image-icon1" alt="장소 이미지"
								src="assets/images/image.png">
							
							<div class="content-title">장소 1</div>
							<div class="subtitle">
								<div class="subtitle-1">
									<img class="image-info" alt="소개이미지" src="assets/images/info.png">
									<p class="p" id="subtitle" style="font-weight: bold;">추천할만한 장소 1</p>
								</div>
								<div class="subtitle-2">
									<img class="image-location" alt="위치이미지" src="assets/images/location.png">
									<p class="p" id="address">전남 순천시 XX면 XX로 XXX번길</p>
								</div>
							</div>
							<div class="content-text">
								<p class="p" id="content-p">장소 1은 순천시의 관광지로서 추천할만한 장소로, XX해서
									XX한 장소이다.</p>
							</div>
							<div class="rectangle-using-info">
								<div class="show-storytelling">
									<!--스토리텔링 듣기(스토리텔링 장소 리스트 토글버튼)-->
									<div class="show-storytelling-text">스토리텔링 듣기</div>
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
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gd84en4c8l"></script>
	<script type="text/javascript" src="assets/js/MarkerClustering.js"></script>
	<script type="text/javascript" src="assets/js/navermap.js"></script>
</body>
</html>