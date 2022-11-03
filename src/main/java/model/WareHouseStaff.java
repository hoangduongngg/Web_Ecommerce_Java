package model;

public class WareHouseStaff extends Staff {
    public WareHouseStaff() {
    }
    
    public WareHouseStaff(Member mb) {
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
