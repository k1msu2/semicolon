package vo;

public class AptVo3 {

	private int id;
	private String name;
	private String addr;
	private int lat;
	private int lng;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public int getLat() {
		return lat;
	}
	public void setLat(int lat) {
		this.lat = lat;
	}
	public int getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}
	
	@Override
	public String toString() {
		return "AptVo [id=" + id + ", name=" + name + ", addr=" + addr + ", lat=" + lat + ", lng=" + lng + "]";
	}
	
	
	
}