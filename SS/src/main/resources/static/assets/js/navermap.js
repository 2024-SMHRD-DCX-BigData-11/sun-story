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
			$("#list").html("");
			for (let i = 0, ii = res.length; i < ii; i++) {

				let spot = res[i],
					latlng = new naver.maps.LatLng(spot.lat, spot.lon),
					marker = new naver.maps.Marker({
						title: spot.name,
						position: latlng,
						draggable: false
					});
				markers.push(marker);
				let list = `<li
						style="width: 100%; height: 100px; display: flex; flex-direction: row; align-items: center;">
						<div>
							<img style="width: 100px; height: 100px; border-radius: 5px;"
								src="assets/images/관광지/${spot.name}.jpg">
						</div>
						<div style="width: 100%; text-align: left; padding: 10px;">
								<h3 style="margin-bottom: 5px; margin-top: 0;">${spot.name }</h3>
								<p style="margin: 0;">${spot.simple_name}</p>
								<p style="margin: 0;">${spot.address }</p>
								<p style="margin: 0; color:gray;">${spot.tag }</p>
						</div>
					</li>`
				$("#list").append(list);
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
			$('ul#list li').click(function() {
				let box = $(this).children("div")[1];
				let title = $(box).children("h3")[0];
				let text = $(title).text()
				for (let i = 0; i < markers.length; i++) {
					if (text == markers[i].title) {
						if (audio != null) {
							audio.pause();
						}
						TTS(res[i].trip_id);
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
					}
				}

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