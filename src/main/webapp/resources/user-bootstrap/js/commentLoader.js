var thisPerformanceId = $('#thisp').val();
var userAccount = $('#userAccount').val();


$.ajax({
	url:'/forum/iwantcomments',
	type:'GET',
	data:{'forumBoard':'Performance','refId':thisPerformanceId},
	success:function(performanceComments){
		console.log(performanceComments);
	}
})

