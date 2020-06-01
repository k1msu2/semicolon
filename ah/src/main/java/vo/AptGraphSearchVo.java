package vo;

public class AptGraphSearchVo {
	private String gu;
	private String dong;
	private String aptname;
	private String dealyear;
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
	public String getAptname() {
		return aptname;
	}
	public void setAptname(String aptname) {
		this.aptname = aptname;
	}
	public String getDealyear() {
		return dealyear;
	}
	public void setDealyear(String dealyear) {
		this.dealyear = dealyear;
	}
	@Override
	public String toString() {
		return "AptGraphSearchVo [gu=" + gu + ", dong=" + dong + ", aptname=" + aptname + ", dealyear=" + dealyear
				+ "]";
	}

	
}
