var thisPerformanceId = $('#thisp').val();
var userAccount = $('#userAccount').val();

function reloadComments(){
	$.ajax({
		url:'/forum/iwantcomments',
		type:'GET',
		data:{'forumBoard':'Performance','refId':thisPerformanceId},
		success:function(performanceComments){
			$.each(performanceComments,function(idx,performanceComment){
				//第一層留言
				if(performanceComment.refCommentId==0){
				var commentBigDiv = $('<div>').addClass('row')
				.append($('<div>').addClass('col-1')
						.append($('<img>')
								.attr('src',performanceComment.userPhoto)
								.css({'width':'50px','border-radius':'50%','border':'1px solid white'})))										
				.append($('<div>').addClass('col-11').attr('id','1')
						.append($('<div>').addClass('row')
								.append($('<div>').addClass('col-3')
										.append($('<p>').text(performanceComment.userName)))
								.append($('<div>').addClass('col-9')))
						.append($('<div>').addClass('row')
								.append($('<div>').addClass('col-2'))
								.append($('<div>').addClass('col-10')
										.append($('<p>').text(performanceComment.comment))))
						.append($('<div>').addClass('row')
								.append($('<div>').addClass('col-5')
										.append($('<p>').text('回覆')))
								.append($('<div>').addClass('col-4')
										.append($('<p>').text(performanceComment.commentDate)))
								.append($('<div>').addClass('col-3')
										.append($('<p>').text('喜歡 不喜歡')))))
				$('#commentAppend').html('');
				$('#commentAppend').append(commentBigDiv);
				}else{
							
				//第二層留言
					var commentSecondDiv = $('<div>').addClass('row')
					.append($('<div>').addClass('col-1')
							.append($('<img>')
									.attr('src',performanceComment.userPhoto)
									.css({'width':'50px','border-radius':'50%','border':'1px solid white'})))										
					.append($('<div>').addClass('col-11').attr('id','1')
							.append($('<div>').addClass('row')
									.append($('<div>').addClass('col-3')
											.append($('<p>').text(performanceComment.userName)))
									.append($('<div>').addClass('col-9')))
							.append($('<div>').addClass('row')
									.append($('<div>').addClass('col-2'))
									.append($('<div>').addClass('col-10')
											.append($('<p>').text(performanceComment.comment))))
							.append($('<div>').addClass('row')
									.append($('<div>').addClass('col-5')
											.append($('<p>').text('回覆')))
									.append($('<div>').addClass('col-4')
											.append($('<p>').text(performanceComment.commentDate)))
									.append($('<div>').addClass('col-3')
											.append($('<p>').text('喜歡 不喜歡')))))
				
				$('#'+performanceComment.refCommentId).append(commentSecondDiv);
				}
				
			})
								
		}
	})
}
reloadComments();
