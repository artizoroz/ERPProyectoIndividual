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
<title>Spring forms :: Product</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<link href="src/main/webapp/resources/css/style.css" rel="stylesheet">
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
	
	<ul class="dropdown-menu" role="menu">
	<li><a href="?locale=en"><img src="blank.gif"
	       class="flag flag-gb"
	       alt="<s:message code="english"></s:message>" /> 
               <s:message code="english"></s:message></a>
        </li>
		<li><a href="?locale=es"><img src="blank.gif"
	       		class="flag flag-es"
	       		alt="<s:message code="spanish"></s:message>" /> 
        	       <s:message code="spanish"></s:message></a>
    	    </li>
	</ul>
	</div>
	</nav>
	
	<div class="container">
	<div class="jumbotron">
	<h1>New product</h1>
	</div>

	<c:url var="post_Product"  value="/products/new" />
	<sf:form method="post" modelAttribute="product" action="${post_product}">
		<div class="form-group">
			<label for="name" class="col-md-4 control-label">Name</label>
			<div class="col-md-4">
			<sf:input path="name" placeholder="Name" class="form-control input-md" />
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
			<sf:select path="productType.id" class="form-control">
				<sf:options items="${productType}" itemLabel="name" itemValue="id" />
			</sf:select></div>
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