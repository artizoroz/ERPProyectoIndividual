<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update.jsp</title>
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
	<h1>Update productType</h1>
	</div>
	
	<s:url var="action" value="/productType/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="productType">
		<sf:hidden path="id" />
		
		<div class="form-group">
			<label for="login" class="col-md-4 control-label">Name</label>
			<div class="col-md-4">
			<sf:input path="name" placeholder="Name" class="form-control input-md" />
			<sf:errors path="name" cssClass="error" />
			</div>
		</div>
		
		<div class="form-group">
		<div class="col-md-4">
		<sf:button class="btn btn-primary">Update</sf:button>
		</div>
		</div>
	</sf:form>
	</div>

	<div class="footer">
	<div class="container">
	<p>&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
