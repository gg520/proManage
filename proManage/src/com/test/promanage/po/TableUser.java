package com.test.promanage.po;

import javax.validation.constraints.Size;

import com.test.promanage.controller.validation.ValidGroup1;

public class TableUser {
	@Size(min = 8, max = 32, message = "{user.id.length.error}", groups = { ValidGroup1.class })
	private String userid;

	@Size(min = 2, max = 8, message = "{user.name.length.error}", groups = { ValidGroup1.class })
	private String username;

	private String password;

	private String photo;

	private String uid;

	private String intro;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid == null ? null : userid.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo == null ? null : photo.trim();
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid == null ? null : uid.trim();
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro == null ? null : intro.trim();
	}
}