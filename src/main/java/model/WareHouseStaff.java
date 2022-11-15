package model;

public class WareHouseStaff extends Staff {
    public WareHouseStaff() {
    }
    
    public WareHouseStaff(Staff staff) {
        this.setId(staff.getId());
        this.setAddress(staff.getAddress());
        this.setDob(staff.getDob());
        this.setEmail(staff.getEmail());
        this.setName(staff.getName());
        this.setPassword(staff.getPassword());
        this.setTel(staff.getTel());
        this.setUsername(staff.getUsername());
    }

    @Override
    public String toString() {
        return "WareHouseStaff [getPosition()=" + getPosition() + ", getId()=" + getId() + ", getUsername()="
                + getUsername() + ", getPassword()=" + getPassword() + ", getName()=" + getName() + ", getAddress()="
                + getAddress() + ", getTel()=" + getTel() + ", getDob()=" + getDob() + ", getEmail()=" + getEmail()
                + ", toString()=" + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
                + "]";
    }
    
    
}
