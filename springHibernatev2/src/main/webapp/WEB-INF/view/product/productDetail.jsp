<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
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
<title>Spring forms :: ProductType Product details</title>
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
	<h1>ProductType product detail</h1>
	<p>See this product info</p>
	</div>

	<c:choose>
		<c:when test="${not empty product}">
			<table class="table">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Description</th>
						<th>Pvp</th>
						<th>ProductType</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${product.id}</td>
						<td>${product.name}</td>
						<td>${product.description}</td>
						<td>${product.pvp}</td>
						<td>${product.productType.name}</td>
					</tr>
				</tbody>
			</table>
		
			
		</c:when>
		<c:otherwise>
			<div>A product with the id specified has not been found. Please,
				try again</div>
		</c:otherwise>
	</c:choose>
	</div>

	<div class="footer">
	<div class="container">
	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>