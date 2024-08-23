document.write('<script src="assets/js/TTS.js"></script>');

let map = new naver.maps.Map("map", {
	zoom: 10,
	minZoom: 10,
	maxZoom: 15,
	center: new naver.maps.LatLng(34.95057, 127.4874),
	zoomControl: true,
	zoomControlOptions: {
		position: naver.maps.Position.TOP_LEFT,
		style: naver.maps.ZoomControlStyle.SMALL
	}
});

$(".supporting-text").keypress(function(e){
	if(e.keyCode == 13){
		console.log($(".supporting-text").val());
		$(".supporting-text").val("");
	}
});


let submap = new naver.maps.Map("submap", {
	zoom: 15,
	minZoom: 15,
	maxZoom: 15,
	draggable: false,
	keyboardShortcuts : false,
	center: new naver.maps.LatLng(34.95057, 127.4874)
});

let submarker = new naver.maps.Marker({
					title: null,
					position: new naver.maps.LatLng(34.95057, 127.4874),
					draggable: false,
					icon: null,
					map: null
				});
				
let markers = [];
let htmlMarker1 = {
	content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(assets/images/cluster-marker-1.png);background-size:contain;"></div>',
	size: N.Size(40, 40),
	anchor: N.Point(20, 20)
},
	htmlMarker2 = {
		content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(assets/images/cluster-marker-2.png);background-size:contain;"></div>',
		size: N.Size(40, 40),
		anchor: N.Point(20, 20)
	},
	htmlMarker3 = {
		content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(assets/images/cluster-marker-3.png);background-size:contain;"></div>',
		size: N.Size(40, 40),
		anchor: N.Point(20, 20)
	},
	htmlMarker4 = {
		content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(assets/images/cluster-marker-4.png);background-size:contain;"></div>',
		size: N.Size(40, 40),
		anchor: N.Point(20, 20)
	},
	htmlMarker5 = {
		content: '<div style="cursor:pointer;width:40px;height:40px;line-height:42px;font-size:10px;color:white;text-align:center;font-weight:bold;background:url(assets/images/cluster-marker-5.png);background-size:contain;"></div>',
		size: N.Size(40, 40),
		anchor: N.Point(20, 20)
	};

let markerClustering = new MarkerClustering({
	minClusterSize: 2,
	maxZoom: 13,
	map: null,
	markers: [],
	disableClickZoom: false,
	gridSize: 120,
	icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
	indexGenerator: [10, 100, 200, 500, 1000],
	stylingFunction: function(clusterMarker, count) {
		$(clusterMarker.getElement()).find('div:first-child').text(count);
	}
});

var audio;
var AudioContext;
var audioContext;

getData(1);

$(".lookall").on("click", function() {
	remove();
	getData(1);
})


$(".repre").on("click", function() {
	remove();
	getData(2);
})

$(".tag").on("click", function() {
	remove();
	getData(3);
});

function remove() {
	markerClustering.onRemove();
	for (let i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
		markers[i].setIcon(null);
	}
	markers = [];
	markerClustering.setMarkers([]);
}


