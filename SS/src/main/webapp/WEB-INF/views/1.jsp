<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<title>Insert title here</title>
<style type="text/css">
div{
display: flex;
flex-direction: column;
}
</style>
</head>
<body>
<a href="test"><div style="width: 100px; height: 100px; background: yellow"></div></a>
<div>
<c:forEach var="trip" items="${list}">
						<div style="width: 100%; text-align: center">
							<h2>${trip.poi_idx }</h2>
							<h3>${trip.tour_idx.tour_idx }</h3>
							<h3>${trip.poi_name }</h3>
							<h3>${trip.poi_photo }</h3>
							<h3>${trip.poi_info }</h3>
						</div>
				</c:forEach>
</div>
</body>
</html>