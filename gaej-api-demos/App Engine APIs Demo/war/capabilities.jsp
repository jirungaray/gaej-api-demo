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

<center>
		<h2>Estado de los servicios:</h2>
		Images API:<%
			if ((Boolean) request.getAttribute("imagesWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
		Datastore read:<%
			if ((Boolean) request.getAttribute("dataReadWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
		Datastore write:<%
			if ((Boolean) request.getAttribute("dataWriteWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
		Mail API:<%
			if ((Boolean) request.getAttribute("mailWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
		XMPP API:<%
			if ((Boolean) request.getAttribute("xmppWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
		Task Queues API:<%
			if ((Boolean) request.getAttribute("queuesWork")) {
				out.append("<span style='color: green;'>OK</span>");
			} else {
				out.append("<span style='color: red;'>ERROR</span>");
			}
		%><br>
	</center>


<br>
<a href="/">Volver </a>
</body>
</html>