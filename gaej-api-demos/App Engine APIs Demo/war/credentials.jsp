<%@page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@page import="com.google.appengine.api.users.UserService"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		UserService service = UserServiceFactory.getUserService();
	
		if (request.getUserPrincipal() == null) {
			out.print("No estas registrado!<br> por favor ingresa <a href=\""
					+ service.createLoginURL(request.getRequestURI())
					+ "\">Aquí</a>");
		} else {
			out.print("<h3>Bienvenido " + service.getCurrentUser() + "</h3><br>"
					+ "<a href=\""
					+ service.createLogoutURL(request.getRequestURI())
					+ "\">Salir</a>");
		}
	%>
	<br>
	<a href="/">Volver </a>
</body>
</html>