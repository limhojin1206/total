<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><t:getAsString name="title"/></title>
<!-- JQUERY -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container">
	<header>
		<t:insertAttribute name="header"/>
	</header>
	<nav class="navbar navbar-inverse">
		<t:insertAttribute name="nav"/>
	</nav>
	<section style="min-height: 70%">
		<t:insertAttribute name="section"/>
	</section>
	<footer>
		<t:insertAttribute name="footer"/>
	</footer>
	</div>
</body>
</html>

