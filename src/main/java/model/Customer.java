package model;

public class Customer extends Member {
	private PaymentCard paymentCard;

	
	
	
	public Customer(PaymentCard paymentCard) {
        super();
        this.paymentCard = paymentCard;
    }

    public PaymentCard getPaymentCard() {
		return paymentCard;
	}

	public void setPaymentCard(PaymentCard paymentCard) {
		this.paymentCard = paymentCard;
	}
	
	
}
