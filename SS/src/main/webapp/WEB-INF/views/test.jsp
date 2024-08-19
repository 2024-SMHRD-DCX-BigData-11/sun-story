<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>마커 클러스터</title>

<style type="text/css">
html, body {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
}

button {
	width: 33%;
	height: 50px;
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
	<div style="display: flex; width: 100%; height: 100%;">
		<div
			style="width: 40%; height: 100%; display: flex; flex-direction: column;">
			<div
				style="width: 100%; height: 50px; display: flex; flex-direction: row">
				<button id="all">전체 관광지</button>
				<button id="major">주요 관광지</button>
				<button id="tag">태그</button>
			</div>
			<ul id="list" style="overflow-y: scroll">
				<c:forEach var="trip" items="${list}">
					<li
						style="width: 100%; height: 100px; display: flex; flex-direction: row;">
						<div>
							<img style="width: 100px; height: 100px;"
								src="assets/images/관광지/${trip.name }.jpg">
						</div>
						<div style="width: 100%; text-align: center">
							<h2>${trip.name }</h2>
							<h3>${trip.address }</h3>
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
		<div id="map" style="width: 60%; height: 100%; padding: 0; margin: 0;"></div>
	</div>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"
		integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gd84en4c8l"></script>
	<script type="text/javascript" src="assets/js/MarkerClustering.js"></script>
	<script type="text/javascript" src="assets/js/navermap.js"></script>

</body>
</html>