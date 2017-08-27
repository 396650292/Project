<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.scme.dao.PageDaos"%>
<%@page import="com.scme.pojo.User"%>
<%@page import="com.scme.dao.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		 Cookie cs[] = request.getCookies();
		 String account=null;
		 String password=null;
		 String name=null;
		 
		 if(cs!=null){
		 	for(Cookie c:cs){
		 		if(c.getName().equals("account")){
		 		account=c.getValue();
		 		}
		 		if(c.getName().equals("password")){
		 		password=c.getValue();
		 		}
		 	}
		 	if(account!=null && password!=null){
		 		UserDao dao=new UserDao();
			 	if(dao.login(account, password)){
			 		name=account;
			 	}
		 	}
		 }
		
	 %>
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
			              <font color="#FF0000">
			              <span style="text-decoration:none;" >系统管理</span>
			              &gt;<span style="text-decoration:none;" >用户修改</span>
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
						<form action="UpdateServlets?table=user" method="post">
						<table width="450" cellspacing="1" cellpadding="1" border="1"> 
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">账号:</td>
						<td>
						<input type="text" name="account" value="<%=name %>" readonly/>
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">密码:</td>
						<td>
						<input type="text" name="password1" required/>
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">确认密码:</td>
						<td>
						<input type="text" name="password2" value="" required/>
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">级别:</td>
						<td>
						<input type="text" name="rank" value="普通"/>
						
						</td>
						</tr>
						
						<tr >
						<td colspan="2" align="center">
						<input type="submit" name="bc" value="保存"/>
						<input type="reset" name="cz" value="重置"/>
						<a href="user_query.jsp"><input type="button" name="fh" value="返回"/></a>
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
