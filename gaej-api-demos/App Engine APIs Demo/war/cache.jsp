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
	<h2>Boletin de mensajes</h2>
	<form action="/cachesave">
		<h3>Mensaje Nuevo:</h3>
		Autor<input type="text" name="author" /><br> Mensaje
		<textarea name="message"></textarea>
		<br> <input type="submit"><br>
	</form>
	<br>
	<%
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();

		List<String> authors;
		if (cache.get("authors") == null) {
			authors = new LinkedList();
		} else {
			authors = (List<String>) cache.get("authors");
		}

		for (String author : authors) {
			out.print(author + " - " + cache.get(author)
					+ " <a href=\"/deletecache?author=" + author
					+ " \">Eliminar</a><br>");
		}
	%>
	<br>
	<a href="/">Volver </a>
</body>
</html>