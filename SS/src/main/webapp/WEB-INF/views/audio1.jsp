<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>오디오 플레이어</title>
    <style>
        #audioPlayer {
            display: flex;
            align-items: center;
            margin: 20px;
        }
        #progressBar {
            width: 300px;
            margin: 0 10px;
        }
        #volumeControl {
            width: 100px;
            margin-left: 10px;
        }
        #coverImage {
            width: 100px;
            height: 100px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <h1>오디오 플레이어</h1>
    <div id="audioPlayer">
        <img id="coverImage" src="assets/images/순토리1.png" alt="Cover Image">
        <audio id="audio" src="your-audio-file.mp3" preload="metadata"></audio>
        <button id="playButton">▶️</button>
        <button id="pauseButton">⏸️</button>
        <button id="stopButton">⏹️</button>
        <input type="range" id="progressBar" value="0" step="1" min="0">
        <span id="currentTime">0:00</span>
        <input type="range" id="volumeControl" value="100" step="1" min="0" max="100">
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
