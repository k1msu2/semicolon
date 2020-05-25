package vo;

public class AptVo {

	private String id;
	private String name;
	private String addr;
	private double lat;
	private double lng;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	@Override
	public String toString() {
		return "AptVo [id=" + id + ", name=" + name + ", addr=" + addr + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	

}