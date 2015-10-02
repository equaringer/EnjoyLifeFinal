<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>ENJOY LIFE</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href='http://fonts.googleapis.com/css?family=Arimo:400,700' rel='stylesheet' type='text/css'>
	<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/bootstrap.min.css' type="text/css" />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/jquery-ui.min.css' type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/skel-noscript.css' type="text/css" />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style.css' type="text/css" />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/style-desktop.css' type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>	
	<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	<!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
	<link rel='stylesheet' href='${pageContext.request.contextPath}/css/rater.css' type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.rater.js"></script>	
	

<style>
	*{
		max-width:1280px;
		margin:0 auto;
		
	}
	.blogType_css{
		box-shadow:5px 5px 15px rgba(10,125,225,0.4);
		margin-bottom:10px;
		padding:0px;
	}
	.blogList{
		border:2px solid #428bca;
		padding:5px;
		margin: 5px;
		display:inline-block;
		width:240px;
		height:430px;
		box-shadow:5px 5px 15px rgba(10,125,225,0.4);
		border-top-left-radius:15px;
		border-top-right-radius:15px;
	}
	.layoutSide{
		display:block;
		height:auto;
		
	}
	.blogImg{
		border:5px solid gray;
		margin-bottom:10px;
		width:220px;
		float:left;
		overflow:hidden;
	}
	.arti{
		color: black;
		font-size:12pt;
	}
	.lab-size{
		font-size:10pt;
	}
	.dataFont{
		font-size:11pt;
	}
	.replyfomat{
		border:1px solid #DDDDDD;
		display:block;
		margin-bottom:5px;
		max-height:640px;
		overflow: auto;
		width:270px
	}
	.fomatA{
		border:1px solid #DDDDDD;
	}
	.fomatF{
		display:block;
		width:40px;	
		height:60px;
		float:left; 
		margin:5px auto;
	}
	.fomatB{
		display:inline-block;
 		line-height: 10px; 
		margin:5px auto;
		width:200px;
		word-break: break-all;
		padding-left:20px;
		box-shadow:10px 10px 15px rgba(10,125,225,0.4);
	}	

	.lab_reply{
		font-family:微軟正黑體;
		font-weight: bold;
		color:#007799;
	}
	.deldiv_css{
		text-align: right;
		width:250px;
	}
	#reportSelect{
		width:130px;
	}
	.deldiv_css span{
		font-size: 8pt;
		color:#00BBFF;
	}
	.msgdiv_css{
		width:240px;
		padding:5px;
		border:1px solid #FF88C2;
		font-size: 8pt;
		border-top-left-radius:15px;
		border-bottom-right-radius:15px;
		background-color:#FFB7DD;
		box-shadow:10px 10px 0px #DDDDDD;
		margin-bottom:15px
	}
	.msgdiv_css input{
		margin-left:2px;
	}
	.p_rp_memid{
		color:#003C9D;
	}
	.p_rp_context{
	}
	.p_rp_date{
	}
