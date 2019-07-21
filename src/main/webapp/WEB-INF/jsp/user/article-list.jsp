<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/css/ui.jqgrid-bootstrap4.css" />
<!-- Load jquery-ui css -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/jquery-ui/jquery-ui.theme.min.css" />
<body>
	<jsp:include page="../topbar.jsp"></jsp:include>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<div class="input-group">
					<input id="search" name="search" type="text"
						class="form-control border-0 small" placeholder="搜尋文章標題..."
						aria-label="Search" aria-describedby="basic-addon2">
					<div class="input-group-append articleblock">
						<button id="searchBT" class="btn btn-secondary" type="button">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="col-1">
				<div class="input-group-append">
					<button id="allBT" type="button" class="btn btn-success">全部文章</button>
					<button id="artistBT" type="button" class="btn btn-light">藝人文章</button>
					<button id="activityBT" type="button" class="btn btn-light">活動文章</button>
					<button id="performanceBT" type="button" class="btn btn-light">表演文章</button>
					<button id="venderBT" type="button" class="btn btn-light">廠商文章</button>
					<button id="otherBT" type="button" class="btn btn-light">系統公告</button>
				</div>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-9">
				<div id="articleList" style="text-align: center;">
					<div id="topPager"></div>
					<table id="articleGrid"></table>
					<div id="pager"></div>
				</div>
				<hr>
			</div>
			<div class="col-3">
				<span
					style="font-size: 30px; border-bottom: 3px solid black; font-weight: bold"><i
					class="fas fa-star"></i>熱門文章</span>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg1" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;">
						<p id="articleTop1"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 1750<i id="articleView1"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg2" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;">
						<p id="articleTop2"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 315<i id="articleView2"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg3" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;">
						<p id="articleTop3"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 189<i id="articleView3"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg4" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;"
						style="margin-top:10px;">
						<p id="articleTop4"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 115<i id="articleView4"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg5" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;">
						<p id="articleTop5"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 1<i id="articleView5"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<div class="row articleblock"
					style="height: 120px; cursor: pointer;"
					onclick="goToArticle(this);">
					<div id="articleImg6" class="col-4"></div>
					<div class="col-8" style="margin-top: 10px; position: relative;">
						<p id="articleTop6"
							style="font-size: 19px; position: absolute; top: 5px"></p>
						<span style="font-size: 14px; position: absolute; bottom: 10px;"><i
							class="far fa-comment-dots"></i> 125<i id="articleView6"
							class="fas fa-eye" style="margin-left: 15px;"></i></span>
					</div>
				</div>
				<hr>
			</div>
		</div>
	</div>
	<jsp:include page="../chat.jsp"></jsp:include>
	<footer>
		<div style="background-color: black; text-align: center">
			<div class="container">
				<div class="row">
					<div class="col-4" style="margin-top: 20px">
						<span
							style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">訂閱街藝</span>
						<br> <br> <input type="email" size="26"
							placeholder="Email@" style="line-height: 30px;">
						<button type="button" class="btn btn-danger">訂閱</button>
					</div>
					<div class="col-4" style="margin-top: 20px">
						<span
							style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最新消息</span>
						<div class="row"
							style="border-bottom: 1px solid white; padding: 20px 0px;">
							<div class="col-4" style="text-align: right">
								<img src="/resources/user-bootstrap/img/index/artist2.gif"
									width="80%" style="border-radius: 15px;"> <br>
							</div>
							<div class="col-8" style="text-align: left">
								<a href="" class="btn btn-primary" style="font-size: 10px;">藝人</a>
								<br> <br> <span style="color: white">藝人標題</span> <br>
							</div>
						</div>
						<div class="row"
							style="border-bottom: 1px solid white; padding: 20px 0px;">
							<div class="col-4" style="text-align: right">
								<img src="/resources/user-bootstrap/img/index/artist3.jpg"
									width="80%" style="border-radius: 15px;"> <br>
							</div>
							<div class="col-8" style="text-align: left">
								<a href="" class="btn btn-danger" style="font-size: 10px;">文章</a>
								<br> <br> <span style="color: white">文章標題</span> <br>
							</div>
						</div>
						<div class="row" style="padding: 20px 0px;">
							<div class="col-4" style="text-align: right">
								<img src="/resources/user-bootstrap/img/index/artist6.jpg"
									width="80%" style="border-radius: 15px;"> <br>
							</div>
							<div class="col-8" style="text-align: left">
								<a href="" class="btn btn-success" style="font-size: 10px;">表演</a>
								<br> <br> <span style="color: white">表演標題</span> <br>
							</div>
						</div>
					</div>
					<div class="col-4" style="margin-top: 20px">
						<span
							style="color: white; font-size: 20px; border-bottom: 2px solid white; padding: 0px 50px;">最近瀏覽</span>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

</body>
<!-- 	Add language package for TW-ZH -->
<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js"
	type="text/javascript"></script>
