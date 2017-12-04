package com.test.promanage.po;

/**
 * 项目的id，名称，关联人id，关联人姓名，创建时间，权限，项目描述，项目进度,创建人姓名
 * @title TableProjectCustom
 * @author guosuzhou
 *
 * @date 2017年12月4日
 */
public class TableProjectCustom {

	private String proId;
	
	private String proTitle;
	
	private String userId;
	
	private String userName;
	
	private String createDate;
	
	private String jur;
	
	private String proIntro;
	
	private String proRate;
	
	private String createUser;

	public String getProIntro() {
		return proIntro;
	}

	public void setProIntro(String proIntro) {
		this.proIntro = proIntro;
	}

	public String getProRate() {
		return proRate;
	}

	public void setProRate(String proRate) {
		this.proRate = proRate;
	}

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getProId() {
		return proId;
	}

	public void setProId(String proId) {
		this.proId = proId;
	}

	public String getProTitle() {
		return proTitle;
	}

	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getJur() {
		return jur;
	}

	public void setJur(String jur) {
		this.jur = jur;
	}

	@Override
	public String toString() {
		return "TableProjectCustom [proId=" + proId + ", proTitle=" + proTitle
				+ ", userId=" + userId + ", userName=" + userName
				+ ", createDate=" + createDate + ", jur=" + jur + "]";
	}
	
}
