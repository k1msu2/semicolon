package vo;

public class AptGraphDongVo {
	private String aptname;
	private String dealyear;
	private String perprice;
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
	public String getPerprice() {
		return perprice;
	}
	public void setPerprice(String perprice) {
		this.perprice = perprice;
	}
	@Override
	public String toString() {
		return "AptGraphDongVo [aptname=" + aptname + ", dealyear=" + dealyear + ", perprice=" + perprice + "]";
	}
	
}
