function TTS(idx) {
	navigator.mediaDevices.getUserMedia({ audio: true })
		.then(() => {
			AudioContext = window.AudioContext || window.webkitAudioContext;
			audioContext = new AudioContext();
			audioPlay(idx);
		})
		.catch(e => {
			console.error(`Audio permissions denied: ${e}`);
			alert("Audio permissions were denied. Please allow microphone access and try again.");
		});
};

async function audioPlay(idx) {
	$.ajax({
		url: "audio",
		data: { idx: idx },
		type: "post"
	}).done(function(response) {

		if (response.resultCode == 200) {
			audio = new Audio(response.result);
			audio.play();
			console.log(audio);
		} else {
			// Error handling
		}
	});
}

async function audioStop() {
	audio.stop();
}
