package model;


public class Customer extends Member {
	private PaymentCard paymentCard;

	
	public Customer() {
	    
	}
	
	public Customer(Member mb, PaymentCard paymentCard) {
        super();
        this.paymentCard = paymentCard;
        this.setId(mb.getId());
        this.setAddress(mb.getAddress());
        this.setDob(mb.getDob());
        this.setEmail(mb.getEmail());
        this.setName(mb.getName());
        this.setPassword(mb.getPassword());
        this.setTel(mb.getTel());
        this.setUsername(mb.getUsername());
    }

    public PaymentCard getPaymentCard() {
		return paymentCard;
	}

	public void setPaymentCard(PaymentCard paymentCard) {
		this.paymentCard = paymentCard;
	}

    @Override
    public String toString() {
        return "Customer [paymentCard=" + paymentCard + ", getId()=" + getId() + ", getUsername()=" + getUsername()
                + ", getPassword()=" + getPassword() + ", getName()=" + getName() + ", getAddress()=" + getAddress()
                + ", getTel()=" + getTel() + ", getDob()=" + getDob() + ", getEmail()=" + getEmail() + ", toString()="
                + super.toString() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
    }
	
	
	
	
}
