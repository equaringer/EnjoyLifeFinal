<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>好友名單</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<table class="table table-hover" style="margin: 10px;width: 500px">
	<thead>
	<tr>
		<td></td><th>好友列表</th><td></td>
<!-- 		<th>好友</th> -->
		
	</tr>
	</thead>
	<tbody>	
<!-- 		<tr><td></td><td>好友名單</td><tr> -->
		<c:forEach var="row" items="${selectFriend}">
			<c:if test="${row.FriendVO.unfriend==2}">
				<tr>
					<td width="50">
					<img src="${pageContext.request.contextPath}/GetImg?imgid=${row.Picture}" height="35" width="35"  onerror="this.style.display='none'">
					</td>
					<td><a name="${row.FriendVO.friendId}" data-toggle="modal" data-target=".bs-example-modal-sm">${row.FriendVO.friendId}</a>
					</td>
					<td><a href="${pageContext.request.contextPath}/friend/deleteFriend.do?id=${row.FriendVO.friendId}"/> <input type="button" class="btn btn-primary btn-xs" value="刪除好友"></a></td>
				</tr>
			</c:if>	
		</c:forEach>
		
		<tr><td></td><th>申請中好友</th><td></td></tr>
		<c:forEach var="row" items="${selectFriend}">
			<c:if test="${row.FriendVO.unfriend==0}">
				<tr>
					<td>
					<img src="${pageContext.request.contextPath}/GetImg?imgid=${row.Picture}" height="35" width="35"  onerror="this.style.display='none'">
					</td>
					<td style="color:#606060">${row.FriendVO.friendId}</td>
					<td><a href="${pageContext.request.contextPath}/friend/deleteFriend.do?id=${row.FriendVO.friendId}"/> <input type="button" class="btn btn-primary btn-xs" value="取消申請"></a></td>					
				</tr>
			</c:if>	
		</c:forEach>
		
		<tr><td></td><th>好友邀請確認</th><td></td></tr>
		<c:forEach var="row" items="${selectFriend}">
			<c:if test="${row.FriendVO.unfriend==1}">
				<tr>
					<td>
					<img src="${pageContext.request.contextPath}/GetImg?imgid=${row.Picture}" height="35" width="35" onerror="this.style.display='none'">
					</td>
					<td style="color:#009FCC">${row.FriendVO.friendId}</td>					
					<td><a href="${pageContext.request.contextPath}/friend/updateFriend.do?id=${row.FriendVO.friendId}"/> <input type="button" class="btn btn-primary btn-xs" value="確認"></a></td>
				</tr>
			</c:if>	
		</c:forEach>							
	</tbody>	
</table>
<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div id='no' ></div>
    </div>
  </div>
</div>
<script>
$('a[data-toggle="modal"]').click(function(){
	var aa=$(this).attr("name");	
	$('div[id="no"]').empty();	
// 	console.log(aa);
	$.getJSON("${pageContext.request.contextPath}/GetParnerJson",{"no":aa},function(data){
 		console.log(data);
 		if(data[0]){
 			$.each(data,function(){
 	 				var EventType=this.EventType;
 	 	 			var EventContent=this.EventContent;
 	 	 			var Addr=this.Addr;
 	 	 			var ImgNo=this.ImgNo;
 	 	 				$('div[id="no"]').append("<table style='border-style:inset;' class='table table-striped'><tr><td>找伴類型:"+EventType+"</td></tr>"+"<tr><td>內容:"+EventContent+"</td></tr>"+"<tr><td>照片:"+"<img src='${pageContext.request.contextPath}/GetImg?imgid="+ImgNo+"'height='150' width='200' style='display:block; margin:auto;'>"+"</td></tr>"+"<tr><td>地址:"+Addr+"</td></tr>"+"</table>");
 	 	 				
 	 		})
 		}		
 		else{
 			
 		$('div[id="no"]').append("<table class='table table-bordered'><tr><td>目前尚無找伴活動</td></tr></table>");
 		}
	});
	
})
</script>
<a href="${pageContext.request.contextPath}/friend/friend.jsp">好友首頁</a>
</body>
</html>