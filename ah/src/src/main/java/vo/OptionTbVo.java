package vo;

public class OptionTbVo {
	private String gu;
	private String dong;
	private String cat1tb;
	private String cat2tb;
	private String cat3tb;
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
	public String getCat1tb() {
		return cat1tb;
	}
	public void setCat1tb(String cat1tb) {
		this.cat1tb = cat1tb;
	}
	public String getCat2tb() {
		return cat2tb;
	}
	public void setCat2tb(String cat2tb) {
		this.cat2tb = cat2tb;
	}
	public String getCat3tb() {
		return cat3tb;
	}
	public void setCat3tb(String cat3tb) {
		this.cat3tb = cat3tb;
	}
	@Override
	public String toString() {
		return "OptionTbVo [gu=" + gu + ", dong=" + dong + ", cat1tb=" + cat1tb + ", cat2tb=" + cat2tb + ", cat3tb="
				+ cat3tb + "]";
	}
}
