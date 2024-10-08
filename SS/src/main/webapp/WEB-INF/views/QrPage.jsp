<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QR scan test</title>
<script src="assets/js/jsQR.js"></script>
<style type="text/css">
@font-face {
	font-family: 'KOTRA_GOTHIC';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.0/KOTRA_GOTHIC.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
*{
	font-family: 'KOTRA_GOTHIC';
}

body {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
}

.main_page {
	width: 100%;
	height: 100%;
}

.main {
	width: 100%;
	height: calc(100% -60px);
	display: flex;
	flex-direction: column;
	text-align: center;
}

div#frame {
	border: 3px solid #ff6e00;
	background-color: #FFFFFF;
	width: 70%;
    height: 500px;
    border-radius: 25px;
}

input {
	background-color: #ff6e00;
	color: #FFFFFF;
	width: 130px; 
	height: 55px;
	border-radius: 20px;
	border: 0;
	margin: 10px;
	font-size: 17px;
	cursor: pointer;
}

.header {
	/* 	top: 0rem;
	left: 0rem; */
	background-color: #fff;
	/* border-bottom: 1px solid #d9d9d9; */
	box-sizing: border-box;
	width: 30.375rem;
	height: 7.5rem;
	overflow: hidden;
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: flex-start;
	color: #474747;
	margin-left: 26px;
}

.logo_sunstory {
	display: flex;
	top: 2.375rem;
	left: 1.313rem;
	width: 90px;
	height: 90px;
	object-fit: cover;
	margin-right: 45px;
}

div#outputLayer {
	text-align: left;
}

canvas {
	width: 100%;
    height: 100%;
    border-radius: 25px;
}

#loadingMessage{
	margin : 10px;
}

</style>
</head>
<body>
	<div class="header">
			<a href="main"> <img class="logo_sunstory" alt="순토리"
				src="assets/images/순토리1.png">
			</a>
		</div>
	<div class="main_page">
			<div class="main" align="center">
				<div align="center">
					<div id="frame">
						<div id="loadingMessage">
							🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
						</div>
						<canvas id="canvas"></canvas>
					</div>
				</div>
				<div style="width: 100%; height: 60px; padding-top: 20px;">
					<input type="button" id="open" value="카메라 열기" /> 
					<input type="button" id="close" value="카메라 닫기" />
				</div>
			</div>
		</div>

		<script type="text/javascript">
			var frame = document.getElementById("frame");
			var loadingMessage = document.getElementById("loadingMessage");
			var canvasElement = document.getElementById("canvas");
			var canvas = canvasElement.getContext("2d");
			var video;
			var clickEvent = (function() {
				if ('ontouchstart' in document.documentElement === true) {
					return 'touchend';
				} else {
					return 'click';
				}
			})();
			var open = document.getElementById("open");
			var close = document.getElementById("close");
			console.log(open);
			console.log(close);
			open.addEventListener(clickEvent, openCamera);
			close.addEventListener(clickEvent, closeCamera);

			// 스캔
			function startScan() {
				video = document.createElement("video");

				function drawLine(begin, end, color) {
					canvas.beginPath();
					canvas.moveTo(begin.x, begin.y);
					canvas.lineTo(end.x, end.y);
					canvas.lineWidth = 4;
					canvas.strokeStyle = color;
					canvas.stroke();
				}

				// 카메라 사용시
				navigator.mediaDevices.getUserMedia({
					video : {
						facingMode : "environment"
					}
				}).then(function(stream) {
					video.srcObject = stream;
					video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달
					video.play();
					requestAnimationFrame(tick);

				});

				function tick() {
					if (video != null) {
						if (video.readyState === video.HAVE_ENOUGH_DATA) {
							loadingMessage.hidden = true;
							canvasElement.hidden = false;

							// 읽어들이는 비디오 화면의 크기
							console.log(video.videoHeight, video.videoWidth)

							canvas.drawImage(video, 0, 0, canvasElement.width,
									canvasElement.height);

							var imageData = canvas.getImageData(0, 0,
									canvasElement.width, canvasElement.height);
							var code = jsQR(imageData.data, imageData.width,
									imageData.height, {
										inversionAttempts : "dontInvert",
									});

							// QR코드 인식에 성공한 경우
							if (code) {
								// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성
								drawLine(code.location.topLeftCorner,
										code.location.topRightCorner, "#FF0000");
								drawLine(code.location.topRightCorner,
										code.location.bottomRightCorner,
										"#FF0000");
								drawLine(code.location.bottomRightCorner,
										code.location.bottomLeftCorner,
										"#FF0000");
								drawLine(code.location.bottomLeftCorner,
										code.location.topLeftCorner, "#FF0000");

								console.log(code.data)

								// QR코드 주소로 이동
								location.href = code.data;

								// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
								return;
							}
							// QR코드 인식에 실패한 경우
							else {
							}
						}
					}
					requestAnimationFrame(tick);
				}
			}

			// 카메라 열기
			function openCamera() {
				startScan();
			}

			function closeCamera() {

				if (video != null) {
					var track = video.srcObject.getTracks();
					console.log(track[0])
					track[0].stop()
					video = null;
					loadingMessage.hidden = false;
					canvas.clearRect(0, 0, canvasElement.width,
							canvasElement.height);

				}
			}
		</script>
</body>
</html>