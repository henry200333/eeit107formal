<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<h1>List of Article</h1>
<form action="article/list" method="POST">
<div><input name="searchBox" type="text" ></div>
<input type="submit"><input type="reset">
</form>
<div>${models}</div>