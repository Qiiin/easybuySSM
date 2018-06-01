<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <%@ include file="/common/pre/header.jsp" %>
    <script type="text/javascript" src="${ctx}/statics/js/common/n_nav.js"></script>
    <script src="${ctx}/statics/js/cart/cart.js"></script>
    <title>易买网</title>
</head>
<body>
<!--Begin Header Begin-->
<div id="searchBar">
    <%@ include file="/common/pre/searchBar.jsp" %>
</div>
<!--End Header End-->
<!--Begin Menu Begin-->
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <%@ include file="/common/pre/categoryBar.jsp" %>
        <!--End 商品分类详情 End-->
    </div>
</div>
<!--End Menu End-->
<div class="i_bg">
    <div class="postion">
    </div>
    <div class="content">
        <div id="tsShopContainer">
            <div id="tsImgS">
                <a href="${ctx}/files/${product.fileName}" title="Images" class="MagicZoom" id="MagicZoom">
                    <img src="${ctx}/files/${product.fileName}" width="390" height="390"/>
                </a>
            </div>
        </div>
        <div class="pro_des">
            <div class="des_name">
                <input type="hidden" value="${product.id}"  name="entityId" class="n_ipt"/>
                <p>${product.name}</p>
                “开业巨惠，北京专柜直供”，不光低价，“真”才靠谱！
            </div>
            <div class="des_price">
                本店价格：<b>￥${product.price}</b><br/>
            </div>
           <div class="des_price">
                库存：<b>${product.stock}</b><br/>
            </div>
            <!-- <div class="des_choice">
                <span class="fl">型号选择：</span>
                <ul>
                    <li class="checked">30ml
                        <div class="ch_img"></div>
                    </li>
                    <li>50ml
                        <div class="ch_img"></div>
                    </li>
                    <li>100ml
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div>
            <div class="des_choice">
                <span class="fl">颜色选择：</span>
                <ul>
                    <li>红色
                        <div class="ch_img"></div>
                    </li>
                    <li class="checked">白色
                        <div class="ch_img"></div>
                    </li>
                    <li>黑色
                        <div class="ch_img"></div>
                    </li>
                </ul>
            </div> -->
            <br>
            <div class="des_join">
                <div class="j_nums">
                    <input type="text"   value="1"  name="quantity" class="n_ipt"/>
                    <input type="button" value="" onclick="addUpdate(jq(this));" class="n_btn_1"/>
                    <input type="button" value="" onclick="jianUpdate(jq(this));" class="n_btn_2"/>
                    <input type="hidden" name="productStock" value="${product.stock}">
                </div>
                <span class="fl">
                     <img src="${ctx}/statics/images/j_car.png" onclick="addShoppingCartItemByParam(${product.id},1);"/>
                </span>
            </div>
        </div>
    </div>
    <div class="content mar_20">
        <div id="favoriteList">
        </div>
        <div class="l_list">
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">
                    <table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;"
                           cellspacing="0" cellpadding="0">
                        <tr>
                            <td>商品名称：${product.name}</td>
                            <td>商品价格：${product.price}</td>
                            <td>品牌： Apple</td>                       
                        	<td>上架时间：${product.createTime}</td>
                        </tr>
                        <tr>
                            <td>商品毛重：160.00g</td>
                            <td>商品产地：美国</td>
                        </tr>   
                        <tr>
                        	<td>&nbsp;</td> 
                        </tr>                    
                    </table>
                </div>
            </div>
            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                    <table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>
                                ${product.describe}
                            </td>
                        </tr>
                    </table>
                    <p align="center">
                        <img src="${ctx}/files/${product.fileName}" width="185" height="155">
                    </p>
                </div>
            </div>
        </div>
    </div>
    <script>
        favoriteList();
    </script>
    <!--End 弹出层-收藏成功 End-->
    <%@ include file="/common/pre/footer.jsp" %>
    <!--Begin 弹出层-加入购物车 Begin-->
</div>
</body>
<script type="text/javascript">
	function addShoppingCartItemByParam(entityId,quantity){
	    $.ajax({
	        "url":"CartServlet",
	        "data":{
	            "action":"addShoppingItem",
	            "entityId":entityId,
	            "quantity":quantity
	        },
	        "dataType":"json",
	        "method":"post",
	        "success":function(data){
	        	 alert("已添加到购物车");
	        	queryShoppingCart();  		 
	        }
	    }); 
	};
	
	
	function queryShoppingCart(){
		$.ajax({
				"url":"CartServlet",
				"type":"get",
				"data":{
					"action":"queryShoppingCartItem"
				},
				"dataType":"json",
				"success":function(data){					
					var itemCount = data.length;					
					if(data.length>0){
						$(".car_t").html("购物车["+itemCount+"]");
					}else{
						$(".car_t").html("购物车[空]");
					};
					$(".cars").empty();
					$(data).each(function(){
					$(".cars").append(
					"<li>"
                      + "<div class=\"img\"><a href=\"easybuySSM/pre/productServlet?action=getProductDetail&id="+this.product.id+"\"><img src=\"../files/"+this.product.fileName+"\" width=\"58\" height=\"58\" /></a></div>" 
                      +"<div class=\"name\"><a href=\"easybuySSM/pre/productServlet?action=getProductDetail&id="+this.product.id+"\">"+this.product.name+"</a></div>"  
                      + "<div class=\"price\"><font color=\"#ff4e00\">￥"+this.product.price+"</font> X"+this.quantity+"</div>"
                    +"</li>");
					});				
				}		
			});
	};
	
</script>
</html>
