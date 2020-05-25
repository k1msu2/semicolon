package vo;

public class CircleVo {
	
	private String aptname;
	private double aptlat;
	private double aptlng;
	private double catlat;
	private double catlng;
	
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
	public double getCatlat() {
		return catlat;
	}
	public void setCatlat(double catlat) {
		this.catlat = catlat;
	}
	public double getCatlng() {
		return catlng;
	}
	public void setCatlng(double catlng) {
		this.catlng = catlng;
	}
	@Override
	public String toString() {
		return "CircleVo [aptname=" + aptname + ", aptlat=" + aptlat + ", aptlng=" + aptlng + ", catlat=" + catlat
				+ ", catlng=" + catlng + "]";
	}
	
	

}
