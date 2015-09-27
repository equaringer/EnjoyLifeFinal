<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ENJOY LIFE</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="/includes/link" %>
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/skel-noscript.css' type="text/css" />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style-desktop.css' type="text/css" />
	<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
</head>
<sql:setDataSource dataSource="jdbc/activity" var="activity" scope="application"/>
  <sql:query var="us" dataSource="${activity}">
  			Select * from activity  
  			where activityNo = 1
  </sql:query>
<body class="homepageview">
		<!-- Header -->
<%@include file="/includes/nav" %>	
		<!-- Main -->
		<div id="main">
			<div class="container">
				<div class="row" id="row-view"> 
					<!-- SidebarLeft -->
					<%@include file="/includes/sidebarleft" %>
					
					<!-- Content -->
					<c:forEach var="row" items="${us.rows}" varStatus="status">
					<div class="9u skel-cell-important">
						<h2 style="font-size:30px">${row.activityName}</h2>
						<div id="viewimg">		
							<a><img src="${pageContext.request.contextPath}/${row.photoPath}" alt="" /></a>
							<table id="viewtable">
								<tr>
									<th>時間:</th><td>${row.activityDate}</td>
								</tr>
								<tr>
									<th>地點:</th><td>${row.activityLocation}</td>
								</tr>
								<tr>
									<th>電話:</th><td>${row.activityContact}</td>
								</tr>
							</table>
						</div>
					</div>
					<div id="content" class="6u skel-cell-important">
						<section>
							<p>${row.activityContent}</p>
							
						</section>
					</div>
					</c:forEach>
					
					<!-- SidebarRight -->
					<%@include file="/includes/sidebarright" %>
				</div>
			</div>
		</div>
		
		<!-- Footer -->
		


		<!-- Footer -->

		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
		<%@include file="/includes/login" %>
	</body>
</html>