var clickEvent = (function() {
	if ('ontouchstart' in document.documentElement === true) {
		return 'touchend';
	} else {
		return 'click';
	}
})();

$(".show-storytelling").off().on(clickEvent, function(e) {
	console.log("클릭");
	var audio = $('#audio').get(0);
	console.log($("#audioPlayer").css("display"));
	if ($("#audioPlayer").css("display") == "none") {
		$("#audioPlayer").css("display", "block");
	} else if ($("#audioPlayer").css("display") == "block") {
		if (audio.paused == false) {
			audio.pause();
		}
		$("#audioPlayer").css("display", "none");
	}
});

let submap = new naver.maps.Map("submap", {
	zoom: 15,
	minZoom: 15,
	maxZoom: 15,
	draggable: false,
	keyboardShortcuts: false,
	center: new naver.maps.LatLng($("#lat").val(), $("#lon").val())
});

let photo = $(".image-icon1").attr("src");
let submarker = new naver.maps.Marker({
	title: null,
	position: new naver.maps.LatLng($("#lat").val(), $("#lon").val()),
	draggable: false,
	icon: {
		content: [
			`<div style="display: flex; flex-direction: column; align-items: center; width: 50px; height: 50px;">`,
			` <div style="display: flex; justify-content: center; align-items: center; width: 50px; height: 50px;">`,
			` <img src="${photo}" style="width: 50px; background-color: white; height: 50px; border-radius: 50%;"/>`,
			` </div>`,
			`</div>`
		].join(''),
		// url: 'resources/img/marker.png', //아이콘 경로 
		size: new naver.maps.Size(50, 50),
		scaledSize: new naver.maps.Size(50, 50),
		origin: new naver.maps.Point(0, 0),
	},
	map: submap
});


