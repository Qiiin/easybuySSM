package com.easybuy.service.user;

import com.easybuy.dao.user.UserMapper;
import com.easybuy.entity.User;
import com.easybuy.util.MD5Util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired(required=false)
	private UserMapper userMapper;
	
	@Override
	public boolean addUser(User user) {
		boolean flag=false;
		//设置如果没有设置类型,则默认为3
		if (user.getType()==0) {
			user.setType(3);
		}
		int num=userMapper.addUser(user);
		if (num>0) {
			flag=true;
		}
		return flag;
	}

	@Override
	public boolean deleteUserByLoginName(String loginName) {
		boolean flag=false;
		int num=userMapper.deleteUserByLoginName(loginName);
		if (num>0) {
			flag=true;
		}
		return flag;
	}

	@Override
	public boolean updateUser(User user) {
		boolean flag=false;
		int num=userMapper.updateUser(user);
		if (num>0) {
			flag=true;
		}
		return flag;
	}

	@Transactional(readOnly=true)
	@Override
	public List<User> listUserByType(String typeName ) {
		List<User> list=new ArrayList<>();
		int type=0;
		if ("管理员".equals(typeName)) {
			type=1;
		} else if("商户".equals(typeName)){
			type=2;
		}else if("普通用户".equals(typeName)){
			type=3;			
		}				
		list= userMapper.listUserByType(type);		
		return list;
	}

	
	@Override
	public List<User> getAllAdmin() {
		
				
		return null;
	}
	
	@Transactional(readOnly=true)
	@Override
	public User getUserById(int id) {
		
		User user =userMapper.getUserById(id);	
		return user;
	}

	@Override
	public boolean check(String type, String value) {
		boolean flag=false;
		//根据不同的情况验证不同的方法
		//TODO 可能存在方法的优化
		User user=null;
		if ("loginNameCheck".equals(type)) {
			System.out.println("name");
			user=userMapper.getUserByLoginName(value);
			System.out.println("name2");
		} else if("emailCheck".equals(type)){
			System.out.println("email");
			user=userMapper.getUserByEmail(value);
		}else if ("phoneCheck".equals(type)) {
			user=userMapper.getUserByPhone(value);
		}		
		//如果没有获得用户则验证通过
		if (user==null) {
			flag=true;
		}else{
			System.out.println(user);
			System.out.println(user.getLoginName());
		}
		return flag;
	}
	@Test
	public void TestCheck(){
		ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext-public.xml");
		
		UserMapper userMapper=(UserMapper) ctx.getBean("userMapper");
		//User user= userMapper.getUserByLoginName("g111");
		User user=userMapper.getUserByEmail("qq@qq.com");
		if (user!=null) {
			System.out.println(user.getLoginName());
		} else {
			System.out.println("null");
		}
	}
	
	@Transactional(readOnly=true)
	@Override
	public User loginCheck(String loginName, String password) {
		String passwordMd5=MD5Util.md5Hex(password);
		User user=userMapper.getLogin(loginName, passwordMd5);	
		return user;
	}
	
	@Transactional(readOnly=true)
	@Override
	public int getTotalCount() throws SQLException {
		int count=userMapper.getTotalCount();
		return count;
	}

	@Override
	public List<User> findUserByPage(int pageSize, int currentPage) {
		
		
		
		return null;
	}

	@Override
	public List<User> getListUser(Integer startIndex, Integer pageSize) {
		List<User> list=userMapper.getListUser(startIndex,pageSize);
		return list;
	}

}
