<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<title>名單</title>
</head>
<body>
<table class="table">
<%-- 	<div><p id="success">${xxx}</p></div> --%>

		<thead>
			<tr>
				<td>會員帳號</td>
				<td>會員名稱</td>
				<td>會員信箱</td>
				<td>註冊日期</td>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="row" items="${all}">			
				<tr name="${row.memberId}">
					<td><input type="text" value="${row.memberId}"></td>
					<td><input type="text" value="${row.memberName}"></td>
					<td><input type="text" value="${row.email}"></td>
					<td><input type="text" value="${row.registerDate}"></td>
					<td><select name="sel">
					<c:if test="${row.permission=='0'}">
						<option selected="selected" value="0">白名單</option>
						<option value="3">黑名單</option>
					</c:if>
					<c:if test="${row.permission=='3'}">
						<option value="0">白名單</option>
						<option selected="selected" value="3">黑名單</option>
					</c:if>
					
					</select></td>	
					<td><a name="black" href=""><input type="button" value="修改"></a></td>
				</tr>										
		</c:forEach>
		</tbody>
</table>
<script type="text/javascript">
	(function($){
		$('select[name="sel"]').change(function(){
			var aa=$(this).val();
			var memberId = $(this).parents("tr").attr("name");
			$(this).parents("tr").find('a[name="black"]').attr("href","manager.do?memberId="+memberId+"&black="+aa);
			console.log(aa);
			console.log(memberId);
		});
	}(jQuery));
	
</script>
<a href="${pageContext.request.contextPath}/index.jsp">首頁</a>
</body>
</html>