<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.scme.db.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门添加</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type="text/javascript" src="js/jquery-1.3.2.min.js?self=true"></script>
	<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function isDate(){
		  var str=document.getElementById("creat_date");
		  if(str.trim()=="")return true;
		  var r=str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
		  if(r==null){
		   alert("请输入正确的日期格式,如：2008-08-08\n\r");
		  return false;
		  }
		  var d=new Date(r[1],r[3]-1,r[4]);  
		  var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
		  if(num==0){
		   alert("请输入正确的日期格式,如：2008-08-08\n\r");
		  }
		  return (num!=0);
		 } 
		
		$(function(){
			$("#btn").click(function(){
				isDate();
			});
		
		});
		</script>
  </head>
   <%
   String creat_date=request.getParameter("creat_date");
   session.setAttribute("creat_date", creat_date);
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
			              <span style="text-decoration:none;" >部门管理</span>
			              &gt;<span  style="text-decoration:none;" >部门添加</span>
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
						<form action="AddServlets?table=club" method="post" onsubmit="CheckAdd()">
						<table width="450" cellspacing="1" cellpadding="1" border="1"> 
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">部门名称:</td>
						<td>
						<input type="text" name="club_name" required />
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">职位名称:</td>
						<td>
						<input type="text" name="position" required />
						</td>
						</tr>
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">创建时间:</td>
						<td>
						<input type="text" name="creat_date" onClick="WdatePicker()" id="creat_date" value="" >
						</td>
						</tr>
						
						<tr>
						<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">备注信息:</td>
						<td>
						<input type="text" name="club_remarks" />
						</td>
						</tr>
						
						<tr >
						<td colspan="2" align="center">
						<input type="submit" name="bc" value="保存" id="btn"/>
						<input type="reset" name="cz" value="重置"/>
						<a href="club_query.jsp"><input type="button" name="fh" value="返回"/></a>
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
