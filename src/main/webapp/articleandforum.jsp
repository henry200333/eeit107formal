<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" media="screen" href="/resources/jqgrid/css/ui.jqgrid.css" />


<script src="/resources/jqgrid/js/jquery-1.11.0.min.js"></script>


<script src="/resources/jqgrid/jquery-ui/jquery-ui.min.js"></script>

<script src="/resources/jqgrid/js/jquery.jqGrid.min.js"></script>

<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js "></script>
</head>
<body>

<table id="listTable"></table>

<div id='pager'></div>

<p>123</p>

<script>
$(document).ready(function(){   //當一開始開啟文件ready之後就會直接執行
	console.log("enter");

	$("#listTable").jqGrid({       //這行表示在 #listTable這個id的物件中會執行加入jQuery rid的物件

	url: '/admin/forum/grid', //這行url:的用意是在指定需要自那個url中撈出資料。可支援的資料有xml、json格式。

	datatype: 'json', //設定json為接收資料的格式，接收格式資料會在文章後說明

	mtype: 'GET', //設定取用資料方式為GET (也可用POST)

	colNames:['id','board','ref_id','ref_comment_id','user_name','comment','comment_date','like_count','dislike_count'], //設定欄位要顯示的標題名稱

	colModel :[ //從這邊開始要設定的就是跟欄位本身有關係的設定了.....

	{name:'id', index:'id', sortable: false}, //設定第一個欄位為id，並且index設成id為到時候ajax回server side連結時使用的parameter。並且設定為不可做排序。
	{name:'board', index:'board', width: 120},
	{name:'refId', index:'refId', width: 120},	
	{name:'refCommentId', index:'refCommentId', width: 120},
	{name:'userName', index:'userName', width: 120},
	{name:'comment', index:'comment', width: 120},
	{name:'commentDate', index:'commentDate', width: 120},
	{name:'likeCount', index:'likeCount', width: 120}, //設定第二個欄位為name，並且設定寬度為120px。寬度沒設定的話，預設為150(值會再經jqGrid再運算過)<a href="http://www.trirand.com/jqgridwiki/doku.php?id=wiki:colmodel_options" target="_blank"> colModel屬性說明</a>
	{name:'dislikeCount', index:'dislikeCount', align:'right'} //設定url欄位，這邊是故意設定靠右對齊
	],

	 

	      //注意：colNames和colModel的陣列大小要長的一樣，因為這是一對一欄位的設定。如果不一樣的話，在網頁載入時會出現javascript訊息告知你有問題後，jqGrid是沒有辦法呈現的。

	      pager: '#pager', //設定分頁的位置是出現在id為pager的地方。就是在html中的&lt;div&gt;&lt;/div&gt;

	      rowNum: 3,  //設定一開始單頁的筆數，這個欄位值不設定時，預設為一頁20筆。

	      rowList:[5,10,20], //設定下拉設定一頁顯示筆數，設定採陣列方式，預設空陣列時，畫面上不會出現可設定的下拉選單。

	      sortname: 'id', //可以設定一開始載入資料時要使用那個欄位來排序，server-side部分要記得接受名稱為「sortname」的變數名稱來處理

	      sortorder: 'asc', //可以設定一開始載入資料時要使用那種排序方式，server-side部分要記得接受變數名稱為「sortorder」的值來處理。

	      caption: '===============Grid', //設定table的標題名稱，如果不設定的話，則不會出現table title的部分。

	      jsonReader : { //此段為設定讀取json的時候該讀那個index

	      root: "rows", //設定資料欄位陣列是放置在rows這個index之中。

	      page: "page", //設定目前是第幾頁

	      total: "total", //設定總共有幾頁

	      cell: "cell", //設定標示每列資料是放在一個叫cell的index之中。有試過是否可以不設，但是發現資料會顯示不出來。

	      }

	   } ).navGrid('#pager',{view:true, del:false, edit: false}) //navGrid在這邊的設定是有關於分頁上一些功能導覽的部分。目前範例裡的設定只有設定有顯示，但是不要出現刪除、編輯這二個功能。所以畫面上會出現搜尋以及顯示整筆資料的功能....

	});
console.log("out");
	</script>



</body>
</html>