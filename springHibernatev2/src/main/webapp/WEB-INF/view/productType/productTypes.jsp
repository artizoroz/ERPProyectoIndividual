<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- No pueden convivir c & sgf? da error y no arranca -->
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
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
				title="Back to productType">Back to productType</a></li>
		<li><a href="<s:url value="/productTypes/" />" title="View productTypes">View productTypes</a></li>
		<li><a href="<s:url value="/productTypes/new" />" title="New productTypes">New productType</a></li>
		<li><a href="<s:url value="/products/new" />" title="New product">New product</a></li>
	</ul>
	
	<ul class="nav nav-tabs">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="true">Language <span class="caret"></span> </a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="?locale=en"><img src="blank.gif"
								class="flag flag-gb"
								alt="English" /> English</a></li>
						<li><a href="?locale=es"><img src="blank.gif"
								class="flag flag-es"
								alt="Spanish" /> Spanish</a></li>
					</ul></li>
			</ul>
	</div>
	</nav>

	<div class="container">
	<div class="jumbotron">
	<h1 class="">ProductTypes list</h1>
	<p>These are the productTypes currently in the system.</p>
	</div>

	<table class="table">
		<thead>
			<tr>
				<th>Name</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productTypes}" var="productType">
				<tr>
					<td>${productType.name}</td>
					<td><a href="<s:url value="/productTypes/${productType.id}" />"
						title="Detailed info"> see detail</a> || <a
						href="<c:url value="/productTypes/update/${productType.id}" />">update</a> || <a
						href="<c:url value="/productTypes/delete/${productType.id}" />">delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>

	<div class="footer">
	<div class="container">
	<p>&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>