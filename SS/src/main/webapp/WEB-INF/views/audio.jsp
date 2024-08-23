<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오디오 플레이어</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #282c34;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .audio-player {
            text-align: center;
            background-color: #3a3f47;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
        }

        .track-info {
            margin-bottom: 20px;
        }

        .controls {
            margin: 20px 0;
        }

        button {
            background-color: #61dafb;
            border: none;
            border-radius: 5px;
            padding: 10px 15px;
            margin: 0 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #21a1f1;
        }

        input[type="range"] {
            width: 100%;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="audio-player">
        <h1>오디오 플레이어</h1>
        <div class="track-info">
            <span class="track-title">트랙 제목</span>
            <span class="track-artist">아티스트 이름</span>
        </div>
        <audio id="audio" src="your-audio-file.mp3"></audio>
        <div class="controls">
            <button id="prev">◀</button>
            <button id="play">▶</button>
            <button id="next">▶▶</button>
        </div>
        <input type="range" id="volume" min="0" max="1" step="0.01" value="0.5">
    </div>
    <script>
        const audio = document.getElementById('audio');
        const playButton = document.getElementById('play');
        const prevButton = document.getElementById('prev');
        const nextButton = document.getElementById('next');
        const volumeControl = document.getElementById('volume');

        let isPlaying = false;

        // 재생/일시 정지 기능
        playButton.addEventListener('click', () => {
            if (isPlaying) {
                audio.pause();
                playButton.textContent = '▶';
            } else {
                audio.play();
                playButton.textContent = '❚❚';
            }
            isPlaying = !isPlaying;
        });

        // 볼륨 조절 기능
        volumeControl.addEventListener('input', (event) => {
            audio.volume = event.target.value;
        });

        // 이전 및 다음 트랙 기능 (예시로 트랙 배열을 사용)
        const tracks = [
            { title: "트랙 1", artist: "아티스트 1", src: "track1.mp3" },
            { title: "트랙 2", artist: "아티스트 2", src: "track2.mp3" },
            { title: "트랙 3", artist: "아티스트 3", src: "track3.mp3" }
        ];

        let currentTrackIndex = 0;

        function loadTrack(index) {
            const track = tracks[index];
            audio.src = track.src;
            document.querySelector('.track-title').textContent = track.title;
            document.querySelector('.track-artist').textContent = track.artist;
        }

        prevButton.addEventListener('click', () => {
            currentTrackIndex = (currentTrackIndex - 1 + tracks.length) % tracks.length;
            loadTrack(currentTrackIndex);
            if (isPlaying) audio.play();
        });

        nextButton.addEventListener('click', () => {
            currentTrackIndex = (currentTrackIndex + 1) % tracks.length;
            loadTrack(currentTrackIndex);
            if (isPlaying) audio.play();
        });

        // 초기 트랙 로드
        loadTrack(currentTrackIndex);
    </script>
</body>
</html>
