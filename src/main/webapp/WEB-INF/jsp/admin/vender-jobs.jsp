<%@page import="org.springframework.web.servlet.ModelAndView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<%-- <jsp:include page="sidebar.jsp"></jsp:include> --%>


<body>

<table class="table table-bordered table-striped table-hover"
					id="dataTable" width="100%" cellspacing="0">

					<tbody id="tbody"></tbody>
				</table>









<jsp:include page="footer.jsp"></jsp:include>

<script>
function   aa(){
alert("${venderparam}");
$.ajax({url : "/admin/job/findjobs/?id=${venderparam.id}",
			type : "POST",
			success : function(data) {

				var txt = "";
				$.each(data,function(key, obj) {
// 									alert(obj)
									txt += "<tr>";
									for (i in obj) {
									txt += "<td>" + obj[i] + "</td>";
									};
// 									txt += '<td><button  href="${path}" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></button></td>';
// 									txt += '<td><button id='
// 											+ obj["id"]
// 											+ ' class="btn btn-danger btn-sm" onclick="deleteId(this)"><i class="fas fa-trash"></i></button></td>';
									txt += "</tr>";
								})

				$("#tbody").append(txt);

			}
		})
}


aa();
</script>

</body>
	
</html>