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
<body>
	<h2>Enviar Mensaje</h2>
	<form action="/sendmail">
		destinatario<input type="text" name="recipient" /><br> 
		Titulo<input type="text" name="title" /><br> 
		Mensaje<textarea name="message"></textarea>
		<br> <input type="submit"/><br>
	</form>
	<br>
	<%
		if(request.getAttribute("sent")!= null){
			out.print("Su mensaje fue enviado!");
		}
	%>
	<br>
	<a href="/">Volver </a>
</body>
</html>