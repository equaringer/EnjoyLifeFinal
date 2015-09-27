<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta http-equiv="Refresh" content="10"> -->

<title>找伴列表</title>

<link rel="stylesheet" href="css/demo.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/filter.css">

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" type="text/css" />


<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel='stylesheet' href='css/skel-noscript.css' type="text/css" />
<link rel='stylesheet' href='css/style.css' type="text/css" />
<link rel='stylesheet' href='css/style-desktop.css' type="text/css" />
<link rel='stylesheet' href='css/bootstrap-theme.css' type="text/css" />
<link rel='stylesheet' href='css/bootstrap.css' type="text/css" />

<style type="text/css">
#contentp {
	padding: 2px 0;
	width: 200px;
	font-size: 1em;
}

#plocation {
 display: inline;
}

#alocation > img{
 
 margin-right:0px;
}

#locationdiv {
	display: inline;
}
.post_meta{
 	    position:none;
}

#up{
	display: inline;
}
.navbar-inverse{
	height:50px;
}

body{
		padding-top:90px;
	}
</style>

</head>
<body class="homepage">
<%String aa=pageContext.getRequest().getParameter("inputAdd");
  	pageContext.getRequest().setAttribute("inputAdd", aa);
  %>
<nav class="navbar-fixed-top" style="height:90px">
	<nav id="nav">
		<ul>
			<li><a href="#">會員</a></li>
			<li><a href="#">規劃</a></li>
			<li><a href="#">日誌</a></li>
			<li><a href="#">找伴</a></li>
			<li><a href="#">活動資訊</a></li>
			<li><a href="#">註冊</a></li>
			<li><a id="#">登入</a></li>
		</ul>
	</nav>
		<nav class="navbar navbar-inverse" role="navigation">
			<div>
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<a class="navbar-brand" href="#">Reset filters</a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav" >
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							 role="button" aria-expanded="false">購物
								<span class="caret"></span>
						</a>
							
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							 role="button" aria-expanded="false">餐飲
								<span class="caret"></span>
						</a>
							
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							 role="button" aria-expanded="false">娛樂
								<span class="caret"></span>
						</a>
							
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							 role="button" aria-expanded="false">交通
								<span class="caret"></span>
						</a>
							
					</ul>
					<div class="navbar-form navbar-left" role="search" style="width:900px">
						<div class="form-group">
						<form action="SearchServlet" id="jsearch" method="post">
							<input type="text" class="form-control" placeholder="Search"
								id="inputAdd" name="eventTitleContent" value="${inputAdd}" />
						</form>
						</div>
						<button type="button" id="btnsearch" onclick="searchsubmit()" class="btn btn-default" id="button1"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
						<div class="btn-group" id="button-toggle">
							<a href="${pageContext.request.contextPath}/partner/mapFP.jsp"><button type="button" class="btn btn-default"
									id="btn-left">地圖</button></a> <a
								href="${pageContext.request.contextPath}/partner/ShowAllPartnerServlet"><button
									type="button" class="btn btn-default" id="btn-right-list">列表</button></a>
						</div >
						<div class="btn-group" style="margin-left:170px">
						<button type="button" class="btn btn-primary" data-toggle="modal"
						data-target="#newPartner" onclick="createEvent('${mem.PartnerVO.eventNo}','${mem.PartnerVO.eventType}','${mem.PartnerVO.eventTitle}','${mem.PartnerVO.eventContent}','${mem.PartnerVO.addr}')">
	  					我要新增找伴活動
						</button>
						</div>
					</div>

				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
			<!-- /.container-fluid -->
		</nav>
	</nav>
	<div class="wrap">

		<div class="main">
			<div class="inwrap">

				<div class="detail">
					<p id="filters" class="cxbtn_group">
						<a class="cxbtn" href="javascript://" data-filter="all">Reset filters</a>
						<a class="cxbtn" href="javascript://" data-filter="購物">購物</a>
						<a class="cxbtn" href="javascript://" data-filter="餐飲">餐飲</a> 
						<a class="cxbtn" href="javascript://" data-filter="娛樂">娛樂</a>
						<a class="cxbtn" href="javascript://" data-filter="運動">運動</a>
						<a class="cxbtn" href="javascript://" data-filter="藝文">藝文</a>
						<a class="cxbtn" href="javascript://" data-filter="交通">交通</a>
					</p>
				</div>




				<div class="example">
				
					<div id="main" role="main">
						<ul id="tiles">
							<!-- These are our grid blocks -->
							<c:forEach var="mem" varStatus="statusX" items="${AllPartners}">
								<li data-filter-class='["${mem.PartnerVO.eventType}"]'>
									<table>
										<tr>
											<td><img style="float: left"
												src="${pageContext.request.contextPath}/GetImg?imgid=${mem.imgNo}"
												height="30" width="30" onerror="this.style.display='none'">
												<h2>${mem.PartnerVO.eventTitle}
													<a href="#" data-toggle="modal" data-target="#myModal3" onclick="attend('${mem.PartnerVO.eventNo}','${member.memberId}','${mem.PartnerVO.memberId}','${mem.PartnerVO.eventContent}')"><img style="float: right" src="img/plusone2.png"
														id="plusone" width="32" height="32" alt="+1"></a>
												</h2>


												<p id="contentp">${mem.PartnerVO.eventContent}</p>
												<img src="${pageContext.request.contextPath}/GetImg?imgid=${mem.PartnerVO.imgNo}"
												height="180" width="220" title="${mem.PartnerVO.eventTitle}">

												<div class="post_meta" style="margin: 0">
													
													<span><a href="#"><img src="../partner/img/icon-location.png">${mem.PartnerVO.memberId}</a></span>
													 <a href="${pageContext.request.contextPath}/partner/FindByTypeServlet?mType=${mem.PartnerVO.eventType}"><img src="../partner/img/icon-tag.png">${mem.PartnerVO.eventType}
													 <a href="mapFP.jsp?inputAdd=${mem.PartnerVO.addr}" title="${mem.PartnerVO.addr}"><img src="../partner/img/icon-location.png">${mem.PartnerVO.getAddr().toString().substring(0,3)}</a>
													<fmt:formatDate value="${mem.PartnerVO.eventDate}"
														var="formattedDate" type="date" pattern="yyyy年M月d日 H:mm" />
													<a href="#" title="${formattedDate}"><img src="../partner/img/icon-time.png">
													
													<fmt:formatDate value="${mem.PartnerVO.eventDate}"
														var="formattedDate" type="date" pattern="M月d日 H:mm" />
													${formattedDate}</a>

													<c:if test="${!mem.PartnerVO.memberId.equals(member.memberId)}">
														<a href="#" data-toggle="modal" data-target="#myModal2" onclick="openNewWindow(${mem.PartnerVO.eventNo})"><img src="../partner/img/icon-more.png">檢舉</a>
													</c:if>

													<c:if test="${mem.PartnerVO.memberId.equals(member.memberId)}">
														<a href="#" data-toggle="modal" data-target="#myModal" onclick="editEvent('${mem.PartnerVO.eventNo}','${mem.PartnerVO.eventType}','${mem.PartnerVO.eventTitle}','${mem.PartnerVO.eventContent}','${mem.PartnerVO.addr}')"><img src="../partner/img/icon-more.png")">編輯</a>
													</c:if>
												</div></td>
										</tr>
									</table>
									
								</li>
							</c:forEach>
							<!-- End of grid blocks -->
						</ul>
					</div>
				</div>



			</div>
		</div>
	</div>





