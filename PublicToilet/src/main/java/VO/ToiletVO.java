package VO;

import java.math.BigDecimal;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ToiletVO {
	
	
	private String name;
	
	private BigDecimal lat;
	
	private BigDecimal lng;

	private BigDecimal distance;
	
	public BigDecimal getLat() {
		return lat;
	}
	public void setLat(BigDecimal lat) {
		this.lat = lat;
	}
	public BigDecimal getLng() {
		return lng;
	}
	public void setLng(BigDecimal lng) {
		this.lng = lng;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public BigDecimal getDistance() {
		return distance;
	}
	public void setDistance(BigDecimal distance) {
		this.distance = distance;
	}
	@Override
	public String toString() {
		return "ToiletVO [" + "name" + ":" + name + "," + "lat" + ":" + lat + ","+"lng"+":" + lng + ","+"distance" +":"+ distance + "]";
	}
	
	
	
	
	
}
	