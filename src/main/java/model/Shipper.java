package model;

public class Shipper extends Staff{
    public Shipper() {
    }
    
    public Shipper(Member mb) {
        this.setId(mb.getId());
        this.setAddress(mb.getAddress());
        this.setDob(mb.getDob());
        this.setEmail(mb.getEmail());
        this.setName(mb.getName());
        this.setPassword(mb.getPassword());
        this.setTel(mb.getTel());
        this.setUsername(mb.getUsername());
    }
}
