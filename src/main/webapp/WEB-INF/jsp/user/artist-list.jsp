<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>藝人</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<!-- Load basic css of Grid -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/css/ui.jqgrid-bootstrap4.css" />
<!-- Load jquery-ui css -->
<link rel="stylesheet" type="text/css"
	href="/resources/jqgrid/jquery-ui/jquery-ui.theme.min.css" />
<!-- 	Add language package for TW-ZH -->
<script src="/resources/jqgrid/js/i18n/grid.locale-tw.js"
	type="text/javascript"></script>
<!-- 	Add jquery plugin -->
<script src="/resources/jqgrid/js/jquery.jqGrid.min.js"
	type="text/javascript"></script>
<body>
	<div class="bigdiv">
		<jsp:include page="../topbar.jsp"></jsp:include>
		<div class="container">
			<div class="row">
				<div class="col-6">
					<div class="input-group">
						<input id="search" name="search" type="text"
							class="form-control border-0 small" placeholder="搜尋街頭藝人..."
							aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append articleblock">
							<button id="searchBT" class="btn btn-secondary" type="button">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div id="artistList"></div>
			<script>
				$.ajax({
					url : "/artist-list",
					type : "GET",
					success : function(data) {
						var context="";
						$.each(data, function(index, value) {
							context += "<img src='" + value.photo +"'>"
						})
						$("#artistList").append(context)

					}
				});
			</script>

		</div>
	</div>

</body>
</html>