package vo;

public class MeminfoVO {

	private String mem_userid;
	private String mem_password;
	private String mem_username;
	private String mem_email;
	private String mem_birthday;
	private String mem_sex;
	private String mem_phone;
	private String mem_address;
	private String mem_register_date;
	private String mem_photo;
	private int mem_is_employer;
	public String getMem_userid() {
		return mem_userid;
	}
	public void setMem_userid(String mem_userid) {
		this.mem_userid = mem_userid;
	}
	public String getMem_password() {
		return mem_password;
	}
	public void setMem_password(String mem_password) {
		this.mem_password = mem_password;
	}
	public String getMem_username() {
		return mem_username;
	}
	public void setMem_username(String mem_username) {
		this.mem_username = mem_username;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(String mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_register_date() {
		return mem_register_date;
	}
	public void setMem_register_date(String mem_register_date) {
		this.mem_register_date = mem_register_date;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public int getMem_is_employer() {
		return mem_is_employer;
	}
	public void setMem_is_employer(int mem_is_employer) {
		this.mem_is_employer = mem_is_employer;
	}	
	
	@Override
	public String toString() {
		return "MeminfoVO [mem_userid=" + mem_userid + ", mem_password=" + mem_password + ", mem_username="
				+ mem_username + ", mem_email=" + mem_email + ", mem_birthday=" + mem_birthday + ", mem_sex=" + mem_sex
				+ ", mem_phone=" + mem_phone + ", mem_address=" + mem_address + ", mem_register_date="
				+ mem_register_date + ", mem_photo=" + mem_photo + ", mem_is_employer=" + mem_is_employer + "]";
	}	
	
	//meminfo 게시판 vo 구현. javas 게시판으로 옮김.


}
