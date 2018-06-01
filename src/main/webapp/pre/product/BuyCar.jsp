<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<!--Begin Header Begin-->
		<%@ include file="/common/pre/header.jsp" %>
	<!--Begin Header Begin-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link type="text/css" rel="stylesheet" href="${ctx}/statics/css/style.css" />
		<title>易买网</title>
	</head>
	<body>  

	<!--Begin Menu Begin-->
		<div id="searchBar">
	    	<%@ include file="/common/pre/searchBar.jsp" %>
		</div>
		
	<div class="menu_bg">
	    <div class="menu">
	        <!--Begin 商品分类详情 Begin-->
	        <%@ include file="/common/pre/categoryBar.jsp" %>
	        <!--End 商品分类详情 End-->
	    </div>
	</div>
	<!--End Menu End-->
	<!--End Menu End--> 
	<div class="i_bg">  
	    <div class="content mar_20">
	    	<img src="../statics/images/img1.jpg" />        
	    </div>
	    <!--Begin 第一步：查看购物车 Begin -->
	    <div class="content mar_20">
	    	<table border="0" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
	          <tr>
	            <td class="car_th" width="250">商品名称</td>
	            <td class="car_th" width="440">描述</td>
	            <td class="car_th" width="150">购买数量</td>
	            <td class="car_th" width="130">单价</td>
	            <td class="car_th" width="150">操作</td>
	          </tr>
	          
	          <c:forEach items="${sessionScope.cart.items}" var="temp" varStatus="status">
	          	<tr class="car_tr">
	            <td>
	            	<div class="c_s_img"><img src="${ctx}/files/${temp.product.fileName}" width="73" height="73" /></div>
	                ${temp.product.name}
	            </td>
	            <td align="center">${temp.product.describe}</td>
	            <td align="center">
	            	<div class="c_num">
	                    <input type="button" value="" onclick="calculate(jq(this),${temp.product.id});" class="car_btn_1" />
	                	<input type="text" value="${temp.quantity}" name="" class="car_ipt" />  
	                    <input type="button" value="" onclick="calculate1(jq(this),${temp.product.id});" class="car_btn_2" />
	                </div>
	            </td>
	            <td align="center" style="color:#ff4e00;">￥${temp.product.price}</td>
	            <td align="center"><a href="javascript:void(0);" onclick="removeShoppingCartItem(${temp.product.id});">删除</a></td>
	          </tr>
	          
	          </c:forEach>
	          <%@ include file="/common/pre/pagerBar.jsp" %>
	          <c:if test="${sessionScope.cart.items.size()!=0}">
	    		<tr height="70">
	          	<td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
	            	<label class="r_rad"><input type="checkbox" name="clear" checked="checked" /></label><label class="r_txt">清空购物车</label>
	                <span class="fr">商品总价：
	                	<b style="font-size:22px; color:#ff4e00;">
	                		￥${sessionScope.cart.sum}
	                	</b>
	                </span>
	            </td>
	          </tr>
	          
	          <tr valign="top" height="150">
	          	<td colspan="6" align="right">
	            	<a href="${ctx}/home?action=index"><img src="../statics/images/buy1.gif" /></a>&nbsp; &nbsp; <a href="/easybuySSM/pre/OrderServlet?action=toOrder&userId=${sessionScope.loginUser.id}"><img src="../statics/images/buy2.gif" /></a>
	            </td>
	          </tr>
	          </c:if>
	        </table>
	        
	    </div>
		<!--End 第一步：查看购物车 End--> 
	    <!--Begin 弹出层-删除商品 Begin-->
	    <div id="fade" class="black_overlay"></div>
	    <div id="MyDiv" class="white_content">             
	        <div class="white_d">
	            <div class="notice_t">
	                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="../statics/images/close.gif" /></span>
	            </div>
	            <div class="notice_c">
	           		
	                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
	                  <tr valign="top">
	                    <td>您确定要把该商品移除购物车吗？</td>
	                  </tr>
	                  <tr height="50" valign="bottom">
	                    <td><a href="#" class="b_sure">确定</a><a href="#" class="b_buy">取消</a></td>
	                  </tr>
	                </table>
	                    
	            </div>
	        </div>
	    </div>    
	    <!--End 弹出层-删除商品 End-->
	    
	    
	    <!--Begin Footer Begin -->
	    <div class="b_btm_bg bg_color">
	        <div class="b_btm">
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="../statics/images/b1.png" width="62" height="62" /></td>
	                <td><h2>正品保障</h2>正品行货  放心购买</td>
	              </tr>
	            </table>
				<table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="../statics/images/b2.png" width="62" height="62" /></td>
	                <td><h2>满38包邮</h2>满38包邮 免运费</td>
	              </tr>
	            </table>
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="../statics/images/b3.png" width="62" height="62" /></td>
	                <td><h2>天天低价</h2>天天低价 畅选无忧</td>
	              </tr>
	            </table>
	            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
	              <tr>
	                <td width="72"><img src="../statics/images/b4.png" width="62" height="62" /></td>
	                <td><h2>准时送达</h2>收货时间由你做主</td>
	              </tr>
	            </table>
	        </div>
	    </div>
	    <div class="b_nav">
	    	<dl>                                                                                            
	        	<dt><a href="${ctx}/pre/OrderServlet?action=toOrderManage&userId=${sessionScope.loginUser.id}">新手上路</a></dt>
	            <dd><a href="#">售后流程</a></dd>
	            <dd><a href="#">购物流程</a></dd>
	            <dd><a href="#">订购方式</a></dd>
	            <dd><a href="#">隐私声明</a></dd>
	            <dd><a href="#">推荐分享说明</a></dd>
	        </dl>
	        <dl>
	        	<dt><a href="#">配送与支付</a></dt>
	            <dd><a href="#">货到付款区域</a></dd>
	            <dd><a href="#">配送支付查询</a></dd>
	            <dd><a href="#">支付方式说明</a></dd>
	        </dl>
	        <dl>
	        	<dt><a href="#">会员中心</a></dt>
	            <dd><a href="#">资金管理</a></dd>
	            <dd><a href="#">我的收藏</a></dd>
	            <dd><a href="#">我的订单</a></dd>
	        </dl>
	        <dl>
	        	<dt><a href="#">服务保证</a></dt>
	            <dd><a href="#">退换货原则</a></dd>
	            <dd><a href="#">售后服务保证</a></dd>
	            <dd><a href="#">产品质量保证</a></dd>
	        </dl>
	        <dl>
	        	<dt><a href="#">联系我们</a></dt>
	            <dd><a href="#">网站故障报告</a></dd>
	            <dd><a href="#">购物咨询</a></dd>
	            <dd><a href="#">投诉与建议</a></dd>
	        </dl>
	        <div class="b_tel_bg">
	        	<a href="#" class="b_sh1">新浪微博</a>            
	        	<a href="#" class="b_sh2">腾讯微博</a>
	            <p>
	            服务热线：<br />
	            <span>400-123-4567</span>
	            </p>
	        </div>
	        <div class="b_er">
	            <div class="b_er_c"><img src="../statics/images/er.gif" width="118" height="118" /></div>
	            <img src="../statics/images/ss.png" />
	        </div>
	    </div>    
	    <div class="btmbg">
			<div class="btm">
	        	备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
	            <img src="../statics/images/b_1.gif" width="98" height="33" /><img src="../statics/images/b_2.gif" width="98" height="33" /><img src="../statics/images/b_3.gif" width="98" height="33" /><img src="../statics/images/b_4.gif" width="98" height="33" /><img src="../statics/images/b_5.gif" width="98" height="33" /><img src="../statics/images/b_6.gif" width="98" height="33" />
	        </div>    	
	    </div>
	    <!--End Footer End -->    
	</div>
	<script type="text/javascript">	
		function removeShoppingCartItem(entityId){
	/*  			ShowDiv("MyDiv","fade");
	 */ 			jq.ajax({
					"url":"CartServlet",
					"type":"get",
					"data":{
						"id":entityId,
						"action":"removeShoppingCartItem"
					},
					"dataType":"json",
					"success":success	
				});
				
	/* 			$.post("CarServlet",false,"action=removeItem&id="+entityId,success,"text");
	 */
		};
		function success(data){
	/* 		$(".car_tab").html(data);
	 */		//$.post("CarServlet","action=toSettlement","html");
	 		jq(".car_tab").empty();
	 		jq(".car_tab").append(	
	 		"<tr>"
	            +"<td class=\"car_th\" width=\"490\">商品名称</td>"
	            +"<td class=\"car_th\" width=\"140\">属性</td>"
	            +"<td class=\"car_th\" width=\"150\">购买数量</td>"
	            +"<td class=\"car_th\" width=\"130\">单价</td>"
	            +"<td class=\"car_th\" width=\"140\">返还积分</td>"
	            +"<td class=\"car_th\" width=\"150\">操作</td>"
	         +"</tr>");
	         var sum =0.0;
	 		jq(data).each(function(){
	 			jq(".car_tab").append(
	 			"<tr class=\"car_tr\">"
	            +"<td>"
	            	+"<div class=\"c_s_img\"><img src=\"../statics/images/c_2.jpg\" width=\"73\" height=\"73\" /></div>"
	               +"Rio 锐澳 水蜜桃味白兰地鸡尾酒（预调酒） 275ml"+this.product.name+this.product.describle
	            +"</td>"
	            
	             +" <td align=\"center\">颜色：灰色</td>"
	          	+ "<td align=\"center\">"
	            	+"<div class=\"c_num\">"
	                   +" <input type=\"button\" value=\"\" onclick=\"calculate(jq(this),"+this.product.id+");\" class=\"car_btn_1\" />"
	                	+"<input type=\"text\" value=\""+this.quantity+"\"name=\"\" class=\"car_ipt\" />" 
	                   +"<input type=\"button\" value=\"\" onclick=\"calculate1(jq(this),"+this.product.id+");\" class=\"car_btn_2\" />"
	              +"</div>"  
	           +"</td>"
	              + "<td align=\"center\" style=\"color:#ff4e00;\">￥"+this.product.price+"</td>"
	            +"<td align=\"center\">26R</td>"
	            +"<td align=\"center\"><a href=\"javascript:void(0);\" onclick=\"removeShoppingCartItem("+this.product.id+");\">删除</a>&nbsp; &nbsp;<a href=\"#\">加入收藏</a></td>"  
	            +"</tr>"); 
	            sum =sum+this.cost;  
	 			
	 		});
	 		jq(".car_tab").append(
	 				"<tr height=\"70\">"
	          	+"<td colspan=\"6\" style=\"font-family:'Microsoft YaHei'; border-bottom:0;\">"
	            	+"<label class=\"r_rad\"><input type=\"checkbox\" name=\"clear\" checked=\"checked\" /></label><label class=\"r_txt\">清空购物车</label>"
	               +"<span class=\"fr\">商品总价：<b style=\"font-size:22px; color:#ff4e00;\">￥"+sum+"</b></span>"
	           +" </td>"
	         +" </tr>"
	 		
	 		 +"<tr valign=\"top\" height=\"150\">"
	          	+"<td colspan=\"6\" align=\"right\">"
	            +"<a href=\"${ctx}/home?action=index\"><img src=\"../statics/images/buy1.gif\" /></a>&nbsp; &nbsp; <a href=\"/easybuySSM/pre/product/buycar_two.jsp\"><img src=\"../statics/images/buy2.gif\" /></a>"
	            +"</td>"
	         +"</tr>"
	 		);
		}
		/*商品数量减少*/
		
		function calculate(jian,id){
			jianUpdate1(jian);
			var quantity =jian.parent().find(".car_ipt").val();
	/* 		alert("quantity"+quantity+"entityId"+id);
	 */		jq.ajax({
				"url":"CartServlet",
				"type":"post",
				"data":{	"quantity":quantity,
							"entityId":id,
							"action":"modifyShoppingCartItem"
						},
				"dataType":"json",
				"success":function(data){
				jq(".car_tab").find(".fr").children("b").html("￥"+data.toFixed(1));
				}
			});
		};
	
	/*商品数量增加 */
		function calculate1(jia,id){
			addUpdate1(jia);
			var quantity =jia.parent().find(".car_ipt").val();
	/* 		alert("quantity"+quantity+"entityId"+id);
	 */		jq.ajax({
				"url":"CartServlet",
				"type":"post",
				"data":{	"quantity":quantity,
							"entityId":id,
							"action":"modifyShoppingCartItem"
						},
				"dataType":"json",
				"success":function(data){
					jq(".car_tab").find(".fr").children("b").html("￥"+data.toFixed(1));
				}
			});
		}
		function toSettlement2(){
			jq.ajax({
				"url":"CartServlet",
				"data":{
					"action":"toSettlement2"
				},
				"dataType":"json",
				"success":function(data){
					alert(data);
				}
			});
		}
	</script>
	</body>
</html>
