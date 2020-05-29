package vo;

public class AptGraphDataVo {
	//select date, 'y'||area yname, y, 'value'||area valname, value from aptgraph_tb where aptname = 'DMC마포청구'
	private String aptname;
	private String date;
	private String yname;
	private double y;
	private String valname;
	private int value;
	public String getAptname() {
		return aptname;
	}
	public void setAptname(String aptname) {
		this.aptname = aptname;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getYname() {
		return yname;
	}
	public void setYname(String yname) {
		this.yname = yname;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	public String getValname() {
		return valname;
	}
	public void setValname(String valname) {
		this.valname = valname;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "AptGraphDataVo [aptname=" + aptname + ", date=" + date + ", yname=" + yname + ", y=" + y + ", valname="
				+ valname + ", value=" + value + "]";
	}
	
	
	
}