</style>
<script type="text/javascript">
	function getAllReply(ArticleNo){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/GetReplyServlet",
			dataType:"json",
			data:{"ArticleNo":ArticleNo},
			success:function(data){		
				$('#replyDiv').empty();
				console.log(data);
				$.each(data,function(i,value){
					var eleDiv1 = document.createElement("div");
					var eleDiv2 = document.createElement("div");
					var eleDiv3 = document.createElement("div");
					
					var eleImg = document.createElement("Img");

					eleImg.setAttribute("src", "${pageContext.request.contextPath}/GetImg?imgid="+value.memPic);
					eleImg.setAttribute("width", "50px");
					eleImg.setAttribute("height", "50px");
					eleDiv1.appendChild(eleImg);
					eleDiv1.setAttribute("class", "fomatF");
					
					var eleP1 = document.createElement("p");
					var eleA  = document.createElement("a");
					var txtP1  = document.createTextNode(" 說:");
					var txtA  = document.createTextNode(value.replyMemberId);
					eleA.setAttribute("href", "#");
					eleA.appendChild(txtA);
					eleP1.appendChild(eleA);
					eleP1.appendChild(txtP1);
					eleP1.setAttribute("class", "p_rp_memid");
					
					var eleP2 = document.createElement("p");
					var txtP2  = document.createTextNode(value.replyContext);
					eleP2.appendChild(txtP2);
					eleP2.setAttribute("class", "p_rp_context");
					
					var rDate = value.replyDate.substring(0,16);
					var eleP3 = document.createElement("p");
					var txtP3  = document.createTextNode(rDate);
					eleP3.appendChild(txtP3);
					eleP3.setAttribute("class", "p_rp_date");
					
					eleDiv2.setAttribute("class", "fomatB");
					eleDiv2.appendChild(eleP1);
					eleDiv2.appendChild(eleP2);
					eleDiv2.appendChild(eleP3);
					
					eleDiv3.setAttribute("class", "fomatA")
					eleDiv3.appendChild(eleDiv1);
					eleDiv3.appendChild(eleDiv2);
					
					var replyDiv = document.getElementById("replyDiv");
					replyDiv.appendChild(eleDiv3);
				})
			}	
		})			
	}

	function viewArticle(ArticleNo){
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/showArticleServlet",
			dataType:"json",
			data:{"PostNo":ArticleNo},
			success:function(data){
				var obj = data;
				var rDate = data.postDate.substring(0,16);
				$('#postModalLabel').text(data.postTitle);				 
				$('#artiNo').text(' '+data.postNo);
				$('#artiMem').text(' '+data.memberId);
				$('#artiPlace').text(' '+data.AttractionsNo);
				$('#artiDate').text(' '+rDate);
				$('#artiContext').text(' '+data.postContent);
				$('#artiScore').text(' '+data.avgScore+'顆星');
				$('#artiView').text(' '+data.viewTotal+' views');		
				
				var memId = "${member.memberId}";
				$('#delDiv').empty();
				$('#msgDiv').empty();
				var eleA1 = document.createElement("a");
				eleA1.setAttribute("href", "#");
				eleA1.setAttribute("class", "del_report_css");
				eleA1.setAttribute("name", "reportAttr");
					
				var eleSpan1 = document.createElement("span");
				var txt1 = document.createTextNode("  檢舉");
				eleSpan1.appendChild(txt1);
				eleA1.appendChild(eleSpan1);
				
				$('#delDiv').append((eleA1));	
				if(memId == data.memberId){
					var eleA2 = document.createElement("a");
					eleA2.setAttribute("href", "#");
					eleA2.setAttribute("class", "del_report_css");
					eleA2.setAttribute("name", "delAttr");
					
					var eleSpan2 = document.createElement("span");
					var txt2 = document.createTextNode("  刪除");
					eleSpan2.appendChild(txt2);
					eleA2.appendChild(eleSpan2);				
					$('#delDiv').append(eleA2);
				}
				$('#fullImg').attr("src","${pageContext.request.contextPath}/GetBlogImgServlet?isThumbnail=F&&pathImg="+data.pathPhoto);			 	

				
// 				var childWindow = document.getElementById("myFrame").contentWindow;//mainFrame這個id是父頁面iframe的id 
//  			childWindow.document;//獲取子頁面中的document對象； txtBlogNo
// 				var childBlogNo = childWindow.document.getElementById("txtBlogNo");
// 				childBlogNo.value = data.postNo;
			}
		 });
	getAllReply(ArticleNo);
	}
	
</script>
</head>
<body class="homepage">
		<!-- Header -->
