<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.scme.db.DBConnection"%>
<%@page import="com.scme.dao.PageDaos"%>
<%@page import="com.scme.pojo.Train"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'trains_query.jsp' starting page</title>
    
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
	    response.setCharacterEncoding("UTF-8");
	    /* 
		 * 动态生成页面界面
		 */	
		 PageDaos page1=new PageDaos();
		
		//定义四个变量
		//数据总条数
		int dataCount=page1.queryCount3();
		//每页数据条数
		int count=5;
		//总页数
		int pages;
		//正好每个页面都放满数据
		if(dataCount%count==0){
			pages=dataCount/count;
		}
		else{
		//最后一个页面未满
			pages=dataCount/count+1;
		}
		//当前页面
		//初始化为1
		int cp=0;
		if(request.getParameter("currentPage")!=null){
			//赋值
			cp=Integer.parseInt(request.getParameter("currentPage"));			
		}
		
		//数组传过去
		ArrayList<Train> list=page1.queryByPage3(cp*count,count);		
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
			              &gt;<span style="text-decoration:none;">培训查询</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					<tr height="436" valign="top" align="center">
						<td align="center">
						<table width="650" cellspacing="1" cellpadding="1" border="1" > 
						<tr bordercolor="#FFFFFF" bgcolor="66583D">
						  <td align="center">编号</td>
			              <td align="center">培训人</td>
			              <td align="center">培训主题</td>
						  <td align="center">培训时间</td>
			              <td align="center">培训地点</td>
			              <td align="center">操作</td>
						</tr>
						<% 
						for(int i=0;i<list.size();i++){
	  					Train t=list.get(i);
						
						%>
		    		<tr>
		    		<td align="center">	
		    		<%=t.getId() %>
		    		</td>
		    		<td align="center">	
		    		<%=t.getTrainer() %>
		    		</td>
		    		<td align="center">	
		    		<%=t.getTrain_theme() %>
		    		</td>
		    		<td align="center">	
		    		<%=t.getTrain_time() %>
		    		</td>
		    		<td align="center">	
		    		<%=t.getTrain_address() %>
		    		</td>
		    		<td align="center">	
		    		<a href="trains_xqquery.jsp?id=<%=t.getId()%>"style="text-decoration:none;">查看培训详情</a>
		    		<a href="DeleteServlets?table=train&&id=<%=t.getId()%>"style="text-decoration:none;">删除</a>
		    		</td>
		    		</tr>
    				<%}%> 
    				<tr>
    				<td colspan="5" align="left" style="border-right-width:0px" cellpadding="0" cellspacing="0">
			  		
					<%if(cp==0){ %>
			  			<a style="text-decoration: none;color:gray; ">首页</a>
			  		<%}else{ %>
			  		<a href="trains_query.jsp?currentPage=0" style="text-decoration: none">首页</a>
					<%}if(cp>0){ %>
					<a href="trains_query.jsp?currentPage=<%=cp-1 %>" style="text-decoration: none">上一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >上一页</a>
					<%} %>
					<%
						if(cp<(pages-1)){
					 %>
					<a href="trains_query.jsp?currentPage=<%=cp+1 %>" style="text-decoration: none">下一页</a>
					<%}else{ %>
					<a style="color:gray; text-decoration: none"  >下一页</a>
					<%}if(cp<(pages-1)){ %>
					<a href="trains_query.jsp?currentPage=<%=pages-1 %>" style="text-decoration: none ">尾页</a>
					<%}else{ %>
						<a  style="text-decoration: none;color:gray">尾页</a>
					<%}if(pages==0){
					 %>
					<a>当前页[<%=cp%>/<%=pages%>]</a>
					<%}else{ %>
					<a>当前页[<%=cp+1%>/<%=pages%>]</a>
					<%} %>
  		</td>
		    		<td align="center" style="border-left-style:none" ><a href="trains_add.jsp" style="text-decoration:none" >添加培训信息</a></td>
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