<!-- 新增找伴活動Modal -->
	<div class="modal fade" id="newPartner" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增找伴活動</h4>
				</div>
				<div class="modal-body">
					<form name="insertMemberFormA" action="NewEventServlet" id="jinsert"
						method="POST" enctype="multipart/form-data">
						<table border="1">
							<tbody>
								<tr bgcolor=#C1FFE4>
									<td width="120" height="40">事件類型:</td>
									<td width="600" height="40" align="left"><input id='num'
										style="text-align: left" name="type" type="text" size="14">
								</tr>
								<tr bgcolor=#C1FFE4>
									<td width="120" height="40">標題:</td>
									<td width="600" height="40" align="left"><input id='num'
										style="text-align: left" name="title" type="text" size="14">
									</td>
								</tr>
								<tr bgcolor=#C1FFE4>
									<td width="120" height="40">內文:</td>
									<td width="600" height="40" align="left"><textarea
										name="content" type="text" size="54"></textarea></td>
								</tr>
								<tr bgcolor=#C1FFE4>
									<td width="120" height="40">地點:</td>
									<td width="600" height="40" align="left"><input
										name="address" type="text" size="54"></td>
								</tr>
								<tr bgcolor=#C1FFE4>
									<td width="120" height="40">圖片:</td>
									<td width="600" height="40" align="left"><input
										name="photo" type="file" size="14" accept="image/*"></td>
								</tr>
							</tbody>
						</table>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" onclick="createsubmit()">送出</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
