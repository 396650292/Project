<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.scme.db.DBConnection"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'trains_xqquery.jsp' starting page</title>
    
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
  String sql="select * from train where id=? ";
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
			            	<span style="text-decoration:none;" >培训管理</span>
			              &gt;<span style="text-decoration:none;" >查看培训详情</span>
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
                		<table width="400" border="1" align="center" cellpadding="0" cellspacing="0">
              
  						<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">培训人:</td>			  						  				
		  				<td><%=rs.getString("trainer")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">培训主题:</td>			  						  				
		  				<td><%=rs.getString("train_theme")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">培训宗旨:</td>			  						  				
		  				<td><%=rs.getString("train_aim")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">培训时间:</td>			  						  				
		  				<td><%=rs.getString("train_time")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">培训地点:</td>			  						  				
		  				<td><%=rs.getString("train_address")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">参加人员:</td>			  						  				
		  				<td><%=rs.getString("attendee")%></td>
		  				</tr>
		  				<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">备注信息:</td>			  						  				
		  				<td><%=rs.getString("train_remarks")%></td>
		  				</tr>
		  			
				   		
                   		<tr  height="40px">
                  		<td align="center" colspan="2">
                  		<a href="trains_query.jsp" style="text-decoration:none;"><input type="button" name="fh" value="返回"/></a>
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
