$(document).ready(function(){
	var tabLink = $("#tab-menu li"),
		subLink = $("#link-tab li"),
		currentUrl = location.href,
		tabContent = $("#tab-context> div");

	tabLink.click(function(e){
		e.preventDefault();
		var targetIdx = $(this).index();
	
		activateTab(targetIdx);
	});
	
	tabLink.click(function(e){
		e.preventDefault();
		var targetIdx = $(this).index();
	
		activateTab(targetIdx);
	});
		
	function activateTab(idx){
		tabContent.hide();
		tabLink.find('a').removeClass('active');
		tabLink.eq(idx).find('a').addClass('active');
		tabContent.eq(idx).show();
	}
	
});



