function TTS(idx) {
	navigator.mediaDevices.getUserMedia({ audio: true })
		.then(() => {
			audioPlay(idx);
		})
		.catch(e => {
			console.error(`Audio permissions denied: ${e}`);
			alert("Audio permissions were denied. Please allow microphone access and try again.");
		});
};

function audioPlay(idx) {
	$.ajax({
		url: "audio",
		data: { idx: idx },
		type: "post",
		success:function(res){
			console.log("통신성공")
			console.log(res[0].scenariovoice);
			$("#audio").attr("src",res[0].scenariovoice);
		},
		error: function() {
			console.log("통신에러");
		}
	});
}
