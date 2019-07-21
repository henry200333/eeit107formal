var thisPerformanceId = $('#thisp').val();
var userAccount = $('#userAccount').val();

function reloadComments(){
	$.ajax({
		url:'/forum/iwantcomments',
		type:'GET',
		data:{'forumBoard':'Performance','refId':thisPerformanceId},
		success:function(performanceComments){
			$('#commentAppend').html('');
			$.each(performanceComments,function(idx,performanceComment){
				//第一層留言
				if(performanceComment.refCommentId==0){
				var commentBigDiv = $('<div>').addClass('row')
				.append($('<div>').addClass('col-1')
						.append($('<img>')
								.attr('src',performanceComment.userPhoto)
								.css({'width':'50px','border-radius':'50%','border':'1px solid white'})))										
				.append($('<div>').addClass('col-11').attr('id','forum'+performanceComment.id)
								.append($('<div>').addClass('col-12')
										.append($('<span>').css({'font-weight':'bold'}).text(performanceComment.userName))
										.append($('<span>').css({'padding':'10px','font-size':'12px'}).text(performanceComment.commentDate)))
						.append($('<div>').addClass('row')
								.append($('<div>').addClass('col-12')
										.append($('<p>').css({'margin-left':'14px','margin-top':'10px'}).text(performanceComment.comment))))
								.append($('<div>').addClass('col-12').css({'padding-top':'20px'})
										.append($('<i>').addClass('far fa-thumbs-up'))
										.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.likeCount))
										.append($('<i>').addClass('far fa-thumbs-down'))
										.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount))
										.append($('<span>').css({'margin-left':'20px','color':'blue'}).attr('id','reply'+performanceComment.id).text('回覆'))))

				$('#commentAppend').append(commentBigDiv);
				$('#reply'+performanceComment.id).click(function(){
					alert($(this).attr('id'));
					$("#reply"+performanceComment.id).append("<input type='text' >")
				})
				}else{
							
				//第二層留言
					var commentSecondDiv = $('<div>').addClass('row')
					.append($('<div>').addClass('col-1')
							.append($('<img>')
									.attr('src',performanceComment.userPhoto)
									.css({'width':'30px','border-radius':'50%','border':'1px solid white','margin-left':'10px','margin-top':'10px'})))										
					.append($('<div>').addClass('col-11').css({'margin-top':'10px'}).attr('id',performanceComment.id) //<<子留言流水號ID
							.append($('<div>').addClass('col-12')
									.append($('<span>').css({'font-weight':'bold'}).text(performanceComment.userName))
									.append($('<span>').css({'padding':'10px','font-size':'12px'}).text(performanceComment.commentDate)))
					.append($('<div>').addClass('row')
							.append($('<div>').addClass('col-12')
									.append($('<p>').css({'margin-left':'14px','margin-top':'5px'}).text(performanceComment.comment))))
							.append($('<div>').addClass('col-12').css({'padding-top':'5px'})
									.append($('<i>').addClass('far fa-thumbs-up'))
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.likeCount))
									.append($('<i>').addClass('far fa-thumbs-down'))
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount))
									.append($('<hr>'))
									))
				
				$('#forum'+performanceComment.refCommentId).append(commentSecondDiv);
				}
				
			})
								
		}
	})
}
reloadComments();
