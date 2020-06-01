package vo;

public class AptGraphGuVo {
	private String gu;
	private String dong;
	private String dealyear;
	private double perprice;
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getDealyear() {
		return dealyear;
	}
	public void setDealyear(String dealyear) {
		this.dealyear = dealyear;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public double getPerprice() {
		return perprice;
	}
	public void setPerprice(double perprice) {
		this.perprice = perprice;
	}
	@Override
	public String toString() {
		return "AptGraphGuVo [gu=" + gu + ", dealyear=" + dealyear + ", dong=" + dong + ", perprice=" + perprice + "]";
	}
}
