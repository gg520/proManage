package com.test.promanage.po;

import java.util.Date;

public class TableVersion {
    private Integer id;

    private String prijectId;

    private String versionName;

    private Date createTime;

    private Integer fileId;

    private String intro;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPrijectId() {
        return prijectId;
    }

    public void setPrijectId(String prijectId) {
        this.prijectId = prijectId == null ? null : prijectId.trim();
    }

    public String getVersionName() {
        return versionName;
    }

    public void setVersionName(String versionName) {
        this.versionName = versionName == null ? null : versionName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro == null ? null : intro.trim();
    }
}