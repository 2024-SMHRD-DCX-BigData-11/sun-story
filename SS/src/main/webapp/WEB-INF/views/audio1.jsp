<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오디오 플레이어</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9; /* 배경색 */
            color: #333; /* 기본 텍스트 색상 */
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #audioPlayer {
            background-color: #fff; /* 플레이어 배경색 */
            border: 2px solid #ff7f50; /* 주황색 테두리 */
            border-radius: 10px; /* 모서리 둥글게 */
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
            text-align: center;
            width: 400px;
        }

        #coverImage {
            width: 200px; /* 커버 이미지 너비 */
            height: auto; /* 자동 높이 */
            border-radius: 10px; /* 이미지 모서리 둥글게 */
            margin-bottom: 15px; /* 아래 여백 */
        }
	/* 오디오 요소 스타일 */
		#audio {
    		width: 100%; /* 오디오 플레이어의 너비를 100%로 설정 */
    		background-color: #FFA500; /* 주황색 배경 */
   		 	border: 2px solid #FF8C00; /* 어두운 주황색 테두리 */
    		border-radius: 5px; /* 모서리 둥글게 */
    		outline: none; /* 기본 아웃라인 제거 */
		}

		/* 오디오 컨트롤의 스타일을 변경하기 위한 추가 CSS */
		#audio::-webkit-media-controls-panel {
   			 background-color: #FFA500; /* 주황색 배경 */
		}

		#audio::-webkit-media-controls-play-button,
		#audio::-webkit-media-controls-volume-slider {
    		
   	 		border-radius: 5px; /* 모서리 둥글게 */
		}

		#audio::-webkit-media-controls-current-time-display,
		#audio::-webkit-media-controls-time-remaining-display {
    		color: white; /* 시간 표시를 흰색으로 */
			}

    </style>
</head>
<body>
    <div id="audioPlayer">
        <img id="coverImage" src="assets/images/순토리1.png" alt="Cover Image">
        <audio id="audio" src="assets/mp3/긴배경음.mp3" preload="metadata" controls></audio>  
    </div>

    <script>
       
    </script>
</body>
</html>

