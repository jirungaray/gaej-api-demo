<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page
	import="com.google.appengine.api.memcache.MemcacheServiceFactory"%>
<%@page import="com.google.appengine.api.memcache.MemcacheService"%>
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
<h2>Contar pelos</h2>
<form action="/queueTask">
	Su Nombre:<input name="nameField" type="text" /> <br> Su Email:<input
		name="mailField" type="text" /> <br> Cantidad de veces: <input
		name="amountField" type="text" /> <br>
	<button type="submit">Contar!</button>

</form>
<%
	if (request.getAttribute("sent") != null) {
		out.print("<center>				<h2>Su Consulta esta siendo procesada y le notificaremos por correo en cuanto				este completa</h2> 		</center>");
	}
%>
<br>
<a href="/">Volver </a>
</body>
</html>