function getData(type) {
	$.ajax({
		type: "get",
		url: "data",
		data: { type },
		success: function(res) {
			map.setOptions('zoom', 11);
			map.setOptions('center', new naver.maps.LatLng(34.95057, 127.4874))
			$(".list").html("");
			for (let i = 0, ii = res.length; i < ii; i++) {

				let spot = res[i],
					latlng = new naver.maps.LatLng(spot.lat, spot.lon),
					marker = new naver.maps.Marker({
						title: spot.toursite,
						position: latlng,
						draggable: false
					});
				markers.push(marker);
				let list = `<li
						style="width: 100%; height: 100px; display: flex; flex-direction: row; align-items: center;">
						<div>
							<img style="width: 100px; height: 100px; border-radius: 5px;"
								src="assets/images/관광지/${spot.tourphoto}.jpg">
						</div>
						<div style="width: 100%; text-align: left; padding: 10px;">
								<h3 style="margin-bottom: 5px; margin-top: 0;">${spot.toursite}</h3>
								<span style="display:none">${spot.touridx}</span>
						</div>
					</li>`
				$(".list").append(list);
			}

			let clickedmarker = null;
			let selectedmarker = null;

			let infowindows = []
			for (let i = 0; i < markers.length; i++) {
				let infowindow = new naver.maps.InfoWindow({
					content: `<div class="info-box"><span class="info">${markers[i].title}</span></div>`
				});
				infowindows.push(infowindow)
			}



			for (let i = 0; i < markers.length; i++) {
				naver.maps.Event.addListener(markers[i], "click", function() {
					clickedmarker = markers[i]
					if (selectedmarker != clickedmarker) {
						if (selectedmarker == null) {
							selectedmarker = clickedmarker
						}
						selectedmarker.setIcon(null)
						infowindows[i].close();
						selectedmarker = clickedmarker
						infowindows[i].open(map, clickedmarker);
						selectedmarker.setIcon({

							content: [
								`<div style="display: flex; flex-direction: column; align-items: center; width: 50px; height: 50px;">`,
								` <div style="display: flex; justify-content: center; align-items: center; width: 50px; height: 50px;">`,
								` <img src="assets/images/관광지/${clickedmarker.title}.jpg" style="width: 50px; background-color: white; height: 50px; border-radius: 50%;"/>`,
								` </div>`,
								`</div>`
							].join(''),
							// url: 'resources/img/marker.png', //아이콘 경로 
							size: new naver.maps.Size(50, 50),
							scaledSize: new naver.maps.Size(50, 50),
							origin: new naver.maps.Point(0, 0),
						})
						map.setOptions('zoom', 15)
						map.panTo(markers[i].position);
					}
				});
			}
			markerClustering = new MarkerClustering({
				minClusterSize: 2,
				maxZoom: 13,
				map: map,
				markers: markers,
				disableClickZoom: false,
				gridSize: 120,
				icons: [htmlMarker1, htmlMarker2, htmlMarker3, htmlMarker4, htmlMarker5],
				indexGenerator: [10, 100, 200, 500, 1000],
				stylingFunction: function(clusterMarker, count) {
					$(clusterMarker.getElement()).find('div:first-child').text(count);
				}
			});
			$('ul.list li').click(function() {
				let box = $(this).children("div")[1];
				let title = $(box).children("h3")[0];
				let text = $(title).text();
				let idx_box = $(box).children("span")[0];
				let idx = $(idx_box).text();

				let data;
				for (let i = 0; i < res.length; i++) {
					if (idx == res[i].touridx) {
						data = res[i];
						$(".image-icon1").attr("src", `assets/images/관광지/${res[i].tourphoto}.jpg`);
						$(".content-title").text(`${res[i].toursite}`);
						console.log(res[i]);
						$(".subtitle .p:nth-child(1)").text(`${res[i].tourtitle}`);
						$(".subtitle .p:nth-child(2)").text(`${res[i].touraddr}`);
						$(".content-text .p").text(`${res[i].tourdesc}`);
						$(".use-time").text(`${res[i].tourtime}`);
						$(".pay-text").text(`${res[i].fare}`);
						if (!audio.paused) {
							audio.pause();
						}
						TTS(res[i].touridx);
					}
				}
				submarker.setMap(null);
				submarker.setIcon({
							content: [
								`<div style="display: flex; flex-direction: column; align-items: center; width: 50px; height: 50px;">`,
								` <div style="display: flex; justify-content: center; align-items: center; width: 50px; height: 50px;">`,
								` <img src="assets/images/관광지/${data.tourphoto}.jpg" style="width: 50px; background-color: white; height: 50px; border-radius: 50%;"/>`,
								` </div>`,
								`</div>`
							].join(''),
							// url: 'resources/img/marker.png', //아이콘 경로 
							size: new naver.maps.Size(50, 50),
							scaledSize: new naver.maps.Size(50, 50),
							origin: new naver.maps.Point(0, 0),
						})
				submarker.setPosition(new naver.maps.LatLng(data.lat, data.lon));
				submarker.setTitle(data.name);
				submarker.setMap(submap);
				
				console.log(submarker)
				submap.setCenter(submarker.position);
			});


			naver.maps.Event.addListener(map, 'zoom_changed', function(zoom) {
				for (let i = 0; i < infowindows.length; i++) {
					if (zoom < 13) {
						if (infowindows[i].getMap()) {
							selectedmarker.setIcon(null)
							infowindows[i].close();
							selectedmarker = null
							clickedmarker = null
						}
					}
				}
			});

		},
		error: function() {
			console.log("통신에러");
		}
	})
}