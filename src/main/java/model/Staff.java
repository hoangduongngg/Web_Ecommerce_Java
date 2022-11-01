package model;

public class Staff extends Member{
	private String position;

	public Staff() {
		super();
	}

	public Staff(Member mb, String position) {
		super();
		this.position = position;
		this.setId(mb.getId());
        this.setAddress(mb.getAddress());
        this.setDob(mb.getDob());
        this.setEmail(mb.getEmail());
        this.setName(mb.getName());
        this.setPassword(mb.getPassword());
        this.setTel(mb.getTel());
        this.setUsername(mb.getUsername());
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	
	
	
}
