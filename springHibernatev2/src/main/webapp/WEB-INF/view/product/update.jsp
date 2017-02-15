<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="sf"%>
<%@ page session="false"%>
<html>
<head>
<title>Update productType product</title>
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
	<h1>Update productType product</h1>
	</div>
	<s:url var="action" value="/products/saveupdate" />
	<sf:form method="post" action="${action}" modelAttribute="product">
		<sf:hidden path="id" />
		<sf:hidden path="productType.id" />
		
		<div class="form-group">
			<label for="name" class="col-md-4 control-label">Name</label>
			<div class="col-md-4">
			<sf:input path="name" placeholder="name" class="form-control input-md" />
			<sf:errors path="name" cssClass="error" />
			</div>
		</div>
			
		<div class="form-group">
			<label for="description" class="col-md-4 control-label">Description</label>
			<div class="col-md-4">
			<sf:input path="description" placeholder="Description" class="form-control input-md" />
			<sf:errors path="description" cssClass="error" />
			</div>
		</div>
			
		<div class="form-group">
			<label for="pvp" class="col-md-4 control-label">Pvp</label>
			<div class="col-md-4">
			<sf:input path="pvp" placeholder="Pvp" class="form-control input-md" />
			<sf:errors path="pvp" cssClass="error" />
			</div>
		</div>
			
		<div class="form-group">
			<label for="productType" class="col-md-4 control-label">Product Type</label>
			<div class="col-md-4">
			<sf:select path="productType.id">
				<sf:options items="${productType}" itemLabel="name" itemValue="id" />
			</sf:select>
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
	<p class="text-muted">&copy; 2015 Eugenia Pérez</p>
	</div>
	</div>
	
	<script	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