<%@include file="/includes/newheader" %>	
		<!-- Main -->
		<div id="main">
			<div class="row">
					<div class="col-md-3 layoutSide">
						<a href="${pageContext.request.contextPath}/BlogListServlet?Index=0&&pType=ALL" class="btn btn-default btn-lg active btn-block" role="button">日誌列表</a><br>
						<a href="${pageContext.request.contextPath}/blog/postBlog.jsp" class="btn btn-default btn-lg active btn-block" role="button">新增日誌</a><br>
						<a href="#" class="btn btn-default btn-lg active btn-block" role="button">我的日誌</a>
					</div>
					<div class="col-md-7">
						<form action="${pageContext.request.contextPath}/BlogListServlet" method="GET">
						
							<div class="blogType_css" >
								<span>選擇日誌類型</span>
								<input type="radio" name="pType" id="type1" value="ALL" checked>全部
								<input type="radio" name="pType" id="type2" value="TL" > 旅遊					
								<input type="radio" name="pType" id="type3" value="DF" > 美食								
								<input type="radio" name="pType" id="type4" value="ML" > 心情
								<input type="radio" name="pType" id="type5" value="FT" > 搞笑
								<input type="radio" name="pType" id="type6" value="OT" > 其他
							</div>
						
							<% request.getSession().getAttribute("blogList"); %> 
							<% request.getSession().getAttribute("listIndex");%>
							<% request.getSession().getAttribute("selType");%>
							<% request.getSession().getAttribute("member");%>
							<div class="row">
							<c:if test="${blogList.size() == 0}"><br><h3>此類型沒有任何文章</h3></c:if>
							<c:forEach var="lists" items="${blogList}">
								<input type="hidden" id="role" value="T" />
								<div class="blogList">
									<img class="blogImg" src="${pageContext.request.contextPath}/GetBlogImgServlet?isThumbnail=T&&pathImg=${lists.pathPhoto}">
									<br>
									<span class="label label-primary lab-size">日誌編號 </span><span class="dataFont">&nbsp;${lists.postNo}</span>
									<span class="label label-primary lab-size">會員ID</span><span class="dataFont">&nbsp;${lists.memberId}</span>
									<c:choose>
										<c:when test="${lists.postType=='TL'}"><span class="label label-primary lab-size">類型</span><span class="dataFont">&nbsp;旅遊</span></c:when>
										<c:when test="${lists.postType=='DF'}"><span class="label label-primary lab-size">類型</span><span class="dataFont">&nbsp;美食</span></c:when>
										<c:when test="${lists.postType=='ML'}"><span class="label label-primary lab-size">類型</span><span class="dataFont">&nbsp;心情</span></c:when>
										<c:when test="${lists.postType=='FT'}"><span class="label label-primary lab-size">類型</span><span class="dataFont">&nbsp;搞笑</span></c:when>
										<c:when test="${lists.postType=='OT'}"><span class="label label-primary lab-size">類型</span><span class="dataFont">&nbsp;其他</span></c:when>
									</c:choose>
									<fmt:formatDate value="${lists.postDate}" 
													var="formattedDate" type="date" pattern="yyyy年MM月dd日 HH:mm" />
									<span class="label label-primary lab-size">標題 </span><span class="dataFont">&nbsp;${lists.postTitle}</span><br>
									<span class="label label-primary">星級評分</span>&nbsp;${lists.avgScore}顆星
									<span class="label label-primary">瀏覽人數</span>&nbsp;${lists.viewTotal}
									<span class="label label-primary">發文日期</span>&nbsp;${formattedDate}<br>							
									<span class="label label-primary lab-size">內文</span><span class="dataFont">&nbsp;${lists.postContext}</span>
									<input type="button" value="閱讀全文" class="btn btn-default btn-xs" data-toggle="modal" data-target="#postModal" onclick="viewArticle('${lists.postNo}')">
									<br>
								</div>
							</c:forEach>
							</div>
								<% request.getSession().removeAttribute("blogList"); %> 		  
							<input type="submit" id="btnSend" value="send" style="display:none;">
							<input type="text" name="Index" value="0"  style="display:none;">
						</form>
						<nav>
						  <ul class="pager">
						    <li class="previous" id='previous'><a href='#'><span aria-hidden="true">&larr;上一頁</span></a></li>
						    <li class="next" id="next"><a href='#'> <span aria-hidden="true">下一頁 &rarr;</span></a></li>
						  </ul>
						</nav>
			
						<!-- 互動視窗 -->
						<div class="modal fade" id="postModal" tabindex="-1" role="dialog" aria-labelledby="postModalLabel" aria-hidden="true" >
						  <div class="modal-dialog modal-md">
						    <div class="modal-content" id="postModalA">
						      <div class="modal-header">		
						        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
						        <div class="col-md-1"></div>
						        <h3 class="modal-title" id="postModalLabel"></h3>
						        <div class="col-md-1"></div>
						      </div>
						      <div class="modal-body" id="postModalBody">
						      		<div class="row">
										<!-- Blog顯示完整文章 -->			  
							        	<div class="col-md-6 thumbnail" style="padding-left:0px;margin-left:40px">
							        		<img src="" id="fullImg" style="width:350px;">
							        	</div>
			
							        	<div class="col-md-5" style="padding-left:0px;margin-left:0px">
							        		<div style="padding-left:10px;">
								        		<label class="lab_reply">日誌編號</label> <span id="artiNo" class="arti"></span><br><br>
								        		<span id="artiMem" class="arti"></span>
								        		<label class="lab_reply">在--</label><span id="artiPlace" class="arti"></span><br><br>
								        		<label class="lab_reply">於</label><span id="artiDate" class="arti"></span>
								        		<label class="lab_reply">說</label><br>
								        		<span id="artiContext" class="arti"></span><br><br>
								        		<label class="lab_reply">星級</label> <span id="artiScore" class="arti"></span>
								        		<label class="lab_reply">瀏覽次數</label><span id="artiView" class="arti"></span><br>							        							 
												<div id="delDiv" class="deldiv_css"></div>
												<div id="msgDiv" class=""></div>
											</div>
											<div id="replyDiv" class="replyfomat"></div>			
											<textarea class="form-control" rows='3' placeholder="回點什麼吧..."
												style="resize: none;width:200px;float:left" id="txtRely"></textarea>
											<input type="button" class="btn btn-primary" value="留言" style="margin-left:0px" id="btnReply">
							        	</div>
						        	</div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
						      </div>
						    </div>
						  </div>
						</div>		
							
					</div>
					<div class="col-md-2 layoutSide"></div>	
			</div>			
		</div>
		
		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Enjoy Life
			</div>
		</div>
		<%@include file="/includes/logout" %>
