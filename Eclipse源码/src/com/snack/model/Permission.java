package com.snack.model;

public class Permission {
    private Integer perid;

    private String pname;

    private Integer parentid;

    private String url;

    private Integer isparent;

    private Integer ismenu;

    public Integer getPerid() {
        return perid;
    }

    public void setPerid(Integer perid) {
        this.perid = perid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getIsparent() {
        return isparent;
    }

    public void setIsparent(Integer isparent) {
        this.isparent = isparent;
    }

    public Integer getIsmenu() {
        return ismenu;
    }

    public void setIsmenu(Integer ismenu) {
        this.ismenu = ismenu;
    }

	@Override
	public String toString() {
		return "Permission [perid=" + perid + ", pname=" + pname
				+ ", parentid=" + parentid + ", url=" + url + ", isparent="
				+ isparent + ", ismenu=" + ismenu + "]";
	}
    
}