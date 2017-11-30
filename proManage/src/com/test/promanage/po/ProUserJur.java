package com.test.promanage.po;

public class ProUserJur {
    private Integer id;

    private String projectId;

    private String userId;

    private Integer jurId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId == null ? null : projectId.trim();
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId == null ? null : userId.trim();
    }

    public Integer getJurId() {
        return jurId;
    }

    public void setJurId(Integer jurId) {
        this.jurId = jurId;
    }
}