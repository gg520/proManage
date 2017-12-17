package com.test.promanage.po;

import java.util.Date;

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
	
	private String userPhoto;
	
	private Date createDate;
	
	private String jur;
	
	private int jurId;
	
	private String proIntro;
	
	private String proRate;
	
	private int proRateId;
	//进度百分比
	private int rate;
	
	private String createUser;
	
	private String createPhoto;

	public int getProRateId() {
		return proRateId;
	}

	public void setProRateId(int proRateId) {
		this.proRateId = proRateId;
	}

	public int getRate() {
		//计算百分比
		
		return 100/4*proRateId;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public void setJurId(int jurId) {
		this.jurId = jurId;
	}

	public int getJurId() {
		return jurId;
	}

	public String getCreatePhoto() {
		return createPhoto;
	}

	public void setCreatePhoto(String createPhoto) {
		this.createPhoto = createPhoto;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}

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
				+ ", userPhoto=" + userPhoto + ", createDate=" + createDate
				+ ", jur=" + jur + ", proIntro=" + proIntro + ", proRate="
				+ proRate + ", createUser=" + createUser + "]";
	}
	
}
