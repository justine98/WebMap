jQuery(document).ready(function($){
    $('.cd-popup-trigger').bind('click touchend', function(event){
		$('.panel-container').addClass('is-visible');
	});
	
	$('.panel-container').on('click', function(event){
		if( $(event.target).is('.panel-container') ) {
			$(this).removeClass('is-visible');
		}
	});

	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.panel-container').removeClass('is-visible');
    		$('.modal').removeClass('visible');
	    }
    });
});