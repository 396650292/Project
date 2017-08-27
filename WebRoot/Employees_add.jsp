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
    
    <title>My JSP 'Employees_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
	<style type="text/css">  
select  
{  
width: 135px;  
}  
fieldset dl dd  
{  
float: left;  
margin-left: 20px;  
}  
fieldset pre  
{  
width: 100%;  
height: 400px;  
overflow-y: scroll;  
overflow-x: hidden;  
}  
</style> 
<script type="text/javascript">
		function isDate(dateString){
		  if(dateString.trim()=="")return true;
		  var r=dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/); 
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
			var str1=document.getElementById("birthday");
			var str2=document.getElementById("regist_time");
			
			isDate(str1.value);
			
//设置省份数据  
setProvince();  
  
//设置背景颜色  
setBgColor();
});
		
		
//定义数组，存储省份信息  
var province = ["北京", "上海", "天津", "重庆", "浙江", "江苏", "广东", "福建", "湖南", "湖北", "辽宁",  
"吉林", "黑龙江", "河北", "河南", "山东", "陕西", "甘肃", "新疆", "青海", "山西", "四川",  
"贵州", "安徽", "江西", "云南", "内蒙古", "西藏", "广西", "宁夏", "海南", "香港", "澳门", "台湾"];  
  
//定义数组,存储城市信息  
var beijing = ["东城区", "西城区", "海淀区", "朝阳区", "丰台区", "石景山区", "通州区", "顺义区", "房山区", "大兴区", "昌平区", "怀柔区", "平谷区", "门头沟区", "延庆县", "密云县"];  
var shanghai = ["浦东新区", "徐汇区", "长宁区", "普陀区", "闸北区", "虹口区", "杨浦区", "黄浦区", "卢湾区", "静安区", "宝山区", "闵行区", "嘉定区", "金山区", "松江区", "青浦区", "南汇区", "奉贤区", "崇明县"];  
var tianjing = ["河东", "南开", "河西", "河北", "和平", "红桥", "东丽", "津南", "西青", "北辰", "塘沽", "汉沽", "大港", "蓟县", "宝坻", "宁河", "静海", "武清"];  
var chongqing = ["渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "万盛区", "双桥区", "渝北区", "巴南区", "万州区", "涪陵区", "黔江区", "长寿区", "江津区", "合川区", "永川区", "南川区"];  
var jiangsu = ["南京", "无锡", "常州", "徐州", "苏州", "南通", "连云港", "淮安", "扬州", "盐城", "镇江", "泰州", "宿迁"];  
var zhejiang = ["杭州", "宁波", "温州", "嘉兴", "湖州", "绍兴", "金华", "衢州", "舟山", "台州", "利水"];  
var guangdong = ["广州", "韶关", "深圳", "珠海", "汕头", "佛山", "江门", "湛江", "茂名", "肇庆", "惠州", "梅州", "汕尾", "河源", "阳江", "清远", "东莞", "中山", "潮州", "揭阳"];  
var fujiang = ["福州", "厦门", "莆田", "三明", "泉州", "漳州", "南平", "龙岩", "宁德"];  
var hunan = ["长沙", "株洲", "湘潭", "衡阳", "邵阳", "岳阳", "常德", "张家界", "益阳", "郴州", "永州", "怀化", "娄底", "湘西土家苗族自治区"];  
var hubei = ["武汉", "襄阳", "黄石", "十堰", "宜昌", "鄂州", "荆门", "孝感", "荆州", "黄冈", "咸宁", "随州", "恩施土家族苗族自治州"];  
var liaoning = ["沈阳", "大连", "鞍山", "抚顺", "本溪", "丹东", "锦州", "营口", "阜新", "辽阳", "盘锦", "铁岭", "朝阳", "葫芦岛"];  
var jilin = ["长春", "吉林", "四平", "辽源", "通化", "白山", "松原", "白城", "延边朝鲜族自治区"];  
var heilongjiang = ["哈尔滨", "齐齐哈尔", "鸡西", "牡丹江", "佳木斯", "大庆", "伊春", "黑河", "大兴安岭"];  
var hebei = ["石家庄", "保定", "唐山", "邯郸", "承德", "廊坊", "衡水", "秦皇岛", "张家口"];  
var henan = ["郑州", "洛阳", "商丘", "安阳", "南阳", "开封", "平顶山", "焦作", "新乡", "鹤壁", "许昌", "漯河", "三门峡", "信阳", "周口", "驻马店", "济源"];  
var shandong = ["济南", "青岛", "菏泽", "淄博", "枣庄", "东营", "烟台", "潍坊", "济宁", "泰安", "威海", "日照", "滨州", "德州", "聊城", "临沂"];  
var shangxi = ["西安", "宝鸡", "咸阳", "渭南", "铜川", "延安", "榆林", "汉中", "安康", "商洛"];  
var gansu = ["兰州", "嘉峪关", "金昌", "金川", "白银", "天水", "武威", "张掖", "酒泉", "平凉", "庆阳", "定西", "陇南", "临夏", "合作"];  
var qinghai = ["西宁", "海东地区", "海北藏族自治州", "黄南藏族自治州", "海南藏族自治州", "果洛藏族自治州", "玉树藏族自治州", "海西蒙古族藏族自治州"];  
var xinjiang = ["乌鲁木齐", "奎屯", "石河子", "昌吉", "吐鲁番", "库尔勒", "阿克苏", "喀什", "伊宁", "克拉玛依", "塔城", "哈密", "和田", "阿勒泰", "阿图什", "博乐"];  
var shanxi = ["太原", "大同", "阳泉", "长治", "晋城", "朔州", "晋中", "运城", "忻州", "临汾", "吕梁"];  
var sichuan = ["成都", "自贡", "攀枝花", "泸州", "德阳", "绵阳", "广元", "遂宁", "内江", "乐山", "南充", "眉山", "宜宾", "广安", "达州", "雅安", "巴中", "资阳", "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州"];  
var guizhou = ["贵阳", "六盘水", "遵义", "安顺", "黔南布依族苗族自治州", "黔西南布依族苗族自治州", "黔东南苗族侗族自治州", "铜仁", "毕节"];  
var anhui = ["合肥", "芜湖", "安庆", "马鞍山", "阜阳", "六安", "滁州", "宿州", "蚌埠", "巢湖", "淮南", "宣城", "亳州", "淮北", "铜陵", "黄山", "池州"];  
var jiangxi = ["南昌", "九江", "景德镇", "萍乡", "新余", "鹰潭", "赣州", "宜春", "上饶", "吉安", "抚州"];  
var yunnan = ["昆明", "曲靖", "玉溪", "保山", "昭通", "丽江", "普洱", "临沧", "楚雄彝族自治州", "大理白族自治州", "红河哈尼族彝族自治州", "文山壮族苗族自治州", "西双版纳傣族自治州", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "迪庆藏族自治州"];  
var neimenggu = ["呼和浩特", "包头", "乌海", "赤峰", "通辽", "鄂尔多斯", "呼伦贝尔", "巴彦淖尔", "乌兰察布"];  
var guangxi = ["南宁", "柳州", "桂林", "梧州", "北海", "防城港", "钦州", "贵港", "玉林", "百色", "贺州", "河池", "崇左"];  
var xizang = ["拉萨", "昌都地区", "林芝地区", "山南地区", "日喀则地区", "那曲地区", "阿里地区"];  
var ningxia = ["银川", "石嘴山", "吴忠", "固原", "中卫"];  
var hainan = ["海口", "三亚"];  
var xianggang = ["中西区", "湾仔区", "东区", "南区", "九龙城区", "油尖旺区", "观塘区", "黄大仙区", "深水埗区", "北区", "大埔区", "沙田区", "西贡区", "元朗区", "屯门区", "荃湾区", "葵青区", "离岛区"];  
var taiwan = ["台北", "高雄", "基隆", "台中", "台南", "新竹", "嘉义"];  
var aomeng = ["澳门半岛", "氹仔岛", "路环岛"];  
  

  
//设置省份数据  
function setProvince() {  
//给省份下拉列表赋值  
var option, modelVal;  
var $sel = $("#selProvince");  
  
//获取对应省份城市  
for (var i = 0, len = province.length; i < len; i++) {  
modelVal = province[i];  
option = "<option value='" + modelVal + "'>" + modelVal + "</option>";  
  
//添加到 select 元素中  
$sel.append(option);  
}  
  
//调用change事件，初始城市信息  
provinceChange();  
}  
  
  
//根据选中的省份获取对应的城市  
function setCity(provinec) {  
var $city = $("#selCity");  
var proCity, option, modelVal;  
  
//通过省份名称，获取省份对应城市的数组名  
switch (provinec) {  
case "北京":  
proCity = beijing;  
break;  
case "上海":  
proCity = shanghai;  
break;  
case "天津":  
proCity = tianjing;  
break;  
case "重庆":  
proCity = chongqing;  
break;  
case "浙江":  
proCity = zhejiang;  
break;  
case "江苏":  
proCity = jiangsu;  
break;  
case "广东":  
proCity = guangdong;  
break;  
case "福建":  
proCity = fujiang;  
break;  
case "湖南":  
proCity = hunan;  
break;  
case "湖北":  
proCity = hubei;  
break;  
case "辽宁":  
proCity = liaoning;  
break;  
case "吉林":  
proCity = jilin;  
break;  
case "黑龙江":  
proCity = heilongjiang;  
break;  
case "河北":  
proCity = hebei;  
break;  
case "河南":  
proCity = henan;  
break;  
case "山东":  
proCity = shandong;  
break;  
case "陕西":  
proCity = shangxi;  
break;  
case "甘肃":  
proCity = gansu;  
break;  
case "新疆":  
proCity = xinjiang;  
break;  
case "青海":  
proCity = qinghai;  
break;  
case "山西":  
proCity = shanxi;  
break;  
case "四川":  
proCity = sichuan;  
break;  
case "贵州":  
proCity = guizhou;  
break;  
case "安徽":  
proCity = anhui;  
break;  
case "江西":  
proCity = jiangxi;  
break;  
case "云南":  
proCity = yunnan;  
break;  
case "内蒙古":  
proCity = neimenggu;  
break;  
case "西藏":  
proCity = xizang;  
break;  
case "广西":  
proCity = guangxi;  
break;  
case "":  
proCity = xizang;  
break;  
case "宁夏":  
proCity = ningxia;  
break;  
case "海南":  
proCity = hainan;  
break;  
case "香港":  
proCity = xianggang;  
break;  
case "澳门":  
proCity = aomeng;  
break;  
case "台湾":  
proCity = taiwan;  
break;  
}  
  
//先清空之前绑定的值  
$city.empty();  
  
//设置对应省份的城市  
for (var i = 0, len = proCity.length; i < len; i++) {  
modelVal = proCity[i];  
option = "<option value='" + modelVal + "'>" + modelVal + "</option>";  
  
//添加  
$city.append(option);  
}  
  
//设置背景  
setBgColor();  
}  
  
  
//省份选中事件  
function provinceChange() {  
var $pro = $("#selProvince");  
setCity($pro.val());  
}  
  
  
//设置下拉列表间隔背景样色  
function setBgColor() {  
var $option = $("select option:odd");  
$option.css({ "background-color": "#DEDEDE" });  
}  
</script>  
  <script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script></head>
  <%
  	request.setCharacterEncoding("utf-8");
   	response.setCharacterEncoding("utf-8");
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
			              &gt;<span style="text-decoration:none;" >应聘人员录用</span>
			              </font>
			              </td>
			       		</tr>
			     		</table>
					</td>
					</tr>
					</table>
    			<table width="801" height="436" border="0" cellpadding="0" cellspacing="0" background="images/center2.jpg">
					<tr height="436" valign="top" align="center">
						<td>
						<form action="AddServlets?table=employee" method="post">
                		<table  width="517" border="1" align="center" cellpadding="1" cellspacing="1">
              
  						<tr>
  					    <td  width="100" align="center" bordercolor="#FFFFFF" bgcolor="66583D">姓名</td>			  						  				
		  				<td><input type="text" name="name" required></td>
		  				<td width="100" align="center" bordercolor="#FFFFFF" bgcolor="66583D">性别</td>
		  				<td >&nbsp;<input type="radio" name="sex" checked="true" value="男"/>男
		  						   <input type="radio" name="sex" value="女"/>女
		  				</td>	
		  					
		  				</tr>
		  				
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D" required>年龄</td>
		  				<td ><input type="text" name="age" value=""  required/></td>		  
                  		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">出生日期</td>
		  				<td ><input type="text" name="birthday" id="birthday" value="" onClick="WdatePicker()"/></td>	
                   		</tr>
                   
                   		<tr>
                   		    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">应聘职位</td>
                   			<td ><select name="position" style="width: 70px";>
                   		<%
                   		String sql="select DISTINCT(position) from club";
						DBConnection db=new DBConnection();
						ResultSet rs=db.query(sql, null); 
						while(rs.next()){                  		
                   		 %>
                   		<option value="<%=rs.getString("position") %>"><%=rs.getString("position") %></option>
                   		<%}%>
                   		</select>
                   		</td>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">所学专业</td>
                   		<td ><input type="text" name="major" value="" required/></td>
				   		</tr> 
				  
						<tr>
                        <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">工作经验</td>
		  				<td><input type="text" name="work_experience" required /></td>	
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">文化程度</td>
		  				<td>
			  				<select name="degree" style="width: 70px"; >
			  				<option selected="selected" value="本科">本科</option>
			  				<option value="专科">专科</option>
			  				<option value="高中">高中</option>
			  				
			  				</select>
		  				</td>		  
                   		</tr>
                   	<tr>
  					    <td align="center" bordercolor="#FFFFFF" bgcolor="66583D">联系电话</td>			  						  				
		  				<td ><input type="text" name="telphone" maxlength="11" required ></td>		
		  				<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">毕业学校</td>			  						  				
		  				<td  ><input type="text" name="school" required></td>		
		  				</tr>
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">家庭住址</td>
                   		<td  colspan="3" height="10" ><select style="width: 70px";  id="selProvince" onchange="provinceChange();" name="province"></select>省
                   		<select id="selCity" name="city"></select> 市(区)  </td>
                   		</tr>
                   		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">登记时间</td>
                   		<td  width="100" height="10" ><input type="text" name="regist_time" id="regist_time" value="<%=currentDate %>" onClick="WdatePicker()" /></td>
                   		
				   		</tr>  
				  		<tr>
                   		<td align="center" bordercolor="#FFFFFF" bgcolor="66583D">个人简介</td>
                   		<td colspan="3"><textarea style="margin:3px;" cols="40" rows="5" name="biography"></textarea></td>
				   		</tr> 
				   		
                   		<tr  height="40px">
                  		<td align="center" colspan="4">
                  		<input  type="submit" value="保存"/>&nbsp;
                  		<input  type="reset" value="重置"/>&nbsp;
                  		<a href="Employees_query.jsp" style="text-decoration:none;"><input type="button" name="fh" value="返回"/></a>
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