<!-- 編輯貼文Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">編輯貼文</h4>
      </div>
      <div class="modal-body">

		<form name="insertMemberFormB" action="UpdateEventServlet" id="jupdate" method="POST">
			<table border="1" >
			<tbody >
			<tr bgcolor=#C1FFE4 >
			    <input id='num' style="text-align:left" name="eno" type="hidden" size="14">
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">事件類型:</td>
			    <td width="600" height="40" align="left" >
			    <input id='num' style="text-align:left" name="type" type="text" size="14">
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">標題:</td>
			    <td width="600" height="40" align="left" >
			         <input id='num' style="text-align:left" name="title" type="text" size="14">
			    </td>
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">內文:</td>
			    <td width="600" height="40" align="left" >
			         <input name="content" type="text" size="54">
			    </td>
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">地點:</td>
			    <td width="600" height="40" align="left" >
			         <input name="address" type="text" size="54">
			    </td>
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">圖片:</td>
			    <td width="600" height="40" align="left" >
			         <input name="photo" type="file" size="14" accept="image/*">
			    </td>
			</tr>
<!-- 			<tr bgcolor='tan' > -->
<!-- 			    <td height="50" colspan="2" align="center"> -->
<!-- 			       <input type="submit" value="送出" > -->
<!-- 			    </td> -->
<!-- 			</tr> -->
			
			</tbody>
			</table>
		</form>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
        <button type="button" class="btn btn-primary"  onclick="jsubmit()">送出</button>
      </div>
    </div>
  </div>
</div>






<!-- 檢舉貼文Modal -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">檢舉貼文</h4>
      </div>
      <div class="modal-body">
		<form name="insertMemberFormA" action="../comment/NewCommentServlet" id="jcomment" method="POST">
			<table border="1" >
			
			<tbody >
		
			<tr bgcolor=#C1FFE4 >
			         <input name="eno" id="eno" type="hidden" size="54" value="${param.t}">
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">檢舉原因:</td>
			    <td width="600" height="40" align="left" >
<!-- 			         <input name="content" type="text" size="54"> -->
			         <select id="selectoption" name="content">
			         	<option>這則貼文是垃圾訊息或詐騙</option>
			         	<option>這則貼文是廣告</option>
			         	<option>色情內容</option>
			         	<option>違反智慧財產權</option>
			         </select>
			    </td>
			</tr>
