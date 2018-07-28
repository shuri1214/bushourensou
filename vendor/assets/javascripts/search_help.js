/* add for this site */
/*global $*/
$(document).ready(function() {
	$(".btn-search").click(function() {
		var search_path = location.pathname+"?q="+$("#search").val();
		window.location.href = search_path;
		return false;
	});
});

