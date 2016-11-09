app.controller('MainController', ($scope, $http, $sce) => {
	$scope.title = ''
	$scope.description = ''
	$scope.photo = ''
	$scope.fps =  	[	{Ploc:'images/floorplans/AS/AS 1ST FLR LEFT.png', flr: 'L1'}, 
						{Ploc:'images/floorplans/AS/AS 1ST FLR RIGHT.png', flr: 'R1'}, 
						{Ploc:'images/floorplans/AS/AS 2ND FLR LEFT.png', flr: 'L2'}, 
						{Ploc:'images/floorplans/AS/AS 2ND FLR RIGHT.png', flr: 'R2'}, 
						{Ploc:'images/floorplans/AS/AS DCS 3RD FLR.png', flr: 'R3'}
					]
	$scope.firstD = '';
	$scope.vidz = '';
	$scope.vidlink ='';
	$scope.pps =  [		{Dloc:'images/gallery/Undergrad Building/NsmdCatwalkResized.jpg'},
						{Dloc:'images/gallery/Undergrad Building/NsmdEntrance.jpg'},
						{Dloc:'images/gallery/Undergrad Building/NsmdSecondFloor.jpg'},
						{Dloc:'images/gallery/Undergrad Building/NsmdSulod.jpg'}
					]


	$scope.pins = 	[	{	t: '7.0%', l: '32.65%',ip: 'images/floorplans/NSMD/NSMD 1ST FLR.png', 
							vip: 'https://www.youtube.com/embed/GCdwKhTtNNw',
							f: [{Ploc:'images/floorplans/NSMD/NSMD 1ST FLR.png', flr: 'F1'}, {Ploc:'images/floorplans/NSMD/NSMD 2ND FLR.png', flr: 'F2'}], 
							pip: 'images/gallery/Undergrad Building/NsmdCatwalkResized.jpg', pf: [{Dloc:'images/gallery/Undergrad Building/NsmdCatwalkResized.jpg'}, {Dloc:'images/gallery/Undergrad Building/NsmdEntrance.jpg'}, {Dloc:'images/gallery/Undergrad Building/NsmdSecondFloor.jpg'}, {Dloc:'images/gallery/Undergrad Building/NsmdSulod.jpg'}],
							Bldng: 'UNDERGRADUATE BUILDING', Dscr: 'The Undergraduate Building serves as the main building of the Arts and Humanities Cluster and Sciences Cluster. It is located at the western side of the UP Cebu Lahug Campus, near the basketball and volleyball courts.'},
						{	t: '9.5%', l: '43%', 
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							pip: 'images/temp gallery/y.jpg', pf: [{Dloc:'images/temp gallery/y.jpg'}, {Dloc:'images/temp gallery/e.jpg'}],
							Bldng: 'VOLLEYBALL COURT', Dscr: 'The Volleyball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building and the university gate. It is open to every UP Cebu student who wished to play and/or practice volleyball.'},
						{	t: '30%', l: '31.15%',
							vip: 'https://www.youtube.com/embed/VQH8ZTgna3Q',
							pip: 'images/gallery/Basketball Court/BasketballCourtResized.jpg', pf: [{Dloc:'images/gallery/Basketball Court/BasketballCourtResized.jpg'}, {Dloc:'images/gallery/Basketball Court/BasketballCourtResized.jpg'}, {Dloc:'images/gallery/Basketball Court/BasketballCourtResized.jpg'}],
							Bldng: 'BASKETBALL COURT', Dscr: 'The Basketball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building. and the Management Bldg. It is open to every UP Cebu student who wished to play and/or practice basketball.'},
						{	t: '35%', l: '26.43%', ip: 'images/floorplans/Management/MANAGEMENT BLDG 1.png', 
							vip: 'https://www.youtube.com/embed/SDTZ7iX4vTQ',
							pip: 'images/gallery/Management Building/ManagementResized.jpg', pf: [{Dloc:'images/gallery/Management Building/ManagementResized.jpg'}, {Dloc:'images/gallery/Management Building/ManagementResized.jpg'}, {Dloc:'images/gallery/Management Building/ManagementResized.jpg'}],
							f: [{Ploc:'images/floorplans/Management/MANAGEMENT BLDG 1.png', flr: 'B1'}, {Ploc:'images/floorplans/Management/MANAGEMENT BLDG 2.png', flr: 'B2'}], 
							Bldng: 'MANAGEMENT BUILDING', Dscr: 'The Management Building serves as the main building for Business Management Cluster. It is located at the western side of the UP Cebu Lahug Campus, beside the University Clinic.'},
						{	t: '55%', l: '20.7%', 
							vip: 'https://www.youtube.com/embed/fk4BbF7B29w',
							pip: 'images/temp gallery/y.jpg', pf: [{Dloc:'images/temp gallery/e.jpg'}, {Dloc:'images/temp gallery/z.jpg'}],
							Bldng: 'DORMITORY', Dscr: 'The UP Cebu Dormitory is located at the western side of the UP Cebu Lahug Campus, near the Canteen and the Clinic. It is the home of UP Cebu students who are temporarily staying for the school year.'},
						{	t: '70.5%', l: '19.5%', 
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							pip: 'images/gallery/Guest House/GuestHouse.jpg', pf: [{Dloc:'images/gallery/Guest House/GuestHouse.jpg'}, {Dloc:'images/gallery/Guest House/GuestHouse2.jpg'}, {Dloc:'images/temp gallery/y.jpg'}],
							Bldng: 'GUEST HOUSE', Dscr: 'The guest house is located at the western side of the UP Cebu Campus, near the library. A lodging for the accommodation of university’s guests and visitors. '},
						{	t: '52%', l: '26%',
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							pip: 'images/temp gallery/y.jpg', pf: [{Dloc:'images/temp gallery/e.jpg'}, {Dloc:'images/temp gallery/y.jpg'}, {Dloc:'images/temp gallery/z.jpg'}],
							Bldng: 'CLINIC', Dscr: 'The UP Cebu Clinic is located at the western side of the UP Cebu Lahug Campus, near the Management Building and the Clinic. It provides medical services including dental and physical check-ups.'},
						{	t: '60%', l: '29%', 
							vip: 'https://www.youtube.com/embed/fk4BbF7B29w',
							pip: 'images/gallery/Canteen/Canteen.jpg', pf: [{Dloc:'images/gallery/Canteen/Canteen.jpg'}, {Dloc:'images/gallery/Canteen/Canteen2.jpg'}],
							Bldng: 'CANTEEN', Dscr: 'The UP Cebu Canteen is located at the western side of the UP Cebu Lahug Campus, near the Dorm and the Clinic. It provides food services and school supplies to students.'},
						{	t: '47.6%', l: '35.8%',  ip: 'images/floorplans/ADMIN/ADMIN 1ST FLR.png', 
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							f: [{Ploc:'images/floorplans/ADMIN/ADMIN 1ST FLR.png', flr: 'F1'}, {Ploc:'images/floorplans/ADMIN/ADMIN 2ND FLR.png', flr: 'F2'}], 
							pip: 'images/gallery/Admin Building/AdminBuilding.jpg', pf: [{Dloc:'images/gallery/Admin Building/AdminBuilding.jpg'}, {Dloc:'images/gallery/Admin Building/AdminFront.jpg'}],
							Bldng: 'ADMINISTRATION BUILDING', Dscr: 'The Administration Building is located at the western side of the UP Cebu Lahug Campus, directly behind the Oblation Square. The building is where most of the university’s offices are currently located including the Office of the Dean. Other offices within the Admin Building that provides students’ services: Office of the University Registrar, Cash Office, Accounting Offices, Office of Student Affairs, Interactive Learning Center, and etc.'},
						{	t: '45.8%', l: '42.6%',
							vip: 'https://www.youtube.com/embed/VQH8ZTgna3Q',
							pip: 'images/gallery/Oblation Square/ObleSquare.jpg', pf: [{Dloc:'images/gallery/Oblation Square/ObleSquare.jpg'}, {Dloc:'images/gallery/Oblation Square/ObleSquare2.jpg'}, {Dloc:'images/gallery/Oblation Square/ObleSquare.jpg'}],
							Bldng: 'OBLATION SQUARE', Dscr: 'The Oblation Square is located at the western side of the UP Cebu Lahug Campus, in front of the Administration Building. The square is where the Oblation Statue is situated which serves as the symbol of the University of the Philippines. It depicts a man facing upward with arms outstretched, symbolizing selfless offering of oneself to his country.'},
						{	t: '78%', l: '25.72%', 
							vip: 'https://www.youtube.com/embed/VQH8ZTgna3Q',
							pip: 'images/gallery/Library/Library.jpg', pf: [{Dloc:'images/gallery/Library/Library.jpg'}, {Dloc:'images/gallery/Library/Library.jpg'}, {Dloc:'images/gallery/Library/Library.jpg'}],
							Bldng: 'LIBRARY', Dscr: 'The University of the Philippines Cebu Library Services is to provide a cutting-edge learning education to our students, faculty, REPS, and staff by having addtional service - a service that blends in with our changing generation and evolving need of academic information.'},
						{	t: '76.5%', l: '38%',
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							pip: 'images/gallery/Admin Field/AdminField.jpg', pf: [{Dloc:'images/gallery/Admin Field/AdminField.jpg'}, {Dloc:'images/gallery/Admin Field/AdminField.jpg'}, {Dloc:'images/gallery/Admin Field/AdminField.jpg'}],
							Bldng: 'ADMINISTRATION FIELD', Dscr: 'The Administration Field is located at the western side of the UP Cebu Lahug Campus, near the library. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.'},
						{	t: '49%', l: '56%', 
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							pip: 'images/temp gallery/y.jpg', pf: [{Dloc:'images/temp gallery/y.jpg'}, {Dloc:'images/temp gallery/y.jpg'}, {Dloc:'images/temp gallery/c.jpg'}],
							Bldng: 'CEBU CULTURAL CENTER', Dscr: '@CebuCulturalCenter \n Call 0917 624 8144'},
						{	t: '22%', l: '67.8%', ip: 'images/floorplans/AS/AS 1ST FLR LEFT.png', 
							vip: 'https://www.youtube.com/embed/bpOSxM0rNPM',
							f: [{Ploc:'images/floorplans/AS/AS 1ST FLR LEFT.png', flr: 'L1'}, {Ploc:'images/floorplans/AS/AS 1ST FLR RIGHT.png', flr: 'R1'}, {Ploc:'images/floorplans/AS/AS 2ND FLR LEFT.png', flr: 'L2'}, {Ploc:'images/floorplans/AS/AS 2ND FLR RIGHT.png', flr: 'R2'}, {Ploc:'images/floorplans/AS/AS DCS 3RD FLR.png', flr: 'R3'}], 
							pip: 'images/gallery/AS Building/AS Front.jpg', pf: [{Dloc:'images/gallery/AS Building/AS Front.jpg'}, {Dloc:'images/gallery/AS Building/ASFrontGyod.jpg'}],
							Bldng: 'ARTS and SCIENCES BUILDING', Dscr: 'The Arts and Sciences Building is located at the eastern side of the UP Cebu Lahug Campus near the parking lot. It is where the Computer Science, Business Management, and Physical Education department faculties and Office of the Social Sciences Cluster are situated. The UP Press Bookstore and AS Lobby are also found in this building.'},
						{	t: '43%', l: '75.8%',
							vip: 'https://www.youtube.com/embed/fk4BbF7B29w',
							pip: 'images/gallery/AS Field/ASField.jpg', pf: [{Dloc:'images/gallery/AS Field/ASField.jpg'},{Dloc:'images/gallery/AS Field/ASField.jpg'}, {Dloc:'images/gallery/AS Field/ASField.jpg'}],
							Bldng: 'ARTS  and  SCIENCES FIELD', Dscr: 'The AS Field is located at the eastern side of the UP Cebu Lahug Campus beside the UP High and AS Building. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.'}];
	$scope.setDetails = function(x){
		$scope.title = x.Bldng;
		$scope.description = x.Dscr;
		$scope.photo = x.ip;
		$scope.picture = x.pip;
		$scope.firstD = x.pf[0].Dloc;
		$scope.max = '400px';
		$scope.fsize = '15px';
		$scope.padleft = '0';
		// $scope.vidz = 'https://www.youtube.com/embed/wlsdMpnDBn8';
		$scope.vidz = x.vip;
		$scope.vidlink = $sce.trustAsResourceUrl($scope.vidz);
		angular.copy(x.f, $scope.fps)
		angular.copy(x.pf, $scope.pps)
	}

	$scope.setPhoto = function(x){
		$scope.photo = x.Ploc;
	}

	$scope.setPhoto1 = function(x){
		$scope.picture = x.Dloc;
	}

	$scope.onTouchstart = function(x) {
   		$scope.title = x.Bldng;
		$scope.description = x.Dscr;
		$scope.photo = x.ip;
		$scope.picture = x.pip;
		$scope.max = '100%';
		$scope.padleft = '19%';
		$scope.setfsize();
		angular.copy(x.f, $scope.fps)
		angular.copy(x.pf, $scope.pps)
	}

	$scope.setfsize = function(){
		if(window.innerHeight > window.innerWidth){ 
          $scope.fsize = '50px';
          $scope.deets = 'height: 150px; width: 150px; bottom: 50px;';
        } else {
          $scope.fsize = '20px';
        }
	}
})
