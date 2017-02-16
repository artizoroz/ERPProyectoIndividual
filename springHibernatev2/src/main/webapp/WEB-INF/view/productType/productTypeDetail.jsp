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
			<h1>ProductTypes detail</h1>
			<p>See this productType info</p>
		</div>

		<c:choose>
			<c:when test="${not empty productTypes}">
				<c:url var="post_productType" value="/productTypes/new" />
				<sf:form method="post" modelAttribute="productType"
					action="${post_productType}">
					<table class="table">
						<thead>
							<tr>
								<th>Id</th>
								<th>Name</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${productTypes.id}</td>
								<td>${productTypes.name}</td>
							</tr>
						</tbody>
					</table>

					<h1>Products:</h1>
					<table class="table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Description</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${products}" var="product">
								<tr>
									<td>${product.name}</td>
									<td>${product.description}</td>
									<td><a href="<s:url value="/products/${product.id}" />"
										title="Detailed info"> see detail</a> || <a
										href="<c:url value="/products/update/${product.id}" />">update</a>
										|| <a href="<c:url value="/products/delete/${product.id}" />">delete</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</sf:form>
			</c:when>
			<c:otherwise>
				<div>A user with the id specified has not been found. Please,
					try again</div>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="footer">
		<div class="container">
			<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
		</div>
	</div>

	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>