-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
 local composer = require("composer")

-- math.randomseed(os.time())

-- local welcome = display.newImage("welcome.png", display.contentCenterX, display.contentCenterY)
-- local function closeSplash()
-- 	print("welcome")
--     display.remove(welcome)
--    welcome = nil
--     composer.gotoScene("googlemaps")
-- end

-- timer.performWithDelay(1500, closeSplash)





--google maps api js


--MAIN.LUA (Android MapView workaround for Corona SDK by Jason Schroeder)
 
------------------------
--REQUIRED VARIABLES
------------------------
 
local APIkey = "AIzaSyCbh82IXgdq1GB5-vDBCBKQOX2XTHzll8A"
 --This variable is your Google Maps API key (copy and paste it from the web). You can obtain a Google Maps API Key for free at http://code.google.com/apis/console
 
--local lat, lon = 37.450876, -122.156689 --These are the latitude and longitude values where our map will center when it first loads.
 local lat, lon  = 10.3223812, 123.898717
local path = system.pathForFile( "gmap.html", system.DocumentsDirectory ) --This is the path for the HTML document that we'll create to load our custom Google Map.
 
------------------------
--OPTIONAL MARKER DATA
------------------------
 
local markerTable = {}
--This table will contain all of the data for our map markers.
 
-- markerTable[1]={
-- 	name = "Ansca HQ",
-- 	lat = 37.450876,
-- 	lon = -122.156689,
-- 	notes = "Play more. Code less."
-- }


-- markerTable[1]={
-- 	name = "Alpha HQ",
-- 	lat = 10.3225138,
-- 	lon = 123.89912545681,

-- 	notes = "Play more. Code less."
-- }
 
-- markerTable[2]={
-- 	name = "Lisa's Bay House",
-- 	lat = 10.32313131208345,
-- 	lon = 123.89895915985107,
-- 	notes = "Lisa kimochiiiii."
-- }


-- The above variables contain data for 2 markers. You can place additional markers, or attach other pieces of data to each marker (address, phone #, etc.)
 
 
local markerCode = {}
--This table will contain the compiled Javascript to place the markers we specified in the markerList table.


-- var infowindow]]..i..[[ = new google.maps.InfoWindow({
-- 	content: "&lt;strong&gt;]]..markerTable[i].name..[[&lt;/strong&gt;&lt;br&gt;]]..markerTable[i].notes..[["
-- 	});

-- for i=1, #markerTable do
-- 	markerCode[i] = [[
-- 	var infowindow]]..i..[[ = new google.maps.InfoWindow({
--  	content: "&lt;strong&gt;]]..markerTable[i].title..[[&lt;/strong&gt;&lt;br&gt;]]..markerTable[i].description..[["
-- 	});
-- 	var marker]]..i..[[ = new google.maps.Marker({
-- 	position: new google.maps.LatLng(]]..markerTable[i].lat..', '..markerTable[i].lng..[[),
-- 	map: map,
-- 	animation: google.maps.Animation.DROP,
-- 	});
 
-- 	google.maps.event.addListener(marker]]..i..[[, 'click', function() {
-- 	infowindow]]..i..[[.open(map,marker]]..i..[[);
-- 	});
 
-- 	]]
-- end
 
--local markerString = table.concat(markerCode)
--The above code compiles a string that contains all of our marker data, to be inserted (optionally) into the HTML file we're creating.
 
 
------------------------
--HTML & JAVASCRIPT CODE
------------------------
 
local mapString = [[
<!DOCTYPE html>
	<html>
	<head>
	<meta name="viewport" content="initial-scale=0.01, user-scalable=no" />
	<style type="text/css">
	html { height: 100% }
	body { height: 100%; margin: 0; padding: 0 }
	#map_canvas { height: 80% }
	</style>
	<script type="text/javascript"
	src="http://maps.googleapis.com/maps/api/js?key=]]..APIkey..[[">
	</script>
	<script type="text/javascript">
	var overlay;
	xy= new google.maps.LatLng(lat, lon);
	function initialize() {
	var myOptions = {
		center: xy,
		zoom: 18, 
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	var map = new google.maps.Map(document.getElementById("map_canvas"),
	myOptions);
	overlay = new google.maps.OverlayView();
	overlay.draw = function(){};
 	function getIcon(type){
      var icon;
      if(type == 'marker'){
        icon = 'images/marker1.png';
      } else if(type == 'restrict'){
        icon = 'images/restrict1.png'
      } else if(type == 'parking'){
        icon = 'images/parking1.png';
      } else if(type == 'markedArea'){
        icon = 'images/marker2.png';
      } else if(type == 'restrictedArea'){
        icon = 'images/restrict2.png'
      } else if(type == 'parkingArea'){
        icon = 'images/parking2.png';
      }

      return icon;
    }


var pins = [];
pins[1]={
	id:"pin1",
	title:"CCC",
	description:"this is a CCC description",
	video: "",
	type:"marker",
	lat:10.3225138,
	lng:123.89912545681,
}
 
pins[2]={
	id:"pin2",
	title:"AS Parking Lot",
	description:"this is ASParkngLot Description",
	video: "",
	type:"marker",
	lat:10.32313131208345,
	lng:123.89895915985107,
}
pins[3]={
	id:"pin3",
	title:"Admin Building",
	description:"AS BUILding desc",
	video:"",
	type:"marker",
	lat:10.322254, 
	lng:123.898197
}
	for(i=1, pins.length; i++) {
	var infowindow = new google.maps.InfoWindow({
		content: "" + pins[i].title + "\n" + pins[i].description
	});
	var marker = new google.maps.Marker({
	position: new google.maps.LatLng(pins[i].lat, pins[i].lng),
	map: map,
	animation: google.maps.Animation.DROP,
	});
 
	marker.addListener('click', function() {
	infowindow.open(map, marker);
	});
 
	}
 
	
	</script>

	</head>
	<body onload="initialize();">
	<div id="map_canvas" style="width:100%; height:100%; background-color: 'green'"></div>
	<div id="drop-container"><div id="drop-silhouette"></div></div>
	</body>
	</html>
]]
--This string is the text that will be written to our HTML file.
 
 local function openNew()
 	composer.gotoScene("googlemaps")
 end
 
------------------------
--HTML FILE CREATION
------------------------
 
local htmlFile = io.open( path, "w" )
htmlFile:write( mapString )
io.close( htmlFile )
--The above code writes our "mapString" variable to an HTML file and saves it in the Documents directory.
 
 
 
------------------------
--LOAD YOUR MAP!
------------------------
 
native.showWebPopup (0, 0, display.contentWidth, display.contentHeight, "gmap.html",{baseUrl=system.DocumentsDirectory})
--This loads up our custom-made HTML document in a WebPopup. Enjoy!