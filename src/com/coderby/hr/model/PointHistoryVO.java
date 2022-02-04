package com.coderby.hr.model;

import java.sql.Date;

public class PointHistoryVO {
    private String phoneNumber;
    private int allianceId;
    private String allianceName;
    private double amount;
    private Date useDate;
    private double usePoint;
    private double savePoint;
    private double totalPoint;
    private double substractPoint;
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getAllianceId() {
		return allianceId;
	}
	public void setAllianceId(int allianceId) {
		this.allianceId = allianceId;
	}
	public String getAllianceName() {
		return allianceName;
	}
	public void setAllianceName(String allianceName) {
		this.allianceName = allianceName;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}
	public double getUsePoint() {
		return usePoint;
	}
	public void setUsePoint(double usePoint) {
		this.usePoint = usePoint;
	}
	public double getSavePoint() {
		return savePoint;
	}
	public void setSavePoint(double savePoint) {
		this.savePoint = savePoint;
	}
	public double getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(double totalPoint) {
		this.totalPoint = totalPoint;
	}
	@Override
	public String toString() {
		return "PointHistoryVO [phoneNumber=" + phoneNumber + ", allianceId=" + allianceId + ", allianceName="
				+ allianceName + ", amount=" + amount + ", useDate=" + useDate + ", usePoint=" + usePoint
				+ ", savePoint=" + savePoint + ", totalPoint=" + totalPoint + "]";
	}
	public double getSubstractPoint() {
		return substractPoint;
	}
	public void setSubstractPoint(double substractPoint) {
		this.substractPoint = substractPoint;
	}

    
}
