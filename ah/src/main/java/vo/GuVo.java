package vo;

public class GuVo {
	private String gu;
	private double lat;
	private double lng;

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	@Override
	public String toString() {
		return "GuVo [gu=" + gu + ", lat=" + lat + ", lng=" + lng + "]";
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
	
	
}
