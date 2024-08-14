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

$("#all").on("click", function() {
	remove();
	getData(1);
	console.log(markerClustering)
})

$("#major").on("click", function() {
	remove();
	getData(2);
	console.log(markerClustering)
})

$("#tag").on("click", function() {
	remove();
	getData(3);
	console.log(markerClustering)
});

function remove() {
	markerClustering.onRemove();
		for (let i = 0; i < markers.length; i++) {
		markers[i].setMap(null);
		markers[i].setIcon(null);
	}
	markers = [];
	markerClustering.setMarkers([]);
	console.log(markers)
}

function getData(type) {
	$.ajax({
		type: "get",
		url: "data",
		data: { type },
		success: function(res) {
			for (let i = 0, ii = res.length; i < ii; i++) {
				let spot = res[i],
					latlng = new naver.maps.LatLng(spot.lat, spot.lon),
					marker = new naver.maps.Marker({
						title: spot.name,
						position: latlng,
						draggable: false
					});
				markers.push(marker);
			}

			let clickedmarker = null;
			let selectedmarker = null;

			let infowindows = []
			for (let i = 0; i < markers.length; i++) {
				let infowindow = new naver.maps.InfoWindow({
					content: `<div width : 20px; heigth:20px;><span font-size: 30px; font-weight : bold;>${markers[i].title}</span></div>`
				});
				infowindows.push(infowindow)
			}


			for (let i = 0; i < markers.length; i++) {
				naver.maps.Event.addListener(markers[i], "click", function() {
					clickedmarker = markers[i]
					if (selectedmarker == clickedmarker) {
						infowindows[i].close();
						selectedmarker.setIcon(null)
						map.setOptions('zoom', 11)
						selectedmarker = null
						clickedmarker = null
					} else if (selectedmarker != clickedmarker) {
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
			console.log(markerClustering)
			
		},
		error: function() {
			console.log("통신에러");
		}
	})
}