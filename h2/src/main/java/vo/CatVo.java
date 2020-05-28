package vo;

public class CatVo {
	private String catid;
	private String catname;
	public String getCatid() {
		return catid;
	}
	public void setCatid(String catid) {
		this.catid = catid;
	}
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	@Override
	public String toString() {
		return "CatVo [catid=" + catid + ", catname=" + catname + "]";
	}
	
	
}
