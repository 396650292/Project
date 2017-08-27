<%@page import="com.scme.db.DBConnection"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Employees_xxquery.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <%
  request.setCharacterEncoding("UTF-8");
  String id=request.getParameter("id");
  DBConnection db=new DBConnection();
  String sql="select * from employee where id=? ";
  ArrayList list=new ArrayList();
  list.add(id); 
  ResultSet rs=db.query(sql, list.toArray());
   %>
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
			            	<span style="text-decoration:none;" >招聘管理</span>
			              &gt;<span style="text-decoration:none;" >应聘人员详细查询</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
    					<%
    						if(rs.next()){
    					
    					 %>
					<tr align="center" height="436" valign="top" align="center">
						<td>
						
                		<table  border="1" align="center" cellpadding="1" cellspacing="1">
              
  						<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">姓名</td>			  						  				
		  				<td><%=rs.getString("name")%></td>
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">性别</td>
		  				<td ><%=rs.getString("sex")%></td>	
		  					
		  				</tr>
		  				
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">年龄</td>
		  				<td><%=rs.getString("age")%></td>		  
                  		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">出生日期</td>
		  				<td ><%=rs.getString("birthday")%></td>	
                   		</tr>
                   
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">应聘职位</td>
                   		<td ><%=rs.getString("position")%></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">所学专业</td>
                   		<td><%=rs.getString("major")%></td>
				   		</tr> 
				  
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">工作经验</td>
		  				<td><%=rs.getString("work_experience")%></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">文化程度</td>
		  				<td><%=rs.getString("degree")%></td>		  
                   		</tr>
                   	<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">联系电话</td>			  						  				
		  				<td><%=rs.getString("telphone")%></td>		
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">毕业学校</td>			  						  				
		  				<td><%=rs.getString("school")%></td>		
		  				</tr>
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">家庭住址</td>
                   		<td><%=rs.getString("address")%></td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记时间</td>
                   		<td ><%=rs.getString("regist_time")%></td>
                   		
				   		</tr>
				   		<tr>
				   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">是否录用</td>
				   		<%if(rs.getString("luyong").equals("录用")){
				   		%>
				   		<td  colspan="3" >未录用</td>	
				   		<%
				   		} else{%>
				   			<td  colspan="3" >已录用</td>
				   		<%} %>
				   		</tr>  
				  		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">个人简介</td>
                   		<td colspan="3"><textarea style="margin:3px;" cols="60" rows="5" name="biography"><%=rs.getString("biography")%></textarea></td>
				   		</tr> 
				   		
                   		<tr  height="40px">
                  		<td align="center" colspan="4">
                  		<a href="Employees_query.jsp" style="text-decoration:none;"><input type="button" name="fh" value="返回"/></a>
                  		</td>
                   		</tr>   		
  						</table>
						</td>
			   		</tr>
			   		<%
                   		}
                   		 %>
			   </table>
    	 <%@include file="index_down.jsp"%>
    </td>
	</tr>  
  </table>
  </body>
</html>
