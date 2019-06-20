<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<!-- header -->
<jsp:include page="header.jsp"></jsp:include>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<jsp:include page="sidebar.jsp"></jsp:include>

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="topbar.jsp"></jsp:include>

				<!-- Begin Page Content -->
				<div class="container-fluid" >

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">List of Performance</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Performance</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of
								Performance</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive"
							style="font-family: 'Noto Sans TC', sans-serif;">
								

									<table class="table table-bordered table-striped table-hover"
									id="dataTable" width="100%" cellspacing="0">
								
								
								</table>
								<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
								<script>
								$.ajax({
									url : "/admin/performance/query",
									type : "GET",
									success : function(data) {
										showNames(data);
									}
								})
								</script>
							
							</div>
							<form id="send" method="post">
								<input type="hidden" id="sendid" name="id"/>
							</form>
							
						</div>
					</div>
					<a href="test"><button type="button" class="btn btn-primary btn-user btn-block">請點我試試看超酷網站?</button></a>
					<br>
					<button type="button" id="vdeo" class="btn btn-primary btn-user btn-block">點我預覽影片排版</button>
					<hr>
					<div id="wrapper"> 
					
  <input id="fileUpload" type="file" /><br />
  <div id="image-holder"> </div>
</div>
<script>
$("#fileUpload").on('change', function () {
	  if (typeof (FileReader) != "undefined") {
	    var image_holder = $("#image-holder");
	    image_holder.empty();
	    var reader = new FileReader();
	    reader.onload = function (e) {
	      $("<img />", {
	      "src": e.target.result,
	      "class": "thumb-image"
	      }).appendTo(image_holder);
	    }
	    image_holder.show();
	    reader.readAsDataURL($(this)[0].files[0]);
	  } else {
	    alert("This browser does not support FileReader.");
	  }
	});
</script>
				</div>
				<hr>
				<!-- /.container-fluid -->
				<div id="vd" class='form-group row' style="margin-left:10px;">
				
			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>
			
		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	<script>
	
		

		function showNames(data) {
			var txt1 = "<thead>";
			var txt2 = "<tbody>";
			var keys = Object.keys(data[0]);
			for(i in keys){
				txt1+="<th>"+keys[i] +"</th>";
				
			}
			
			$.each(data,function(index,value){
				
					txt2+="<tr>"
				for(i in value){
					txt2 += "<td>" + value[i] + "</td>";
					var id = value['id'];
				}
				txt2 += "<td><button type='button' id='"
					+ id
					+ "' href='' onclick='sendId(this);return false' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
				txt2 += "<td><button type='button' id='"
					+ id
					+ "' href='' onclick='deleId(this);return false' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i></button></td>";	
				txt2+="</tr>";
				
				
			})
			txt1+="<th>UPDATE</th><th>DELETE</th>";
			txt1+="</thead>";
			txt2+="</tbody>";
			$("#dataTable").append(txt1);
			$("#dataTable").append(txt2);
			$("body").append($("<script />", {
				  src: "/resources/vendor/datatables/jquery.dataTables.min.js"
				}))
			$("body").append($("<script />", {
				  src: "/resources/vendor/datatables/dataTables.bootstrap4.min.js"
				}))
			$("body").append($("<script />", {
				  src: "/resources/js/demo/datatables-demo.js"
				}))
		}
				

		function sendId(Object) {
			console.log("id=" + Object.id);
			$("#send").attr("action", "/admin/performance/edit");
			$("#sendid").val(Object.id);
			$('#send').submit();
		}
		function deleId(Object) {
			$("#send").attr("action", "/admin/performance/delete");
			$("#sendid").val(Object.id);
			$('#send').submit();
		}
		

		jQuery("#vdeo").click(function(){
			$.ajax({
				url:"/admin/performance/query",
				type:"GET",
				success: function(data){
					var txt="";	
					var txtname="";
					console.log(data);					
					//https://www.youtube.com/embed/Lhel0tzHE08
					//https://www.youtube.com/watch?v=Lhel0tzHE08
					$.each(data,function(index,value){
						var head=value['url'].substring(0,24);
						var back = value['url'].substring(32,43)
						console.log();
						
						txt+= "<div class='col-sm-3 mb-3 mb-sm-0'><iframe  src='"+ head+"embed/"+back +"' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe></div>"
						txtname+="<div class='col-sm-3 mb-3 mb-sm-0'><span>"+value['name']+"</span></div>"			
						});	
						
						
					$("#vd").html(txt);
					$("#vd").append(txtname);
				}
			});
		});
	</script>
	
</body>
</html>