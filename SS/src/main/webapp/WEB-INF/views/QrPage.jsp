<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QR scan test</title>
<script src="assets/js/jsQR.js"></script>
<style type="text/css">
main {
	width: 100%;
	height: 100%;
	text-align: center;
}

div#frame {
	border: 2px solid #005666;
	background-color: #FFFFFF;
	margin-left: 10px;
	margin-right: 10px;
	padding-left: 8px;
	padding-right: 8px;
	padding-top: 8px;
	padding-bottom: 8px;
}

div#outputLayer {
	text-align: left;
}

canvas {
	width: 100%;
}
</style>
</head>
<body>
	<div class="main_page">
		<main align="center">
			<div align="center">
				<div></div>
				<div id="frame">
					<div id="loadingMessage">
						🎥 비디오 스트림에 액세스 할 수 없습니다<br />웹캠이 활성화되어 있는지 확인하십시오
					</div>
					<canvas id="canvas"></canvas>
				</div>
			</div>

			<br /> <input type="button" id="button1" onclick="openCamera();"
				value="카메라 열기" style="width: 97%; height: 30px" /> <br /> <br />
			<input type="button" id="close" value="카메라 닫기"
				onclick="closeCamera();" style="width: 97%; height: 30px" /> <br />
			<div></div>
			<div id="test" width="100%">
				<h1>QR 코드 스캔 결과</h1>
				<div id="output">
					<div id="outputMessage"></div>
					<div id="outputLayer" hidden>
						<span id="outputData"></span>
					</div>
				</div>
			</div>
		</main>
	</div>

	<script type="text/javascript">
		var video;
		var frame = document.getElementById("frame");
		var loadingMessage = document.getElementById("loadingMessage");
		var canvasElement = document.getElementById("canvas");
		var canvas = canvasElement.getContext("2d");
		var ani = null
		
		// 스캔
		function startScan() {
			video = document.createElement("video");
			var outputContainer = document.getElementById("output");
			var outputMessage = document.getElementById("outputMessage");
			var outputData = document.getElementById("outputData");
			var close = document.getElementById("close");
			var con = document.getElementById("con");
			var ani = null;
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
				

				if (video.readyState === video.HAVE_ENOUGH_DATA) {
					loadingMessage.hidden = true;
					canvasElement.hidden = false;
					outputContainer.hidden = false;

					// 읽어들이는 비디오 화면의 크기
					canvasElement.height = video.videoHeight;
					canvasElement.width = video.videoWidth;
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
								code.location.bottomRightCorner, "#FF0000");
						drawLine(code.location.bottomRightCorner,
								code.location.bottomLeftCorner, "#FF0000");
						drawLine(code.location.bottomLeftCorner,
								code.location.topLeftCorner, "#FF0000");

						outputMessage.hidden = true;
						outputData.parentElement.hidden = false;
						console.log(code.data)

						// QR코드 메시지 출력
						outputData.innerHTML = code.data;
						location.href = code.data;

						// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.
						return;
					}
					// QR코드 인식에 실패한 경우
					else {
						outputMessage.hidden = false;
						outputData.parentElement.hidden = true;
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
			video.pause();
			var track = video.srcObject.getTracks();
			console.log(track)
			track[0].stop()
			video.srcObject = null;
			loadingMessage.hidden = false;
			canvas.clearRect(0, 0, canvasElement.width, canvasElement.height);
		}
	</script>
</body>
</html>