local myApp = require("mymap")
local composer = require("composer")
local default = "floorplans/NA.png"

local photoFiles = {}
	photoFiles[1] = {
	"gallery/Undergrad Building/NsmdCatwalkResized.jpg",
	"gallery/Undergrad Building/NsmdEntrance.jpg",
	"gallery/Undergrad Building/NsmdGallery.jpg",
	"gallery/Undergrad Building/NsmdGawas.jpg",
	"gallery/Undergrad Building/NsmdSecondFloor.jpg",
	"gallery/Undergrad Building/NsmdSulod.jpg"
	}
	photoFiles[2] = {
	default,
	}

	photoFiles[3] = {
	"gallery/Basketball Court/BasketballCourtResized.jpg"
	}
	photoFiles[4] = {
	"gallery/Management Building/ManagementResized.jpg"
	}
	photoFiles[5] = {
	default,
	}
	photoFiles[6] = {
	default,
	}
	photoFiles[7] = {
	"gallery/Canteen/Canteen.jpg",
	"gallery/Canteen/Canteen2.jpg"
	}
	photoFiles[8] = {
	"gallery/Admin Building/AdminBuilding.jpg",
	"gallery/Admin Building/AdminBuilding2.jpg",
	"gallery/Admin Building/AdminFront.jpg",
	}
	photoFiles[9] = {
	"gallery/Oblation Square/ObleSquare.jpg",
	"gallery/Oblation Square/ObleSquare2.jpg"
	}
	photoFiles[10] = {
	"gallery/Guest House/GuestHouse.jpg",
	"gallery/Guest House/GuestHouse2.jpg"
	}
	photoFiles[11] = {
	"gallery/Library/Library.jpg"
	}
	photoFiles[12] = {
	default,
	}
	photoFiles[13] = {
	default,
	}
	photoFiles[14] = {
	"gallery/AS Building/AS Front.jpg",
	"gallery/AS Building/ASFrontGyod.jpg",
	"gallery/AS Building/ASLobby.jpg",
	}
	photoFiles[15] = {
	"gallery/AS Field/ASField.jpg",
	"gallery/AS Field/ASFiledTao.jpg",
	"gallery/AS Field/ASFieldTao2.jpg",
	"gallery/AS Field/ASFieldTao4.jpg"
	}
	photoFiles[16] = {
	"gallery/Admin Field/AdminField.jpg",
	"gallery/Admin Field/Admin Field2.jpg"
	}
	

local buildings = {
	"Undergrad Building",
	"Volleyball Court",
	"Basketball",
	"Management",
	"Clinic",
	"Dorms",
	"Canteen",
	"Admin Building",
	"Oble Square",
}
local floorPlan = {}
	floorPlan[1] = {
		"photos/NSMD 1ST FLR.png",
		"photos/NSMD 2ND FLR.png"
	}
	floorPlan[4] = {
		"photos/MANAGEMENT BLDG 1.png",
		"photos/MANAGEMENT BLDG 2.png"
	}
	floorPlan[8] = {
		"photos/ADMIN 1ST FLR.png",
		"photos/ADMIN 2ND FLOOR.png",
	}
	floorPlan[14] = {
		"photos/AS 1ST FLR LEFT.png",
		"photos/AS 1ST FLR RIGHT.png",
		"photos/AS 2ND FLR LEFT.png",
		"photos/AS 2ND FLR RIGHT.png",
		"photos/AS DCS 3RD FLR.png",
	}


