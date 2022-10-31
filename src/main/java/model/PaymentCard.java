package model;
import java.sql.Date;

public class PaymentCard {
	private Integer id;
	private String cardNumber, cardCVV, cardName;
	private Date cardOutDate;
	
	public PaymentCard() {
		super();
	}
	public PaymentCard(Integer id, String cardNumber, String cardCVV, String cardName, Date cardOutDate) {
		super();
		this.id = id;
		this.cardNumber = cardNumber;
		this.cardCVV = cardCVV;
		this.cardName = cardName;
		this.cardOutDate = cardOutDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardCVV() {
		return cardCVV;
	}
	public void setCardCVV(String cardCVV) {
		this.cardCVV = cardCVV;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public Date getCardOutDate() {
		return cardOutDate;
	}
	public void setCardOutDate(Date cardOutDate) {
		this.cardOutDate = cardOutDate;
	}
	@Override
	public String toString() {
		return "PaymentCard [id=" + id + ", cardNumber=" + cardNumber + ", cardCVV=" + cardCVV + ", cardName="
				+ cardName + ", cardOutDate=" + cardOutDate + "]";
	}
	
	
}
