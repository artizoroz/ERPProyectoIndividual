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
<link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container">
			<ul class="nav nav-tabs">
				<li><a
					href="<s:url value="/productTypes/${product.productType.id}" />"
					title="Back to productType"><s:message code="backProductType"></s:message></a></li>
				<li><a href="<s:url value="/productTypes/" />"
					title="View productTypes"><s:message code="productTypes"></s:message></a></li>
				<li><a href="<s:url value="/productTypes/new" />"
					title="New productTypes"><s:message code="newProductType"></s:message></a></li>
				<li><a href="<s:url value="/products/new" />"
					title="New product"><s:message code="newProduct"></s:message></a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="true"><s:message code="language"></s:message>
						<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="?locale=en"><img src="blank.gif"
								class="flag flag-gb" alt="English" /> <s:message code="english"></s:message></a></li>
						<li><a href="?locale=es"><img src="blank.gif"
								class="flag flag-es" alt="Spanish" /> <s:message code="spanish"></s:message></a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="jumbotron">
			<h1>
				<s:message code="productCreated"></s:message>
			</h1>
		</div>
		<div class="alert alert-success" role="alert">
			<s:message code="productCreatedSuccessfully"></s:message>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th><s:message code="name"></s:message></th>
					<th><s:message code="description"></s:message></th>
					<th><s:message code="productType"></s:message></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${product.id}</td>
					<td>${product.name}</td>
					<td>${product.description}</td>
					<td>${product.productType.name}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<footer class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</footer>

	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>