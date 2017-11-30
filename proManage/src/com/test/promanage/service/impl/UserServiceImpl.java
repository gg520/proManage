package com.test.promanage.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.promanage.mapper.TableAdminMapper;
import com.test.promanage.mapper.TableUserMapper;
import com.test.promanage.po.TableAdmin;
import com.test.promanage.po.TableAdminExample;
import com.test.promanage.po.TableUser;
import com.test.promanage.po.TableUserExample;
import com.test.promanage.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	TableAdminMapper tableAdminMapper;
	@Autowired
	TableUserMapper tableUserMapper;
	@Override
	public TableAdmin selectAdmin(String id,String password) throws Exception {
		
		TableAdminExample example=new TableAdminExample();
		example.createCriteria().andAdminIdEqualTo(id).andPasswordEqualTo(password);
		List<TableAdmin> tableAdmins=tableAdminMapper.selectByExample(example);
		if(tableAdmins!=null&&tableAdmins.size()>0){
			return tableAdmins.get(0);
		}
		return null;
	}
	@Override
	public TableUser selectUser(String id, String password) throws Exception {
		TableUserExample example=new TableUserExample();
		example.createCriteria().andUseridEqualTo(id).andPasswordEqualTo(password);
		List<TableUser>tableUsers=tableUserMapper.selectByExample(example);
		if(tableUsers!=null&&tableUsers.size()>0){
			return tableUsers.get(0);
		}
		return null;
	}

}
