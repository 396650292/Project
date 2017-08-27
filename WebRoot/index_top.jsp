<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>

<head>

<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script language="javaScript"> 
function closeWindow() {
	window.opener = null; 
	window.open(' ', '_self', ' '); 
	window.close();
} 
function changeImg1(no) {
		if(no==1){
				$("#Image1").attr("src","images/nav/top-11.gif");
		}else if(no==2){
				$("#Image2").attr("src","images/nav/top-22.gif");
		}else if(no==3){
				$("#Image3").attr("src","images/nav/top-33.gif");
		}
};
function changeImg2() {
		$("#Image1").attr("src","images/nav/top-1.gif");
		$("#Image2").attr("src","images/nav/top-2.gif");
		$("#Image3").attr("src","images/nav/top-3.gif");
};

function change(no){
		if(no==1){
				$("#club").attr("src","images/nav/club1.jpg");
		}else if(no==2){
				$("#member").attr("src","images/nav/members1.jpg");
		}else if(no==3){
				$("#employee").attr("src","images/nav/employee1.jpg");
		}else if(no==4){
				$("#train").attr("src","images/nav/train1.jpg");
		}else if(no==5){
				$("#money").attr("src","images/nav/money1.jpg");
		}else if(no==6){
				$("#jc").attr("src","images/nav/jc1.jpg");
		}else if(no==7){
				$("#user").attr("src","images/nav/user1.jpg");
		}
}
function change2(no){
		if(no==1){
				$("#club").attr("src","images/nav/club.jpg");
		}else if(no==2){
				$("#member").attr("src","images/nav/members.jpg");
		}else if(no==3){
				$("#employee").attr("src","images/nav/employee.jpg");
		}else if(no==4){
				$("#train").attr("src","images/nav/train.jpg");
		}else if(no==5){
				$("#money").attr("src","images/nav/money.jpg");
		}else if(no==6){
				$("#jc").attr("src","images/nav/jc.jpg");
		}else if(no==7){
				$("#user").attr("src","images/nav/user.jpg");
		}
}
</script> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<!-- <meta http-equiv="refresh" content="1" url="index.jsp"> -->
<title>	</title>
				<!-- 获取系统时间 -->
				<%
				  Date date=new Date();
				  SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
				  String currentDate=sdf.format(date);
   				%>

</head>

								<!-- 用户修改 -->	<!-- 返回首页 -->   <!-- 安全退出 -->
<body>

			<table width="100" border="0" cellpadding="0" cellspacing="0">
		        <tr>
		          <td>
		          <table border="0px" width="100" height="60px" cellspacing="0px" cellpadding="0px" >
			          <tr>
				            <td><a><img src="images/nav/login.jpg" id="login" ></img></a></td>
						    <td><a href="club_query.jsp"><img border="0" src="images/nav/club.jpg" id="club" onmouseover="change(1)" onmouseout="change2(1)" style="vertical-align: top;"></img></a></td>
						    <td><a href="Members_query.jsp"><img border="0" src="images/nav/members.jpg" id="member" onmouseover="change(2)" onmouseout="change2(2)"style="vertical-align: top;"></img></a> </td>
						    <td><a href="Employees_query.jsp"><img border="0" src="images/nav/employee.jpg" id="employee" onmouseover="change(3)" onmouseout="change2(3)" style="vertical-align: top;"></img></a> </td>
						    <td><a href="trains_query.jsp" ><img border="0" src="images/nav/train.jpg" id="train" onmouseover="change(4)" onmouseout="change2(4)" style="vertical-align: top;"></img> </a></td>
						    <td><a href="money_query.jsp"><img border="0" src="images/nav/money.jpg" id="money" onmouseover="change(5)" onmouseout="change2(5)" style="vertical-align: top;"></img> </a></td>
						    <td><a href="jc_query.jsp"><img border="0" src="images/nav/jc.jpg" id="jc" onmouseover="change(6)" onmouseout="change2(6)" style="vertical-align: top;"></img></a> </td>
						    <td><a href="user_query.jsp"><img border="0" src="images/nav/user.jpg" id="user" onmouseover="change(7)" onmouseout="change2(7)" style="vertical-align: top;"></img></a> </td>
				       </td>
			       </tr>
		       </table>
		        <map name="Map" id="Map">
				  <area href="club_query.jsp" shape="rect" coords="180,23,274,60"/>
				  <area href="Members_query.jsp" shape="rect" coords="274,23,365,60"/>
				  <area href="Employees_query.jsp" shape="rect" coords="365,23,455,60"/>
				  <area href="trains_query.jsp" shape="rect" coords="455,23,543,60"/>
				  <area href="jc_query.jsp" shape="rect" coords="543,23,637,60"/>
				  <area href="money_query.jsp" shape="rect" coords="637,23,712,60"/>
				  <area href="user_query.jsp" shape="rect" coords="712,23,793,60"/>
				</map>
				</td>
		       </tr>
		      </table>
				
		      <table width="100" border="0" cellpadding="0" cellspacing="0">
		        <tr>
		          <td><img src="images/top2.jpg" width="801" height="107"></td>
		        </tr>
		      </table>
      
				<table width="801" height="34" border="0" cellpadding="0" cellspacing="0" background="images/top3.jpg">
			        <tr>
			          <td width="532" align="right" valign="top">
						  <table width="224" border="0" align="right" cellpadding="0" cellspacing="0">
				            <tr>
				              <td width="206" height="30" valign="bottom" align="right">
					              <font color="#666633">
					              		系统时间:
									<%=currentDate%>           
					              </font>
				              </td>
				              <td width="10">&nbsp;</td>
				            </tr>
				          </table>    
				          <!-- 用户修改，返回首页，安全退出，按钮 --鼠标停放事件 -->     
				  	</td>
		<td width="88"><a href="user_update.jsp" ><img onmouseover="changeImg1(1)" onmouseout="changeImg2()"  src="images/nav/top-1.gif" name="Image1" width="85" height="34" border="0" id="Image1"></a></td>
		<td width="88"><a href="index.jsp"><img onmouseover="changeImg1(2)" onmouseout="changeImg2()"  src="images/nav/top-2.gif" name="Image2" width="85" height="34" border="0" id="Image2"></a></td>
		<td width="93"><a href="ExitServlets"><img onmouseover="changeImg1(3)" onmouseout="changeImg2()"  src="images/nav/top-3.gif" name="Image3" width="85" height="34" border="0" id="Image3"></a></td>
			        </tr>
			    </table>
	  </body>
</html>
