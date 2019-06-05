<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span>Copyright &copy; Jayee APP 2019</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="/resources/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="/resources/js/demo/datatables-demo.js"></script>

<script>
	$(document).ready(function() {
		var url = $(location).attr('href');
		if (url.match('artist') != null) {
			$("#navArtist").addClass("active");
		} else if (url.match('activity') != null) {
			$("#navActivity").addClass("active");
		} else if (url.match('performance') != null) {
			$("#navPerformance").addClass("active");
		} else if (url.match('vender') != null) {
			$("#navVender").addClass("active");
		} else if (url.match('article') != null) {
			$("#navArticle").addClass("active");
		} else if (url.match('forum') != null) {
			$("#navForum").addClass("active");
		}
	})
</script>