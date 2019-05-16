package org.iii.seaotter.jayee.entity;


/**
 *
 *@author ming 李宜鳴  
 * 
 */
public class Vender {
	private Long id;
	private String vendername;
	private String venderaddress;
	private Integer maxpeople;
	private String phone;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getVendername() {
		return vendername;
	}
	public void setVendername(String vendername) {
		this.vendername = vendername;
	}
	public String getVenderaddress() {
		return venderaddress;
	}
	public void setVenderaddress(String venderaddress) {
		this.venderaddress = venderaddress;
	}
	public Integer getMaxpeople() {
		return maxpeople;
	}
	public void setMaxpeople(Integer maxpeople) {
		this.maxpeople = maxpeople;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	

}
