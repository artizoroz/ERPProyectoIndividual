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
			<h1>Update productType</h1>
		</div>

		<s:url var="action" value="/productType/saveupdate" />
		<sf:form method="post" action="${action}" modelAttribute="productType">
			<sf:hidden path="id" />

			<div class="form-group">
				<label for="login" class="col-md-4 control-label">Name</label>
				<div class="col-md-4">
					<sf:input path="name" placeholder="Name"
						class="form-control input-md" />
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
			<p>&copy; 2015 Eugenia P�rez</p>
		</div>
	</div>

	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</body>
</html>
