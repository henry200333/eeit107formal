<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">

	<div class="collapse navbar-collapse" id="navbarTogglerDemo01"
		style="text-align: center">
		<a class="navbar-brand" href="#"
			style="margin: auto; font-size: 15px;">© 2019 Copyright Jayee.com</a>
	</div>
	<script >
	 $.fn.serializeObject = function() {
	        var o = {};
	        var a = this.serializeArray();
	        $.each(a, function() {
	            if (o[this.name]) {
	                if (!o[this.name].push) {
	                    o[this.name] = [o[this.name]];
	                }
	                o[this.name].push(this.value || '');
	            } else {
	                o[this.name] = this.value || '';
	            }
	        });
	        return JSON.stringify(o);
	    };
	</script>
	
</nav>