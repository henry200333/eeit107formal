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
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">List of Artist</h1>
						<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Download Data</a>
					</div>

					<!-- Add New Article Button -->
					<a href="add" class="btn btn-primary btn-icon-split"> <span
						class="icon text-white-50"> <i class="fas fa-file-medical"></i>
					</span> <span class="text">Add New Artist</span>
					</a>

					<hr>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">List of Artist</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">								
								<table class="table table-bordered table-striped table-hover"
									id="dataTable" style="width: 100%; cellspacing: 0">
								</table>
							</div>
						</div>
					</div>
					<form method="post" action="/admin/artist/uploadImage" enctype="multipart/form-data">
					<input type="file" name="imageFile" id="imageFile" accept="image/gif, image/jpeg, image/png" />
					<div id="previewDiv"></div>
					<input type="submit" value="Upload" />
					</form>
				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<jsp:include page="footer.jsp"></jsp:include>

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->
	<script>
		$(document).ready(function() {
			$.ajax({
				url : "query",
				type : "GET",
				success : function(data) {
					table = "<thead><tr>";
					column = Object.keys(data[0]);
					for (i in column)
						table += "<th>" +  column[i] + "</th>";
					table += "<th>edit</th><th>delete</th></tr><thead>";
					table += "<tbody>";
					$.each(data,function(key, value) {
						table += "<tr>";
						for (i in value) {
							table += "<td>"+ value[i]+ "</td>";
							id = Object.values(value)[0];}
						table += "<td><button id='"+ id+ "' type='button' onclick='edit(this)' class='btn btn-primary btn-sm'><i class='fas fa-edit'></i></button></td>";
						table += "<td><button id='"+ id+ "' type='button' onclick='dele(this)' class='btn btn-danger btn-sm'><i class='fas fa-trash'></i></button></td>";
						table += "</tr>"
						})
						table += "</tbody>"
						$("#dataTable").append(table);
						tableRefresh();
						}
					});
			});
		function edit(Object) {
			$(location).attr('href', '/admin/artist/edit?id=' + Object.id);
		}
		function dele(Object) {
			var r = confirm("是否刪除" + Object.id + "號Artist");
			if (r == true) {
				$
						.ajax({
							url : "delete",
							type : "DELETE",
							contentType : 'application/json;charset=UTF-8',
							dataType : 'json',
							data : '{"id":"' + Object.id + '"}',
							success : function(response) {
								if (response.type == 'SUCCESS') {
									alert("已刪除了一筆ID為：" + response.data.id
											+ "的Artist！");
									$(location).attr('href',
											'/admin/artist/list');
								} else {
									alert("資料刪除失敗！請重新搜尋清單確保資料為最新！");
								}
							},
							error : function(respH) {
								alert("資料刪除失敗！請檢查伺服器連線！");
							}
						})
			}
		}
		$("#imageFile").change(function(){
			$("#previewDiv").html("<img id='PreviewPic' src='#' style='width:180px;height:180px' />");
			readURL(this);
			});
		
		function readURL(input){
			  if(input.files && input.files[0]){
			    var reader = new FileReader();
			    reader.onload = function (e) {
			       $("#PreviewPic").attr('src', e.target.result);
			    }
			    reader.readAsDataURL(input.files[0]);
			  }
			}
	</script>
</body>
</html>