<!-- 			<tr bgcolor='tan' > -->
<!-- 			    <td height="50" colspan="2" align="center"> -->
<!-- 			       <input type="submit" value="送出" > -->
<!-- 			    </td> -->
<!-- 			</tr> -->
			</tbody>
			</table>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" id="btncommentclose" class="btn btn-default" data-dismiss="modal">關閉</button>
        <button type="button" id="btncommentsubmit" class="btn btn-primary" onclick="jcomment()">送出</button>
      </div>
    </div>
  </div>
</div>



<script type="text/javascript">
	$('#btnsearch').click(function() {
		
		
		
// 		$.ajax({
// 			url: "${pageContext.request.contextPath}/partner/SearchServlet",
//             data: {
//             		"eventTitleContent": $("#inputAdd").val(),
//             	  },
//             type:"POST",
//             dataType:'text',

//             success: function(msg){
//                 alert(msg);
//             },

//              error:function(xhr, ajaxOptions, thrownError){ 
//                 alert(xhr.status); 
//                 alert(thrownError); 
//              }
//         });
	});

</script>



<script type="text/javascript">
	$('#btncommentsubmit').click(function() {
		$('#btncommentclose').click()
		$.ajax({
			url: "${pageContext.request.contextPath}/comment/NewCommentServlet",
            data: {
            		"content": $("#selectoption").val(),
            		"eno": $("#eno").val() 
            	  },
            type:"POST",
            dataType:'text',

            success: function(msg){
                alert(msg);
            },

             error:function(xhr, ajaxOptions, thrownError){ 
                alert(xhr.status); 
                alert(thrownError); 
             }
        });
	});

</script>







<!-- 送出參加活動訊息Modal -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">確定送出參加活動請求？</h4>
      </div>
      <div class="modal-body">

		<form name="insertMemberFormC" action="${pageContext.request.contextPath}/message/writeMessage.do" id="jmessage" method="POST">
			<table border="1" >
			<tbody >
			
			<tr bgcolor=#C1FFE4 >
			    <input id='xxxeno' style="text-align:left" name="eno" type="text" size="14">
			</tr>
		
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">我是:</td>
			    <td width="600" height="40" align="left" >
			    <input id='xxx1' style="text-align:left" id="messageFrom" name="messageFrom" value="${member.memberId}" type="hidden" size="14">
			</tr>
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">寄給:</td>
			    <td width="600" height="40" align="left" >
			    <input id='xxx2' style="text-align:left" id="messageTo" name="messageTo" type="hidden" size="14">
			</tr>
			
			<tr bgcolor=#C1FFE4 >
			    <td width="120" height="40">信件內容:</td>
			    <td width="600" height="40" align="left" >
			         <input id="xxx3" name="message" type="hidden" size="54">
			    </td>
			</tr>
			
			
<!-- 			<tr bgcolor='tan' > -->
<!-- 			    <td height="50" colspan="2" align="center"> -->
<!-- 			       <input type="submit" value="送出" > -->
<!-- 			    </td> -->
<!-- 			</tr> -->
			
			</tbody>
			</table>
		</form>
		
      </div>
      <div class="modal-footer">
        <button type="button" id="btn2" class="btn btn-default" data-dismiss="modal">取消</button>
        <button type="button" id="btn1" class="btn btn-primary"  >確定</button>
      </div>
    </div>
  </div>
</div>




<script type="text/javascript">
	$('#btn1').click(function() {
		$('#btn2').click()
		$.ajax({
			url: "http://localhost:8080/EnjoyLife0925_final/AjaxMessage",
            data: {
            		"eno": $("#xxxeno").val(),
            		"messageFrom": $("#xxx1").val(),
            		"messageTo": $("#xxx2").val(),
            		//"messageTitle": $("#xxx3").val(),
            		"message": $("#xxx3").val()
            	  },
            type:"POST",
            dataType:'text',

            success: function(msg){
                alert(msg);
            },

             error:function(xhr, ajaxOptions, thrownError){ 
                alert(xhr.status); 
                alert(thrownError); 
             }
        });
	});

</script>




	<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/jquery.imagesloaded.js"></script>
