package vo;

public class CircleVo {
	
	private int aptno;
	private String aptname;
	private double aptlat;
	private double aptlng;
	
	public String getAptname() {
		return aptname;
	}
	public void setAptname(String aptname) {
		this.aptname = aptname;
	}
	public double getAptlat() {
		return aptlat;
	}
	public void setAptlat(double aptlat) {
		this.aptlat = aptlat;
	}
	public double getAptlng() {
		return aptlng;
	}
	public void setAptlng(double aptlng) {
		this.aptlng = aptlng;
	}
	public int getAptno() {
		return aptno;
	}
	public void setAptno(int aptno) {
		this.aptno = aptno;
	}
	@Override
	public String toString() {
		return "CircleVo [aptno=" + aptno + ", aptname=" + aptname + ", aptlat=" + aptlat + ", aptlng=" + aptlng + "]";
	}
	

}
