package com.test.promanage.service;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.test.promanage.po.ProUserJur;
import com.test.promanage.po.TableFile;
import com.test.promanage.po.TableTask;
import com.test.promanage.po.TableVersion;

@Service
public interface FileService {
	// 上传文件 向数据库中插入文件的相关信息 只需要知道taskid和userid其他是查询得到
	int insertSelective(TableFile record) throws Exception;

	// 下载文件 根据taskid查找文件路径 找当前任务对应的文件
	TableFile selectFileByExample(int taskid) throws Exception;

	// 下载自己的文件时传递一个文件的id
	TableFile selectMyFileByPrimaryKey(int fileid) throws Exception;

	// 发布新版本时先把文件写入数据库，在读出文件id以便于写入版本表
	TableFile selectFIleForVersion(int flag, Date date, String userid,
			String proid);

	// 查询用户的所有任务
	List<TableTask> selectByExample(String userid);

	// 查询项目的所有任务
	List<TableTask> selectAllTaskByExample(String projectid);

	// 根据用户id和传进来的taskid查找projectid
	TableTask selectTaskByExample(String userid, int taskid);

	// 查询用户在项目内的等级
	ProUserJur selectByExample(String userid, String projectid);

	// 更新任务状态状态
	int updateByPrimaryKeySelective(int taskid, int flag);

	// 查询所有的文件
	List<TableFile> selectMyFilePidUid(String userid, String proid);

	// 更新文件的审核状态
	int updateFileByPrimaryKeySelective(int fileid, int flag);

	// 新版本的发布的添加
	int insertVersionSelective(TableVersion record);

}
