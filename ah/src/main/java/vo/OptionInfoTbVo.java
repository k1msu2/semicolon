package vo;

public class OptionInfoTbVo {
	private String gu;
	private String cattb;
	private String catinfotb;
	public String getGu() {
		return gu;
	}
	public void setGu(String gu) {
		this.gu = gu;
	}
	public String getCattb() {
		return cattb;
	}
	public void setCattb(String cattb) {
		this.cattb = cattb;
	}
	public String getCatinfotb() {
		return catinfotb;
	}
	public void setCatinfotb(String catinfotb) {
		this.catinfotb = catinfotb;
	}
	@Override
	public String toString() {
		return "OptionInfoTbVo [gu=" + gu + ", cattb=" + cattb + ", catinfotb=" + catinfotb + "]";
	}
}
