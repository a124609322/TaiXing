package com.chuandu.model;

import java.util.Date;

public class IdCardInfo {
    private String id;

    private String name;

    private String phone;

    private String email;

    private String idcardnum;

    private Integer cardtype;

    private String waybillcode1;

    private String waybillcode2;

    private String waybillcode3;

    private String waybillcode4;

    private String waybillcode5;

    private String waybillcode6;

    private Date createdate;

    private Date modifydate;

    private Integer deleted;

    private String frontcard;

    private String backcard;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getIdcardnum() {
        return idcardnum;
    }

    public void setIdcardnum(String idcardnum) {
        this.idcardnum = idcardnum == null ? null : idcardnum.trim();
    }

    public Integer getCardtype() {
        return cardtype;
    }

    public void setCardtype(Integer cardtype) {
        this.cardtype = cardtype;
    }

    public String getWaybillcode1() {
        return waybillcode1;
    }

    public void setWaybillcode1(String waybillcode1) {
        this.waybillcode1 = waybillcode1 == null ? null : waybillcode1.trim();
    }

    public String getWaybillcode2() {
        return waybillcode2;
    }

    public void setWaybillcode2(String waybillcode2) {
        this.waybillcode2 = waybillcode2 == null ? null : waybillcode2.trim();
    }

    public String getWaybillcode3() {
        return waybillcode3;
    }

    public void setWaybillcode3(String waybillcode3) {
        this.waybillcode3 = waybillcode3 == null ? null : waybillcode3.trim();
    }

    public String getWaybillcode4() {
        return waybillcode4;
    }

    public void setWaybillcode4(String waybillcode4) {
        this.waybillcode4 = waybillcode4 == null ? null : waybillcode4.trim();
    }

    public String getWaybillcode5() {
        return waybillcode5;
    }

    public void setWaybillcode5(String waybillcode5) {
        this.waybillcode5 = waybillcode5 == null ? null : waybillcode5.trim();
    }

    public String getWaybillcode6() {
        return waybillcode6;
    }

    public void setWaybillcode6(String waybillcode6) {
        this.waybillcode6 = waybillcode6 == null ? null : waybillcode6.trim();
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public Integer getDeleted() {
        return deleted;
    }

    public void setDeleted(Integer deleted) {
        this.deleted = deleted;
    }

    public String getFrontcard() {
        return frontcard;
    }

    public void setFrontcard(String frontcard) {
        this.frontcard = frontcard == null ? null : frontcard.trim();
    }

    public String getBackcard() {
        return backcard;
    }

    public void setBackcard(String backcard) {
        this.backcard = backcard == null ? null : backcard.trim();
    }
}