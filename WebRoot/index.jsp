
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>




<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>企业人力资源管理--首页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
 	<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">
    		<%@include file="index_top.jsp"%>
			     	<table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
			       	 <tr>
			          <td valign="top">
			          	<table width="494">
			            <tr>
			              <td width="45" height="25">&nbsp;</td>
			              <td width="437" valign="bottom">
			              <!-- 显示栏  获取网页进入路径 -->
			              <font color="#FF0000">首页</font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
					<!--首页  三添加 三制定  -->
		      <table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
			        <tr>
			          <td height="243">
			          		<table width="547" align="center">
					            <tr align="center">
					              <td width="261" height="100">             
					 <a href="Employees_query.jsp">
					 			<!--首页面 添加员工信息  -->
					              <img src="images/addEmployee.gif" width="175" height="33" border="0">
					              </a></td>
					              <td width="274">         
					  <a href="trains_add.jsp"> 
					  			<!--首页面 制定培训计划  -->
					              <img src="images/constituteTrain.gif" width="175" height="33" border="0">
					              </a></td>
					            </tr>
					            <tr align="center">
					              <td height="100">
					  <a href="Employees_add.jsp">
					  		 <!--首页面 添加应聘信息  -->
					              <img src="images/addInvite.gif" width="175" height="33" border="0">
					              </a></td>
					              <td>
					   <a href="jc_add.jsp">
					    		<!--首页面 制定奖惩制度 -->
					              <img src="images/constituteDeal.gif" width="175" height="33" border="0">
					              </a></td>
					           </tr>
					            <tr align="center">
					           
					              <td height="100">
					   <a href="club_add.jsp">
					    			<!--首页面 添加部门信息  -->
					              <img src="images/addDepartment.gif" width="175" height="33" border="0"></a></td>
					              <td>
					   <a href="money_add.jsp">
					   				<!--首页面 制定薪资信息  -->
					              <img src="images/constituteCompensation.gif" width="175" height="33" border="0"></a></td>
					            </tr>
			          		</table>
			          </td>
			        </tr>
		      </table>
				   <%@include file="index_down.jsp"%>
    		</td>
  		</tr>
	</table>
  </body>
</html>
