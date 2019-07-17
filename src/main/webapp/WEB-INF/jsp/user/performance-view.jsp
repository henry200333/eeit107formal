<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<body>
<jsp:include page="../topbar.jsp"></jsp:include>

 <div class="container">
 	<div class="col-8">
 	<iframe width="100%" height="400" id="main" style="margin-top:50px;"
						src="https://www.youtube.com/embed/${performance.url}?autoplay=1&modestbranding=1&rel=0" frameborder="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
	<h2>${performance.title}</h2>
	

</div>
 </div>

<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>

</body>
</html>