<script src="js/jquery.wookmark.min.js"></script>

<script>
(function ($){
	  $('#tiles').imagesLoaded(function() {
	    // Prepare layout options.
	    var options = {
	      autoResize: true, // This will auto-update the layout when the browser window is resized.
	      container: $('#main'), // Optional, used for some extra CSS styling
	      offset: 2, // Optional, the distance between grid items
	      itemWidth: 250, // Optional, the width of a grid item
	      fillEmptySpace: false // Optional, fill the bottom of each column with widths of flexible height
	    };

	    // Get a reference to your grid items.
	    var handler = $('#tiles li'),
	      filters = $('#filters a');

	    // Call the layout function.
	    handler.wookmark(options);

	    /**
	     * When a filter is clicked, toggle it's active state and refresh.
	     */
	    var onClickFilter = function(e) {
	      var $item = $(e.currentTarget),
	        activeFilters = [],
	        filterType = $item.data('filter');

	      if (filterType === 'all') {
	        filters.removeClass('active');
	      } else {
	        $item.toggleClass('active');

	        // Collect active filter strings
	        filters.filter('.active').each(function() {
	          activeFilters.push($(this).data('filter'));
	        });
	      }

	      handler.wookmarkInstance.filter(activeFilters, 'and');
	    }

	    // Capture filter click events.
	    $('#filters').on('click.wookmark-filter', 'a', onClickFilter);
	  });
	})(jQuery);
</script>







<script type="text/javascript">

	function createEvent(num1,num2,num3,num4,num5){
		$("[name='eno']").val(num1);
		$("[name='type']").val(num2);
		$("[name='title']").val(num3);
		$("[name='content']").val(num4);
		$("[name='address']").val(num5);
	}
	
	function createsubmit(){
		document.getElementById("jinsert").submit();
	}
	
	function editEvent(num1,num2,num3,num4,num5){
		$("[name='eno']").val(num1);
		$("[name='type']").val(num2);
		$("[name='title']").val(num3);
		$("[name='content']").val(num4);
		$("[name='address']").val(num5);
	}
	
	function jsubmit(){
		document.getElementById("jupdate").submit();
	}
	function attend(xxxeno,xxx1,xxx2,xxx3){
		$("[name='eno']").val(xxxeno);
 		$("[name='messageFrom']").val(xxx1);
 		$("[name='messageTo']").val(xxx2);
 		$("[name='message']").val(xxx3);
	}
	
	function jmessage(){
		document.getElementById("jmessage").submit();
	}
	
	function openNewWindow(num){
		$("[name='eno']").val(num);
	}
	
	function searchsubmit(){
		document.getElementById("jsearch").submit();
	}

// 	function jcomment(){
// 		document.getElementById("jcomment").submit();
// 	}
	
	
	

// 	function show() {
// 		var box = document.getElementsByName("box");
// 		var text= [];
// 		var newBox= [];
// 		var btn= [];
// 		for(var i=0;i<box.length;i++){
// 			text[i] = box[i].innerHTML;
// 			newBox[i] = document.createElement("div");
// 			btn[i] = document.createElement("a");
// 			newBox[i].innerHTML = text[i].substring(0, 8);
// 			btn[i].innerHTML = text[i].length > 8 ? "...顯示全部" : "";
// 			btn[i].href = "###";
// 			btn[i].onclick = function() {
// 				if (this.innerHTML == "...顯示全部") {
// 					this.innerHTML = "收起";
// 					newBox[i].innerHTML = text[i];
// 				} else {
// 					this.innerHTML = "...顯示全部";
// 					newBox[i].innerHTML = text[i].substring(0, 10);
// 				}
// 			}
// 			box[i].innerHTML = "";
// 			box[i].appendChild(newBox[i]);
// 			box[i].appendChild(btn[i]);
// 		}

// 		}
// 	show();
</script>
</body>
</html>