<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'jc_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script></head>
  
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  <body>
   <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td align="center">
    <%@ include file="index_top.jsp"%>
    				<table width="801" height="48" border="0" cellpadding="0" cellspacing="0" background="images/center1.jpg">
			       	 <tr>
			          <td valign="top">
			          	<table width="494">
			            <tr>
			              <td width="45" height="25">&nbsp;</td>
			              <td width="437" valign="bottom">
			              <!-- 显示栏  获取网页进入路径 -->
			              <font color="#FF0000">
			              <span style="text-decoration:none;" >奖惩管理</span>
			              &gt;<span  style="text-decoration:none;" >奖惩添加</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					<tr align="center" height="436" valign="top" align="center">
						<td>
						<form action="AddServlets?table=eward_punish" method="post">
						<table width="450" cellspacing="1" cellpadding="1" border="1"> 
						<tr>
						<td  width="100" align="center" bordercolor="#FFFFFF" bgcolor="66583D">奖惩题目:</td>
						<td>
						<input type="text" name="theme" required />
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">奖惩类型:</td>
						<td>
						<select name="type">
						<option selected="selected">奖励</option>
						<option>惩罚</option>
						</select>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">奖惩金额:</td>
						<td>
						<input type="text" name="sum" required/>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">奖惩时间:</td>
						<td>
						<input type="text" name="date" value="<%=currentDate %>" onClick="WdatePicker()"/>
						</td>
						</tr>
	
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">奖惩原因:</td>
						<td>
						<textarea style="margin:3px;" cols="37" rows="4" name="reason"></textarea>
						</td>
						</tr>
						
						<tr >
						<td colspan="2" align="center">
						<input type="submit" name="bc" value="保存"/>
						<input type="reset" name="cz" value="重置"/>
						<a href="jc_query.jsp"><input type="button" name="fh" value="返回"/></a>
						</td>
						</tr>
						</table>
						</form>
						</td>
			   		</tr>
			   		
			   </table>
    	 <%@include file="index_down.jsp"%>
    </td>
	</tr>  
  </table>
  </body>
</html>
