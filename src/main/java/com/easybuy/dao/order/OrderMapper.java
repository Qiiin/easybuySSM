package com.easybuy.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.easybuy.entity.Order;
import com.easybuy.entity.User;
import com.easybuy.entity.UserAddress;
import com.easybuy.util.ShoppingCart;

public interface OrderMapper {
	/**
	 * 添加用户订单
	 * @param user
	 * @param userAddress
	 * @param cart
	 * @return
	 */
	public int addNewOrder(@Param("user") User user,
			@Param("userAddress") UserAddress userAddress,
			@Param("cost") Double cost, @Param("status") Integer status,
			@Param("payType") Integer payType,@Param("serialNumber") String serialNumber);
	
	public List<Order> getAllOrdersByUserId(@Param("userId") Integer userId);
	
	public int updateOrderById(@Param("order") Order order);
	
	public int deleteOrderById(@Param("id") Integer id);
	public Order getOrderById(@Param("id") Integer id);
}
