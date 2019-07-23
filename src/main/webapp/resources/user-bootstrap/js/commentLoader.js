$('head').append('<link rel="stylesheet" type="text/css" href="/resources/user-bootstrap/css/forumCss.css">');

var thisPerformanceId = $('#thisp').val();
var userAccount = $('#userAccount').val();
var userDisplayName = $('#userDisplayName').val();
var userPhoto = $('#userPhoto').val();
var currentOpen = 0;
var originalComment;
var userForumLikes;
var userForumDislikes;



function refreshLikeData(){
	$.ajax({
		url:'/forum/getUserLikes',
		type:'GET',
		data:{'account':userAccount},
		success:function(userForumLikes){
			$.each(userForumLikes,function(idx,forum){
				if(forum.forumBoard=='Performance'&&forum.refId==thisPerformanceId){
					if($('#like'+forum.id)){
						$('#like'+forum.id).addClass('likedivclick');
					}
				}
			})	
		}
	})
	$.ajax({
		url:'/forum/getUserDislikes',
		type:'GET',
		data:{'account':userAccount},
		success:function(userForumDislikes){
			$.each(userForumDislikes,function(idx,forum2){
				if(forum2.forumBoard=='Performance'&&forum2.refId==thisPerformanceId){
					if($('#dislike'+forum2.id)){
						$('#dislike'+forum2.id).addClass('dislikedivclick');
					}
				}
			})
		}
	})	
}

function reloadComments(){
	currentOpen=0;	
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
										.append($('<i>').addClass('far fa-thumbs-up likediv').attr('id','like'+performanceComment.id))
										.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.likeCount))
										.append($('<i>').addClass('far fa-thumbs-down dislikediv').attr('id','dislike'+performanceComment.id))
										.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount).attr('id','editButton'+performanceComment.id))
										.append($('<span>').css({'margin-left':'20px','color':'blue','cursor': 'pointer'}).attr('id','reply'+performanceComment.id).text('回覆'))))

				$('#commentAppend').append(commentBigDiv);
				
				if(userDisplayName==performanceComment.userName){
					$('#editButton'+performanceComment.id).append($('<button>').addClass('btn forumEdit').css({"background-color":"white","color":"red"}).text('編輯'));
				}
				
				$('#reply'+performanceComment.id).click(function(){
					if(currentOpen==0){
						$(this).parent().append("<input type='text' size='30' id='nowInput' style='border:none;border-bottom:2px solid blue;margin-left:20px;'><button type='button'  class='btn btn-primary' id='nowSend' name='"+performanceComment.id+"' onclick='replyComment()' style='padding:5px 10px;margin-left:5px;cursor: pointer;' ><i class='fas fa-share'></i></button><button  class='btn btn-danger' type='button' id='nowCancel' onclick='closeReply()' style='padding:5px 10px;margin-left:5px;cursor: pointer;'><i class='fas fa-times'></i></button>");
						currentOpen=1;
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
									.append($('<i>').addClass('far fa-thumbs-up likediv').attr('id','like'+performanceComment.id))
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.likeCount))
									.append($('<i>').addClass('far fa-thumbs-down dislikediv').attr('id','dislike'+performanceComment.id))
									.append($('<span>').css({'margin-left':'10px'}).text(performanceComment.dislikeCount).attr('id','editButton'+performanceComment.id))
									.append($('<hr>'))
									))
				
				$('#forum'+performanceComment.refCommentId).append(commentSecondDiv);
					if(userDisplayName==performanceComment.userName){
						$('#editButton'+performanceComment.id).append($('<button>').addClass('btn  forumEdit').css({"background-color":"white","color":"red"}).text('編輯'));
					}
				}
				
				//套like,dislike
				$('#like'+performanceComment.id).click(function(){
					if(!userAccount) return false;
					var likeType;
					var likeId = $(this).attr('id').substring(4);
					//確認沒被點過
					if($(this).attr('class')=='far fa-thumbs-up likediv likedivclick'){
						$(this).removeClass('likedivclick');
						likeType=3;
					}else{			
						$(this).addClass('likedivclick');
						//dislike的class
						var dislikeStatus = $(event.target).next().next().attr('class');                 
						if(dislikeStatus=='far fa-thumbs-down dislikediv'){
							likeType = 1;						
						}else if(dislikeStatus=='far fa-thumbs-down dislikediv dislikedivclick'){
							$(event.target).next().next().remove('dislikedivclick');
							likeType = 2;
						}		
					}
					$.ajax({
						url:'/forum/likeButtonClick',
						type:'get',
						data:{'id':likeId,'likeType':likeType,'userName':userAccount},
						success:function(afterLike){
							reloadComments();
						}					
					})					
				})
				//dislike
				$('#dislike'+performanceComment.id).click(function(){
					if(!userAccount) return false;
					//確認沒被點過
					var dislikeType;
					var likeId = $(this).attr('id').substring(7);
					if($(this).attr('class')=='far fa-thumbs-down dislikediv dislikedivclick'){
						$(this).removeClass('dislikedivclick');
						dislikeType=3;
					}else{	
						$(this).addClass('dislikedivclick');
						//dislike的class
						var likeStatus = $(event.target).prev().prev().attr('class');						                 
						if(likeStatus=='far fa-thumbs-up likediv'){				
							dislikeType = 1;						
						}else if(likeStatus=='far fa-thumbs-up likediv likedivclick'){
							dislikeType = 2;
						}	
					}
					$.ajax({
						url:'/forum/dislikeButtonClick',
						type:'get',
						data:{'id':likeId,'dislikeType':dislikeType,'userName':userAccount},
						success:function(afterdisLike){
							reloadComments();
						}					
					})					
				})
				
			}) //each結束
				$('.forumEdit').click(function(event){	
					if(currentOpen==1)return false;
					originalComment = $(this).parent().parent().prev().children().children().text()
					var editCommentId = $(this).parent().parent().parent().attr('id').substring(5);
					
					$(this).parent().parent().prev().children().children().toggle();
					$(this).parent().parent().prev().children().append("<input class='forumEditInput' type='text' id='edit"+ editCommentId +"' value='"+ originalComment +"'><button type='button' class='btn-primary' onclick='sendEdit("+editCommentId+")'>送出</button><button type='button' class='btn-light' onclick='cancelEdit("+editCommentId+")'>取消</button><button type='button' class='btn-danger' onclick='deleteComment("+editCommentId+")'>刪除</button>")
					currentOpen=1;
				});	
			refreshLikeData();
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
		}	
	})
	
}

function cancelEdit(id){
	$(event.target).parent().children().show();
	$(event.target).parent().children()[1].remove();
	$(event.target).parent().children()[1].remove();
	$(event.target).parent().children()[1].remove();
	currentOpen=0;
}

function deleteComment(id){
	$.ajax({
		url:'/forum/deleteComment',
		type:'GET',
		data:{'id':id},
		success:function(){
			reloadComments();
		}
	})	
}


function closeReply(){
	$('#nowInput').remove();
	$('#nowSend').remove();
	$('#nowCancel').remove();
	currentOpen=0;
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
			$('#firstLayerComment').val("");
			reloadComments();
			}
		})

	}
	
	
	
})

