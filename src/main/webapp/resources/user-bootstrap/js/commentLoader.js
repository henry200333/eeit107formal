var thisPerformanceId = $('#thisp').val();
var userAccount = $('#userAccount').val();
var userDisplayName = $('#userDisplayName').val();
var userPhoto = $('#userPhoto').val();
var replyOpen = 0;
var editOpen = 0;
var originalComment;

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
										.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount).attr('id','editButton'+performanceComment.id))
										.append($('<span>').css({'margin-left':'20px','color':'blue','cursor': 'pointer'}).attr('id','reply'+performanceComment.id).text('回覆'))))

				$('#commentAppend').append(commentBigDiv);
				
				if(userDisplayName==performanceComment.userName){
					$('#editButton'+performanceComment.id).append($('<button>').addClass('btn btn-primary forumEdit').text('編輯'));
				}
				
				$('#reply'+performanceComment.id).click(function(){
					if(replyOpen==0){
						$(this).parent().append("<input type='text' size='30' id='nowInput' style='border:none;border-bottom:2px solid blue;margin-left:20px;'><button type='button'  class='btn btn-primary' id='nowSend' name='"+performanceComment.id+"' onclick='replyComment()' style='padding:5px 10px;margin-left:5px;cursor: pointer;' ><i class='fas fa-share'></i></button><button  class='btn btn-danger' type='button' id='nowCancel' onclick='closeReply()' style='padding:5px 10px;margin-left:5px;cursor: pointer;'><i class='fas fa-times'></i></button>");
						replyOpen=1;
					}
				})
				}else{
							
				//第二層留言
					var commentSecondDiv = $('<div>').addClass('row')
					.append($('<div>').addClass('col-1')
							.append($('<img>')
									.attr('src',performanceComment.userPhoto)
									.css({'width':'30px','border-radius':'50%','border':'1px solid white','margin-left':'10px','margin-top':'10px'})))										
					.append($('<div>').addClass('col-11').css({'margin-top':'10px'}).attr('id','forum'+performanceComment.id) //<<子留言流水號ID
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
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount).attr('id','editButton'+performanceComment.id))
									.append($('<hr>'))
									))
				
				$('#forum'+performanceComment.refCommentId).append(commentSecondDiv);
					if(userDisplayName==performanceComment.userName){
						$('#editButton'+performanceComment.id).append($('<button>').addClass('btn btn-primary forumEdit').text('編輯'));
					}
				}
				
			}) //each結束
				$('.forumEdit').click(function(event){	
					if(editOpen==1)return false;
					originalComment = $(this).parent().parent().prev().children().children().text()
					var editCommentId = $(this).parent().parent().parent().attr('id').substring(5);
					
					$(this).parent().parent().prev().children().children().toggle();
					$(this).parent().parent().prev().children().append("<input type='text' id='edit"+ editCommentId +"' value='"+ originalComment +"'><button type='button' onclick='sendEdit("+editCommentId+")'>送出</button><button type='button' onclick='cancelEdit("+editCommentId+")'>取消</button>")
					editOpen=1;
				});			
		}//success結束
	})
	
}
reloadComments();

function sendEdit(id){
	var editCommentContent = $('#edit'+id).val();
	$.ajax({
		url:'/forum/editComment',
		type:'GET',
		data:{'id':id,'comment':editCommentContent},
		success:function(data){
			
			reloadComments();
			editOpen=0;
		}	
	})
	
}

function cancelEdit(id){
	$(event.target).parent().children().show();
	$(event.target).parent().children()[1].remove();
	$(event.target).parent().children()[1].remove();
	$(event.target).parent().children()[1].remove();
	editOpen=0;
}


function closeReply(){
	$('#nowInput').remove();
	$('#nowSend').remove();
	$('#nowCancel').remove();
	replyOpen=0;
}

function replyComment(){
//	console.log(event.target.previousElementSibling.value);
//	console.log($(event.target).prev().val())
//	console.log($(event.target).attr('name'))
	if(!userAccount){
		var login = confirm("請先登入");
		if(login==true){window.location.href="/login";}
	}else{
	
	var replyCommenetData = {
			'userName':userDisplayName,
			'forumBoard':'Performance',
			'refId':thisPerformanceId,
			'refCommentId':$(event.target).attr('name'),
			'comment':$(event.target).prev().val(),
			'userPhoto':userPhoto
			}
	
	$.ajax({
		url:'/forum/addCommentReply',
		type:'GET',
		data:replyCommenetData,
		success:function(performanceComment){
			console.log(performanceComment);
			replyOpen=0;
			reloadComments();
		}
		})		
	}
}

$('#firstLayerButton').click(function(){
	if(!userAccount){
		var login = confirm("請先登入");
		if(login==true){window.location.href="/login";}
	}else{
		if($('#firstLayerComment').val().trim()=='') return false;
		
	var replyData = {
			'userName':userDisplayName,
			'forumBoard':'Performance',
			'refId':thisPerformanceId,
			'refCommentId':0,
			'comment':$('#firstLayerComment').val(),
			'userPhoto':userPhoto
			}
	
	$.ajax({
		url:'/forum/addCommentReply',
		type:'GET',
		data:replyData,
		success:function(performanceComment){
			$('#firstLayerComment').val('');
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
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount).attr('id','editButton'+performanceComment.id))
									.append($('<span>').css({'margin-left':'20px','color':'blue'}).attr('id','reply'+performanceComment.id).text('回覆'))))

			$('#commentAppend').append(commentBigDiv);
			if(userDisplayName==performanceComment.userName){
				$('#editButton'+performanceComment.id).append($('<button>').addClass('btn btn-primary forumEdit').text('編輯'));
			}
			$('#reply'+performanceComment.id).click(function(){
				if(replyOpen==0){
					$(this).parent().append("<input type='text' size='30' id='nowInput' style='border:none;border-bottom:2px solid blue;margin-left:20px;'><button type='button'  class='btn btn-primary' id='nowSend' name='"+performanceComment.id+"' onclick='replyComment()' style='padding:5px 10px;margin-left:5px;cursor: pointer;' ><i class='fas fa-share'></i></button><button  class='btn btn-danger' type='button' id='nowCancel' onclick='closeReply()' style='padding:5px 10px;margin-left:5px;cursor: pointer;'><i class='fas fa-times'></i></button>");
					replyOpen=1;
				}
			})
			$('.forumEdit').click(function(event){
				originalComment = $(this).parent().parent().prev().children().children().text()
				var editCommentId = $(this).parent().parent().parent().attr('id').substring(5);
				
				$(this).parent().parent().prev().children().children().toggle();
				$(this).parent().parent().prev().children().append("<input type='text' id='edit"+ editCommentId +"' value='"+ originalComment +"'><button type='button' onclick='sendEdit("+editCommentId+")'>送出</button><button type='button' onclick='cancelEdit("+editCommentId+")'>取消</button>")
			});		
			
			}
		})

	}
	
	
	
})

