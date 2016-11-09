app.controller('MainController', ($scope, $http) => {
	$scope.title = ''
	$scope.description = ''
	$scope.photo = ''
	$scope.fps =  	[	{Ploc:'images/floorplans/AS/AS 1ST FLR LEFT.png', flr: 'L1'}, 
						{Ploc:'images/floorplans/AS/AS 1ST FLR RIGHT.png', flr: 'R1'}, 
						{Ploc:'images/floorplans/AS/AS 2ND FLR LEFT.png', flr: 'L2'}, 
						{Ploc:'images/floorplans/AS/AS 2ND FLR RIGHT.png', flr: 'R2'}, 
						{Ploc:'images/floorplans/AS/AS DCS 3RD FLR.png', flr: 'R3'}
					]

	$scope.pins = 	[	{	t: '7.0%', l: '32.65%',ip: 'images/floorplans/NSMD/NSMD 1ST FLR.png', 
							f: [{Ploc:'images/floorplans/NSMD/NSMD 1ST FLR.png', flr: 'F1'}, {Ploc:'images/floorplans/NSMD/NSMD 2ND FLR.png', flr: 'F2'}], Bldng: 'UNDERGRADUATE BUILDING', Dscr: 'The Undergraduate Building serves as the main building of the Arts and Humanities Cluster and Sciences Cluster. It is located at the western side of the UP Cebu Lahug Campus, near the basketball and volleyball courts.'},
						{	t: '9.5%', l: '43%', Bldng: 'VOLLEYBALL COURT', Dscr: 'The Volleyball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building and the university gate. It is open to every UP Cebu student who wished to play and/or practice volleyball.'},
						{	t: '30%', l: '31.15%', Bldng: 'BASKETBALL COURT', Dscr: 'The Basketball Court is located at the western side of the UP Cebu Lahug Campus, near the Undergraduate Building. and the Management Bldg. It is open to every UP Cebu student who wished to play and/or practice basketball.'},
						{	t: '35%', l: '26.43%', ip: 'images/floorplans/Management/MANAGEMENT BLDG 1.png', 
							f: [{Ploc:'images/floorplans/Management/MANAGEMENT BLDG 1.png', flr: 'B1'}, {Ploc:'images/floorplans/Management/MANAGEMENT BLDG 2.png', flr: 'B2'}], Bldng: 'MANAGEMENT BUILDING', Dscr: 'The Management Building serves as the main building for Business Management Cluster. It is located at the western side of the UP Cebu Lahug Campus, beside the University Clinic.'},
						{	t: '55%', l: '20.7%', Bldng: 'DORMITORY', Dscr: 'The UP Cebu Dormitory is located at the western side of the UP Cebu Lahug Campus, near the Canteen and the Clinic. It is the home of UP Cebu students who are temporarily staying for the school year.'},
						{	t: '70.5%', l: '19.5%', Bldng: 'GUEST HOUSE', Dscr: 'The guest house is located at the western side of the UP Cebu Campus, near the library. A lodging for the accommodation of university’s guests and visitors. '},
						{	t: '52%', l: '26%', Bldng: 'CLINIC', Dscr: 'The UP Cebu Clinic is located at the western side of the UP Cebu Lahug Campus, near the Management Building and the Clinic. It provides medical services including dental and physical check-ups.'},
						{	t: '60%', l: '29%', Bldng: 'CANTEEN', Dscr: 'The UP Cebu Canteen is located at the western side of the UP Cebu Lahug Campus, near the Dorm and the Clinic. It provides food services and school supplies to students.'},
						{	t: '47.6%', l: '35.8%',  ip: 'images/floorplans/ADMIN/ADMIN 1ST FLR.png', 
							f: [{Ploc:'images/floorplans/ADMIN/ADMIN 1ST FLR.png', flr: 'F1'}, {Ploc:'images/floorplans/ADMIN/ADMIN 2ND FLR.png', flr: 'F2'}], Bldng: 'ADMINISTRATION BUILDING', Dscr: 'The Administration Building is located at the western side of the UP Cebu Lahug Campus, directly behind the Oblation Square. The building is where most of the university’s offices are currently located including the Office of the Dean. Other offices within the Admin Building that provides students’ services: Office of the University Registrar, Cash Office, Accounting Offices, Office of Student Affairs, Interactive Learning Center, and etc.'},
						{	t: '45.8%', l: '42.6%', Bldng: 'OBLATION SQUARE', Dscr: 'The Oblation Square is located at the western side of the UP Cebu Lahug Campus, in front of the Administration Building. The square is where the Oblation Statue is situated which serves as the symbol of the University of the Philippines. It depicts a man facing upward with arms outstretched, symbolizing selfless offering of oneself to his country.'},
						{	t: '78%', l: '25.72%', Bldng: 'LIBRARY', Dscr: 'The University of the Philippines Cebu Library Services is to provide a cutting-edge learning education to our students, faculty, REPS, and staff by having addtional service - a service that blends in with our changing generation and evolving need of academic information.'},
						{	t: '76.5%', l: '38%', Bldng: 'ADMINISTRATION FIELD', Dscr: 'The Administration Field is located at the western side of the UP Cebu Lahug Campus, near the library. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.'},
						{	t: '49%', l: '56%', Bldng: 'CEBU CULTURAL CENTER', Dscr: '@CebuCulturalCenter \n Call 0917 624 8144'},
						{	t: '22%', l: '67.8%', ip: 'images/floorplans/AS/AS 1ST FLR LEFT.png', 
							f: [{Ploc:'images/floorplans/AS/AS 1ST FLR LEFT.png', flr: 'L1'}, {Ploc:'images/floorplans/AS/AS 1ST FLR RIGHT.png', flr: 'R1'}, {Ploc:'images/floorplans/AS/AS 2ND FLR LEFT.png', flr: 'L2'}, {Ploc:'images/floorplans/AS/AS 2ND FLR RIGHT.png', flr: 'R2'}, {Ploc:'images/floorplans/AS/AS DCS 3RD FLR.png', flr: 'R3'}], Bldng: 'ARTS and SCIENCES BUILDING', Dscr: 'The Arts and Sciences Building is located at the eastern side of the UP Cebu Lahug Campus near the parking lot. It is where the Computer Science, Business Management, and Physical Education department faculties and Office of the Social Sciences Cluster are situated. The UP Press Bookstore and AS Lobby are also found in this building.'},
						{	t: '43%', l: '75.8%', Bldng: 'ARTS  and  SCIENCES FIELD', Dscr: 'The AS Field is located at the eastern side of the UP Cebu Lahug Campus beside the UP High and AS Building. It is open to every UP Cebu student who wished to play and/or practice all kinds of sports.'}
					];
	$scope.setDetails = function(x){
		$scope.title = x.Bldng;
		$scope.description = x.Dscr;
		$scope.photo = x.ip;
		$scope.max = '400px';
		$scope.fsize = '15px';
		$scope.padleft = '0';
		angular.copy(x.f, $scope.fps)
	}

	$scope.setPhoto = function(x){
		$scope.photo = x.Ploc;
	}

	$scope.onTouchstart = function(x) {
   		$scope.title = x.Bldng;
		$scope.description = x.Dscr;
		$scope.photo = x.ip;
		$scope.max = '100%';
		$scope.padleft = '19%';
		$scope.setfsize();
		angular.copy(x.f, $scope.fps)
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
