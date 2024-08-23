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
}

#coverImage {
    width: 200px; /* 커버 이미지 너비 */
    height: auto; /* 자동 높이 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */
    margin-bottom: 15px; /* 아래 여백 */
}

button {
    background-color: #ff7f50; /* 주황색 배경 */
    color: white; /* 텍스트 색상 */
    border: none; /* 테두리 없음 */
    border-radius: 5px; /* 모서리 둥글게 */
    padding: 10px 15px; /* 패딩 */
    margin: 5px; /* 버튼 간격 */
    cursor: pointer; /* 커서 포인터 */
    transition: background-color 0.3s; /* 배경색 전환 효과 */
}

button:hover {
    background-color: #ff6347; /* 호버 시 색상 변화 */
}

input[type="range"] {
    -webkit-appearance: none; /* 기본 스타일 제거 */
    width: 100%; /* 슬라이더 너비 */
    height: 8px; /* 슬라이더 높이 */
    background: #ddd; /* 슬라이더 배경색 */
    border-radius: 5px; /* 모서리 둥글게 */
    margin: 10px 0; /* 위아래 여백 */
}

input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none; /* 기본 스타일 제거 */
    appearance: none; /* 기본 스타일 제거 */
    width: 20px; /* 썸너 높이 */
    height: 20px; /* 썸너 너비 */
    background: #ff7f50; /* 썸너 배경색 */
    border-radius: 50%; /* 썸너 둥글게 */
    cursor: pointer; /* 커서 포인터 */
}

input[type="range"]::-moz-range-thumb {
    width: 20px; /* 썸너 높이 */
    height: 20px; /* 썸너 너비 */
    background: #ff7f50; /* 썸너 배경색 */
    border-radius: 50%; /* 썸너 둥글게 */
    cursor: pointer; /* 커서 포인터 */
}

#currentTime {
    font-size: 14px; /* 현재 시간 텍스트 크기 */
    margin: 10px 0; /* 위아래 여백 */
}

#volumeControl {
    margin-top: 10px; /* 위 여백 */
}

    </style>
</head>
<body>
   
    <div id="audioPlayer">
        <img id="coverImage" src="assets/images/순토리1.png" alt="Cover Image">
        <audio id="audio" src="assets/images/징소리.mp3" preload="metadata"></audio>
        <input type="range" id="progressBar" value="0" step="1" min="0">
        <span id="currentTime">0:00</span>
        <input type="range" id="volumeControl" value="100" step="1" min="0" max="100">
        <button id="playButton">▶️</button>
        <button id="pauseButton">⏸️</button>
        <button id="stopButton">⏹️</button>
    </div>

    <script>
        const audio = document.getElementById('audio');
        const playButton = document.getElementById('playButton');
        const pauseButton = document.getElementById('pauseButton');
        const stopButton = document.getElementById('stopButton');
        const progressBar = document.getElementById('progressBar');
        const currentTimeDisplay = document.getElementById('currentTime');
        const volumeControl = document.getElementById('volumeControl');

        playButton.addEventListener('click', () => {
            audio.play();
        });

        pauseButton.addEventListener('click', () => {
            audio.pause();
        });

        stopButton.addEventListener('click', () => {
            audio.pause();
            audio.currentTime = 0;
            progressBar.value = 0;
            currentTimeDisplay.textContent = '0:00';
        });

        audio.addEventListener('timeupdate', () => {
            const currentTime = audio.currentTime;
            const duration = audio.duration;
            progressBar.value = (currentTime / duration) * 100 || 0;
            currentTimeDisplay.textContent = formatTime(currentTime);
        });

        progressBar.addEventListener('input', () => {
            const duration = audio.duration;
            audio.currentTime = (progressBar.value / 100) * duration;
        });

        volumeControl.addEventListener('input', () => {
            audio.volume = volumeControl.value / 100;
        });

        function formatTime(seconds) {
            const minutes = Math.floor(seconds / 60);
            const secs = Math.floor(seconds % 60);
            return `${minutes}:${secs < 10 ? '0' : ''}${secs}`;
        }
    </script>
</body>
</html>