local mapSize = {
	w = 4000,
	h = 2500,
}
myApp.w = mapSize.w
myApp.h =mapSize.h
local mapPins  = {}
	mapPins[1] = {
		index = 1,
		hasFP = 1,
		label = 'Undergrad Building', 
		image = photoFiles[1][1],
		text = 'The Undergraduate Building serves as the main building of the Arts and Humanities Cluster and Sciences Cluster. It is located at the western side of the UP Cebu Lahug Campus, near the basketball and volleyball courts',
		x =  1326,
		y =  411,
		FP = {
		"photos/NSMD 1ST FLR.png",
		"photos/NSMD 2ND FLR.png"
		},
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[2] ={
		index = 2,
		hasFP = 0,
		label = 'Volleyball Court',
		image =  photoFiles[2][1],
		text = "The Volleyball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building and the university gate. It is open to every UP Cebu student who wished to play and/or practice volleyball.",
		x = 1726,
		y = 491,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=tntOCGkgt98",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[3] = {
		index = 3,
		hasFP = 0,
		label = 'Basketball Court',
		image = photoFiles[3][1],
		text = "The Basketball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building. and the Management Bldg. It is open to every UP Cebu student who wished to play and/or practice basketball.",
		x = 1265, 
		y = 1025,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=fk4BbF7B29w",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[4] = {
		index = 4,
		hasFP = 1,
		label = 'Management',
		image = photoFiles[4][1],
		text = "The Management Building serves as the main building for Business Management Cluster. It is located at the western side of the UP Cebu Lahug Campus, beside the University Clinic.",
		x =  1077,
		y =  1097,
		FP = {
		"photos/MANAGEMENT BLDG 1.png",
		"photos/MANAGEMENT BLDG 2.png"
		},
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=8PRqEP_PKk8",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[5] = {
		index = 5,
		hasFP = 0,
		label = 'Clinic',
		image = photoFiles[5][1],
		text = "The UP Cebu Clinic is located at the western side of the UP Cebu Lahug Campus, near the Management Building and the Clinic. It provides medical services including dental and physical check-ups.",
		x = 1177,
		y = 1438,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=5Nrv5teMc9Y",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[6] = {
		index = 6, 
		hasFP = 0,
		label = 'Dorms',
		image = photoFiles[6][1],
		text = "The UP Cebu Dormitory is located at the western side of the UP Cebu Lahug Campus, near the Canteen and the Clinic. It is the home of UP Cebu students who are temporarily staying for the school year.",
		x = 873,
		y = 1637,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[7] = {
		index = 7,
		hasFP = 0,
		label = 'Canteen',
		image = photoFiles[7][1],
		text = "The UP Cebu Canteen is located at the western side of the UP Cebu Lahug Campus, near the Dorm and the Clinic. It provides food services and school supplies to students.",
		x = 1169,
		y = 1705,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=yZEyLJ0uIvw",
    		content_encoded = text,
    		description = "something description",

    	}
	} 
	mapPins[8] = {
		index = 8,
		hasFP = 1,
		label = 'Admin Building',
		image = photoFiles[8][1],
		text = "The Administration Building is located at the western side of the UP Cebu Lahug Campus, directly behind the Oblation Square. The building is where most of the university’s offices are currently located including the Office of the Dean. Other offices within the Admin Building that provides students’ services: Office of the University Registrar, Cash Office, Accounting Offices, Office of Student Affairs, Interactive Learning Center, and etc.",
		x = 1449,
		y = 1413,
		FP = {
		"photos/ADMIN 1ST FLR.png",
		"photos/ADMIN 2ND FLOOR.png",
		},
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=tntOCGkgt98",
    		content_encoded = text,
    		description = "something description",

    	}
	} 
	mapPins[9] = {
		index = 9,
		hasFP = 0,
		label = 'Oble Square',
		text = "The Oblation Square is located at the western side of the UP Cebu Lahug Campus, in front of the Administration Building. The square is where the Oblation Statue is situated which serves as the symbol of the University of the Philippines. It depicts a man facing upward with arms outstretched, symbolizing selfless offering of oneself to his country.",
		image = photoFiles[9][1],
		x = 1729,
		y = 1389,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=fk4BbF7B29w",
    		content_encoded = text,
    		description = "something description",

    	}
	} 
	mapPins[10] = {
		index = 10,
		hasFP = 0,
		label = 'Guest House',
		text = "The guest house is located at the western side of the UP Cebu Campus, near the library. A lodging for the accommodation of university’s guests and visitors. ",
		image = photoFiles[10][1],
		x = 805,
		y = 2017,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=8PRqEP_PKk8",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[11] = {
		index = 11,
		hasFP = 0,
		label = 'Library',
		text = [[Vision
    >>The University of the Philippines Cebu Library Services is to provide a cutting-edge learning education to our students, faculty, REPS, and staff by having addtional service - a service that blends in with our changing generation and evolving need of academic information."
>>"Mission",
    >>"To be the collaborators in achieving excellence in teaching, creating outstanding research outputs, and delivering excellent operational services.   ]],
		image = photoFiles[11][1],
		x = 1081,
		y = 2225,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=5Nrv5teMc9Y",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[12] = {
		index = 12,
		hasFP = 0,
		label = 'Admin Field',
		text = "The Administration Field is located at the western side of the UP Cebu Lahug Campus, near the library. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.",
		image = photoFiles[12][1],
		x = 1081,
		y = 2225,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=yZEyLJ0uIvw",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[13] = {
		index = 13,
		hasFP = 0,
		label = "CCC",
		text = [[@CebuCulturalCenter
>>Call 0917 624 8144]],
		image = photoFiles[13][1],
		x = 2401,
		y = 1389,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[14] = {
		index = 14, 
		hasFP = 1,
		label = "AS Building",
		text = "The Arts and Sciences Building is located at the eastern side of the UP Cebu Lahug Campus near the parking lot. It is where the Computer Science, Business Management, and Physical Education department faculties and Office of the Social Sciences Cluster are situated. The UP Press Bookstore and AS Lobby are also found in this building.",
		image = photoFiles[14][1],
		x = 2806, 
		y = 761,
		FP = {
		"photos/AS 1ST FLR LEFT.png",
		"photos/AS 1ST FLR RIGHT.png",
		"photos/AS 2ND FLR LEFT.png",
		"photos/AS 2ND FLR RIGHT.png",
		"photos/AS DCS 3RD FLR.png",
		},
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[15] = {
		index = 15,
		hasFP = 0,
		label = 'AS Field',
		text = "The AS Field is located at the eastern side of the UP Cebu Lahug Campus beside the UP High and AS Building. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.",
		image = photoFiles[15][1],
		x = 2994,
		y = 1365,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}
	mapPins[16] = {
		index = 16,
		hasFP = 0,
		label = 'Admin Field',
		text = "The Administration Field is located at the western side of the UP Cebu Lahug Campus, near the library. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.",
		image = photoFiles[16][1],
		x = 1526,
		y = 2109,
		video = {
    		title = label, 
    		link = "https://www.youtube.com/watch?v=N6jWu82_NoE",
    		content_encoded = text,
    		description = "something description",

    	}
	}



--pinGroup:addEventListener("touch", pinTap)
myApp.mapPins= mapPins
myApp.photos = photoFiles
myApp.floorplans = floorPlan


--rect = display.newImage(myApp.group, pin)

-- myApp.group:scale(0.05, 0.05)