</body>
<script type="text/javascript">
 (function($){ 	
	 $("[name='Index']").val('${listIndex}');
	 var selectedType = "${selType}";
	 if(selectedType=="ALL"){ $('#type1').attr('checked','true')}
	 if(selectedType=="TL"){ $('#type2').attr('checked','true')}
	 if(selectedType=="DF"){ $('#type3').attr('checked','true')}
	 if(selectedType=="ML"){ $('#type4').attr('checked','true')}
	 if(selectedType=="FT"){ $('#type5').attr('checked','true')}
	 if(selectedType=="OT"){ $('#type6').attr('checked','true')}
	 $("[name='pType']").change(function(){
		 $('#btnSend').click();
	 })
// 	 $("[name='pType']").trigger('change');
	 
	 $("[name='pType']").attr('selected', true);
// 	 if($('#role').val()!="T"){ 
// 		 $("[name='Index']").val('0');
// 		 $('#btnSend').click();
// 	 }
	 
	 $("#selectGroup").change(function(){
		 $("[name='Index']").val('0');
		 $('#btnSend').click();
	 })
	 
	 $('#previous').click(function(){
		 var index = $("[name='Index']").val();
		 var newIndex = parseInt(index)-9;
		 if(newIndex<0){
			 $("[name='Index']").val('0');
		 }else{
			 $("[name='Index']").val(newIndex);
		 }
		 $('#btnSend').click();
	 });
	 $('#next').click(function(){
		 var index = $("[name='Index']").val();
		 var newIndex = parseInt(index)+9;
		 $("[name='Index']").val(newIndex);
		 $('#btnSend').click();		 
	 });
	 	
	$('#btnReply').click(function(){
		var ArticleNo = $('#artiNo').text().trim();
		var context = $('#txtRely').val();

		if(context!=''){
			$.ajax({
				type:"get",
				url:"${pageContext.request.contextPath}/ReplyAddServlet",
				dataType:"json",
				data:{"ArticleNo":ArticleNo,"replyContex":context},
				success:function(data){		

					if(data=='failed'){
						alert('新增留言失敗，請重試一次');
					}else{
						$('#txtRely').val('');
						getAllReply(ArticleNo);
					}	
				}	
			})
		}
	})
	
	$('#postModal').on('hidden.bs.modal',function(){	       
		$('#fullImg').attr('src','');
		$('#artiNo').text='';
		$('#artiMem').text='';
		$('#artiPlace').text='';
		$('#artiDate').text='';
		$('#artiContext').text='';
		$('#artiScore').text='';
		$('#artiView').text='';
		$('#replyDiv').empty();	
		$('#delDiv').empty();
		$('#msgDiv').empty();
		$('#msgDiv').attr("class","");
	}) 
	
	$('#delDiv').on("click","a[name='reportAttr']",function(){ //按下檢舉的動作
		$('#msgDiv').attr("class","msgdiv_css");
		$('#msgDiv').empty();
		var eleDiv =  document.createElement("div");
		eleDiv.setAttribute("class", "del_div_css");
		var eleP01 =  document.createElement("span");
		var txt01 = document.createTextNode("請選擇檢舉原因");
		var optTxt01 = document.createTextNode("此內容是廣告文");
		var optTxt02 = document.createTextNode("此內容是垃圾文");
		var optTxt03 = document.createTextNode("此內容違反智慧財產權");
		var optTxt04 = document.createTextNode("此內容包含暴力或色情");
				
		var eleSelect = document.createElement("select");
		eleSelect.setAttribute("name","reportContext");
		eleSelect.setAttribute("id","reportSelect");
					
		var eleOpt1 = document.createElement("option");
		var eleOpt2 = document.createElement("option");
		var eleOpt3 = document.createElement("option");
		var eleOpt4 = document.createElement("option");
		eleOpt1.setAttribute("value", "此內容是廣告文");
		eleOpt1.appendChild(optTxt01);
		eleOpt2.setAttribute("value", "此內容是垃圾文");
		eleOpt2.appendChild(optTxt02);
		eleOpt3.setAttribute("value", "此內容違反智慧財產權");
		eleOpt3.appendChild(optTxt03);
		eleOpt4.setAttribute("value", "此內容包含暴力或色情");
		eleOpt4.appendChild(optTxt04);
		eleSelect.appendChild(eleOpt1);
		eleSelect.appendChild(eleOpt2);
		eleSelect.appendChild(eleOpt3);
		eleSelect.appendChild(eleOpt4);
					
		var eleBtn1 = document.createElement("input");
		var eleBtn2 = document.createElement("input");
		eleBtn1.setAttribute("type", "button");
		eleBtn1.setAttribute("class", "btn btn-sm btn-info");
		eleBtn1.setAttribute("value", "確定");
		eleBtn1.setAttribute("name", "reportOK");
				
		eleBtn2.setAttribute("type", "button");
		eleBtn2.setAttribute("class", "btn btn-sm btn-info");					
		eleBtn2.setAttribute("value", "取消");
		eleBtn2.setAttribute("name", "reportCancel");
					
		eleP01.appendChild(txt01);
		eleDiv.appendChild(eleP01);
		$('#msgDiv').append(eleDiv);
		$('#msgDiv').append(eleSelect);
		$('#msgDiv').append(eleBtn1);
		$('#msgDiv').append(eleBtn2);
					
	})
	$('#delDiv').on("click","a[name='delAttr']",function(){
		$('#msgDiv').attr("class","msgdiv_css");
		$('#msgDiv').empty();
		var txt01 = document.createTextNode("確定要刪除此文章?");
		var eleBtn1 = document.createElement("input");
		var eleBtn2 = document.createElement("input");
		eleBtn1.setAttribute("type", "button");
		eleBtn1.setAttribute("class", "btn btn-sm btn-info");
		eleBtn1.setAttribute("value", "確定");
		eleBtn1.setAttribute("name", "delOK");
				
		eleBtn2.setAttribute("type", "button");
		eleBtn2.setAttribute("class", "btn btn-sm btn-info");					
		eleBtn2.setAttribute("value", "取消");
		eleBtn2.setAttribute("name", "delCancel");
		$('#msgDiv').append(txt01);
		$('#msgDiv').append(eleBtn1);
		$('#msgDiv').append(eleBtn2);
	})
	$('#msgDiv').on("click","input[name='reportOK']",function(){
		var ArticleNo = $('#artiNo').text().trim();
		var memId = $('#artiMem').text().trim();
		var report = $('#reportSelect').val();
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/ReportArtiServlet",
			dataType:"json",
			data:{"ArticleNo":ArticleNo,"report":report,"memId":memId},
			success:function(data){		
				alert(data);
				if(data=='F'){
					alert('檢舉失敗，請重試一次');
				}else{
					$('#msgDiv').attr("class","");
					$('#msgDiv').empty();
					$('#msgDiv').html('<p>已檢舉成功</p>')	;
				}	
			}	
		})		
	})
	$('#msgDiv').on("click","input[name='reportCancel']",function(){
		$('#msgDiv').attr("class","");
		$('#msgDiv').empty();				
	})
	$('#msgDiv').on("click","input[name='delOK']",function(){
		var ArticleNo = $('#artiNo').text().trim();
		$.ajax({
			type:"get",
			url:"${pageContext.request.contextPath}/DelArtiServlet",
			dataType:"json",
			data:{"ArticleNo":ArticleNo},
			success:function(data){		
				if(!data){
					alert('刪除文章失敗，請重試一次');
				}else{
					alert('刪除文章成功');
					$('#btnSend').click();
				}	
			}	
		})			
	})
	$('#msgDiv').on("click","input[name='delCancel']",function(){
		$('#msgDiv').attr("class","");
		$('#msgDiv').empty();				
	})
	
 }(jQuery));
 </script>
</html>