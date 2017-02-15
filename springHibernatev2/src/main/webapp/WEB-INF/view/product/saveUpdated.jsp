<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ page session="false"%>
<html>
<head>
<title>SaveUpdate Product</title>
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
	<h1>Ok, ${product.id} product called ${product.name} was UPDATED</h1>
	</div>

	<div class="footer">
	<div class="container">
	<p>&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
