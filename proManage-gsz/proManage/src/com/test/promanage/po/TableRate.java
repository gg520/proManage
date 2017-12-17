package com.test.promanage.po;

public class TableRate {
    private Integer rateid;

    private String ratename;

    public Integer getRateid() {
        return rateid;
    }

    public void setRateid(Integer rateid) {
        this.rateid = rateid;
    }

    public String getRatename() {
        return ratename;
    }

    public void setRatename(String ratename) {
        this.ratename = ratename == null ? null : ratename.trim();
    }
}