<!-- 	Add jquery plugin -->
<script src="/resources/jqgrid/js/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<script type="text/javascript">
$("#articleGrid").jqGrid({
    url: '/article/query',
    datatype: 'json',
    mtype: 'GET',
    styleUI : 'Bootstrap4',
    iconSet : "fontAwesome",
    colModel: [
		{ name: 'articleType', label: '文章類型', width: 25, align: 'center', sortable: false, formatter: articleTypeTW},
		{ name: 'name', label: '文章標題', sortable: false, formatter: articleTitle},
		{ name: 'count', label: '人氣', width: 25, align: 'center' },
		{ name: 'announce', label: '發布時間', width: 55 }
	],
    prmNames: {search: null, nd: null},
    toppager: '#topPager',
    pager: '#pager',
    page: 1,
    autowidth: false,
    shrinkToFit: true,
    height: 'auto',
    rowNum: 20,
    rowList: [20, 50],
    sortname: 'announce',
    sortorder: "desc",
    viewrecords: true,
    loadComplete: function () {
        reSizejqGridWidth();
    }
});
// articleType 格式中文化
function articleTypeTW(cellvalue, options, rowObject){
	switch(cellvalue){
	case 'Artist':
		return "藝人";
		break;
	case 'Activity':
		return "活動";
		break;
	case 'Performance':
		return "表演";
		break;
	case 'Vender':
		return "廠商";
		break;
	case 'Other':
		return "系統";
		break;
	}
}
//articleTitle加入超連結
function articleTitle(cellvalue, options, rowObject){
	return '<a href="/article/' + rowObject.id + '">' + cellvalue + '</a>';
}
//獲取articleTop6並放入對應的DIV及IMG
$.ajax({
	url:"/articleTop6",
	type:"GET",
	success: function(res){
		if(res.type == "SUCCESS"){
			var data = res.data;
			var articleTop = "#articleTop";
			var articleImg = "#articleImg";
			var articleView = "#articleView";
			for(var i = 0; i < data.length; i++){
				var content = data[i].content;
				$(articleTop + (i + 1)).append(data[i].name); //加入文章名稱
				$(articleView + (i + 1)).after(" " + data[i].count); //加入文章觀看次數
				$(articleTop + (i + 1)).parent().parent().attr('id', 'article' + data[i].id); //修改div的id為文章id
				var start = content.indexOf('](http');
				var end = content.indexOf('.jpg');
				var endpng = content.indexOf('.png');
				var endgif = content.indexOf('.gif');
				if(end != -1 && endpng != -1){
					if(end > endpng){
						end = endpng;
					}
				}else if(end == -1 && endpng != -1){
					end = endpng;
				}
				if(end != -1 && endgif != -1){
					if(end > endgif){
						end = endgif;
					}
				}else if(end == -1 && endgif != -1){
					end = endgif;
				}
				if(start != -1 && end != -1){
					var url = content.substring(start + 2, end + 4);
					$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('" + url + "'); background-size: cover; background-position: center;");
				} else {
					$(articleImg + (i + 1)).attr('style', "margin-top: 12px; padding-left: 15px; padding-right: 15px; border-radius: 15px; background-image:url('/resources/user-bootstrap/img/index/article.jpg'); background-size: cover; background-position: center;");
				}
			}
		}
	}
});
//前往指定id的article頁面開始
function goToArticle(obj){
	$(location).attr('href', '/article/' + obj.id.substring(7));
};
//前往指定id的article頁面結束
// 頂端文章分類搜尋按鈕
var articleType = "";
$("#allBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#artistBT").attr("class", "btn btn-light");
	$("#activityBT").attr("class", "btn btn-light");
	$("#performanceBT").attr("class", "btn btn-light");
	$("#venderBT").attr("class", "btn btn-light");
	$("#otherBT").attr("class", "btn btn-light");
	articleType = "";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#artistBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#allBT").attr("class", "btn btn-light");
	$("#activityBT").attr("class", "btn btn-light");
	$("#performanceBT").attr("class", "btn btn-light");
	$("#venderBT").attr("class", "btn btn-light");
	$("#otherBT").attr("class", "btn btn-light");
	articleType = "Artist";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#activityBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#artistBT").attr("class", "btn btn-light");
	$("#allBT").attr("class", "btn btn-light");
	$("#performanceBT").attr("class", "btn btn-light");
	$("#venderBT").attr("class", "btn btn-light");
	$("#otherBT").attr("class", "btn btn-light");
	articleType = "Activity";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#performanceBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#artistBT").attr("class", "btn btn-light");
	$("#activityBT").attr("class", "btn btn-light");
	$("#allBT").attr("class", "btn btn-light");
	$("#venderBT").attr("class", "btn btn-light");
	$("#otherBT").attr("class", "btn btn-light");
	articleType = "Performance";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#venderBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#artistBT").attr("class", "btn btn-light");
	$("#activityBT").attr("class", "btn btn-light");
	$("#performanceBT").attr("class", "btn btn-light");
	$("#allBT").attr("class", "btn btn-light");
	$("#otherBT").attr("class", "btn btn-light");
	articleType = "Vender";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#otherBT").click(function(){
	$(this).attr("class", "btn btn-success");
	$("#artistBT").attr("class", "btn btn-light");
	$("#activityBT").attr("class", "btn btn-light");
	$("#performanceBT").attr("class", "btn btn-light");
	$("#venderBT").attr("class", "btn btn-light");
	$("#allBT").attr("class", "btn btn-light");
	articleType = "Other";
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
$("#searchBT").click(function(){
	$('#articleGrid').jqGrid("clearGridData");
	$('#articleGrid').jqGrid('setGridParam',{url: '/article/query?name=' + $('#search').val() + '&type=' + articleType}).trigger("reloadGrid");
});
// 頂端文章分類搜尋按鈕
<!-- 響應式網頁測試  158~160行增加loadComplete參數    149行autowidth改false 再加入以下code-->
const grid_selector = "#articleGrid"; 
const $grid = jQuery(grid_selector);
// $(grid_selector).closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
    function reSizejqGridWidth()
    { 
        //重新抓jqGrid容器的新width
        let newWidth = $grid.closest(".ui-jqgrid").parent().width();
        //是否縮齊column(相當於shrinkToFit)
        let shrinkToFit = true;
        $grid.jqGrid("setGridWidth", newWidth, shrinkToFit);
    };
    $(window).on("resize", reSizejqGridWidth);
<!-- 響應式網頁測試 -->
</script>
</html>