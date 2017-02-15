<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>Product Deleted</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
	<ul class="nav nav-tabs">
			<li><a href="<s:url value="/productTypes/${product.productType.id}" />" 
				title="Back to user"><s:message code="navbar.backProductType"></s:message></a></li>
		<li><a href="<s:url value="/productTypes/" />" title="View productTypes"><s:message code="navbar.productTypes"></s:message></a></li>
		<li><a href="<s:url value="/productTypes/new" />" title="New productTypes"><s:message code="navbar.newProductType"></s:message></a></li>
		<li><a href="<s:url value="/products/new" />" title="New product"><s:message code="navbar.newProduct"></s:message></a></li>
	</ul>
	</div>
	</nav>
	
	<div class="container">
	<div class="jumbotron">
	<h1>Ok, ${product.id} product was deleted</h1>
	</div>
	</div>
	
	<div class="footer">
	<div class="container">
	<p>&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
