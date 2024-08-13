<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>마커 클러스터</title>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"
        integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
    <script type="text/javascript"
        src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=gd84en4c8l"></script>
    <script type="text/javascript" src="assets/js/MarkerClustering.js"></script>
    <style type="text/css">
        html,
        body {
            width: 100%;
            height: 100%;
            padding: 0;
            margin: 0;
        }
    </style>
</head>

<body>
    <div style="display: flex;">
        <div style="width: 40%; height: 800px;display: flex; flex-direction: column;">
            <button id="show">마커 보기</button>
            <button id="change">변경하기</button>
        </div>
        <div id="map" style="width:60%; height:800px;padding:0;margin:0;"></div>
    </div>
    
    <script type="text/javascript" src="assets/js/navermap.js"></script>
</body>
</html>