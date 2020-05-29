package vo;

public class OptionVo {
	
	private String gu;
	private String dong;
	private String cat1name;
	private String cat2name;
	private String cat3name;
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getCat1name() {
		return cat1name;
	}
	public void setCat1name(String cat1name) {
		this.cat1name = cat1name;
	}
	public String getCat2name() {
		return cat2name;
	}
	public void setCat2name(String cat2name) {
		this.cat2name = cat2name;
	}
	public String getCat3name() {
		return cat3name;
	}
	public void setCat3name(String cat3name) {
		this.cat3name = cat3name;
	}
	@Override
	public String toString() {
		return "OptionVo [gu=" + gu + ", dong=" + dong + ", cat1name=" + cat1name + ", cat2name=" + cat2name
				+ ", cat3name=" + cat3name + "]";
	}
	
	

}
