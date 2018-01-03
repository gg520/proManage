package com.test.promanage.pojo;

public class User {

	private String user;
	
	private String userId;
	
	private String userName;
	
	private String userPhoto;

	public User() {
		
	}
	public User(String user,String userId,String userName,String userPhoto){
		this.user=user;
		this.userId=userId;
		this.userName=userName;
		this.userPhoto=userPhoto;
	}
	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhoto() {
		return userPhoto;
	}

	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	
}
