<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Spring forms :: ProductTypes</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
	<ul class="nav nav-tabs">
			<li><a href="<s:url value="/productTypes/${product.productType.id}" />" 
				title="Back to user">Back to productType</a></li>
		<li><a href="<s:url value="/productTypes/" />" title="View productTypes">View
				productTypes</a></li>
		<li><a href="<s:url value="/productTypes/new" />" title="New productTypes">New
				productType</a></li>
		<li><a href="<s:url value="/products/new" />" title="New product">New
				product</a></li>
	</ul>
	</div>
	</nav>
	
	<div class="container">
	<div class="jumbotron">
	<h1>New productType</h1>
	</div>

	<c:url var="post_productType"  value="/productTypes/new" />
	<sf:form method="post" modelAttribute="productType" action="${post_productType}">
		<div class="form-group">
			<label for="login" class="col-md-4 control-label">Name</label>
			<div class="col-md-4">
				<sf:input path="name" placeholder="Name" class="form-control input-md" />
				<sf:errors path="name" cssClass="error" />
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-md-4">
				<sf:button class="btn btn-primary">Create</sf:button>
			</div>
		</div>

	</sf:form>
	</div>

	<div class="footer">
	<div class="container">
	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>