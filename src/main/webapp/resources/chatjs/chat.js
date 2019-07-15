$(function(){
	let userBean;
	//抓取登入帳號
	var userAccount = "admin";
	//確認帳號有值
	if(userAccount){
		//抓userBean
		$.ajax(function(){
			url:'/user/findUserBean/'+userAccount,
			type:'get',
			success:function(data){
				userBean = data;
				//抓朋友清單
				var friendList;
				if(userBean.friends){
					friendList = userBean.friends;
				}
				
				$.each(friendList,function(index,friendBean){
					//拿到朋友userBean的情況下
					
				})
			}
		})			
	})
}