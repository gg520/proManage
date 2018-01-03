package com.test.promanage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.TableAdmin;
import com.test.promanage.po.TableUser;
@Service
public interface UserService {

	/**
	 * 查找管理员用户
	 * @author guosuzhou
	 * 
	 * @param id
	 * @param password
	 * @return
	 * @throws Exception
	 */
	TableAdmin selectAdmin(String id,String password)throws Exception;
	
	/**
	 * 查找普通用户
	 * @author guosuzhou
	 * 
	 * @param id
	 * @param password
	 * @return
	 * @throws Exception
	 */
	TableUser selectUser(String id,String password)throws Exception;
	
	int selectUserById(String uid)throws Exception;
}
