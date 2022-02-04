package com.coderby.hr.model;

public class AllianceVO {
	private int allianceId;
    private String allianceName;
	private double basic;
	private double silver;
	private double gold;
	private double pointPct;
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
	public double getBasic() {
		return basic;
	}
	public void setBasic(double basic) {
		this.basic = basic;
	}
	public double getSilver() {
		return silver;
	}
	public void setSilver(double silver) {
		this.silver = silver;
	}
	public double getGold() {
		return gold;
	}
	public void setGold(double gold) {
		this.gold = gold;
	}
	@Override
	public String toString() {
		return "AllianceVO [allianceId=" + allianceId + ", allianceName=" + allianceName + ", basic=" + basic
				+ ", silver=" + silver + ", gold=" + gold + "]";
	}
	public double getPointPct() {
		return pointPct;
	}
	public void setPointPct(double pointPct) {
		this.pointPct = pointPct;
	}

}
