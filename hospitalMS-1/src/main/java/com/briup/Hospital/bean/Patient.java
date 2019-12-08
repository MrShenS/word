package com.briup.Hospital.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.briup.Hospital.Web.converter.DateJsonSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Patient {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.id
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.name
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.age
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private Integer age;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.gender
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String gender;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.birth
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private Date birth;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.merriage
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String merriage;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.address
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String address;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.drugAllergy
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String drugallergy;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.cardNo
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private String cardno;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column patient.balance
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    private Double balance;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.id
     *
     * @return the value of patient.id
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.id
     *
     * @param id the value for patient.id
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.name
     *
     * @return the value of patient.name
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.name
     *
     * @param name the value for patient.name
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.age
     *
     * @return the value of patient.age
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public Integer getAge() {
        return age;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.age
     *
     * @param age the value for patient.age
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setAge(Integer age) {
        this.age = age;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.gender
     *
     * @return the value of patient.gender
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getGender() {
        return gender;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.gender
     *
     * @param gender the value for patient.gender
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.birth
     *
     * @return the value of patient.birth
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    @JsonSerialize(using=DateJsonSerializer.class)
    public Date getBirth() {
        return birth;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.birth
     *
     * @param birth the value for patient.birth
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    @DateTimeFormat(pattern="yyyy-mm-dd")
    public void setBirth(Date birth) {
        this.birth = birth;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.merriage
     *
     * @return the value of patient.merriage
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getMerriage() {
        return merriage;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.merriage
     *
     * @param merriage the value for patient.merriage
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setMerriage(String merriage) {
        this.merriage = merriage == null ? null : merriage.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.address
     *
     * @return the value of patient.address
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.address
     *
     * @param address the value for patient.address
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.drugAllergy
     *
     * @return the value of patient.drugAllergy
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getDrugallergy() {
        return drugallergy;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.drugAllergy
     *
     * @param drugallergy the value for patient.drugAllergy
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setDrugallergy(String drugallergy) {
        this.drugallergy = drugallergy == null ? null : drugallergy.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.cardNo
     *
     * @return the value of patient.cardNo
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public String getCardno() {
        return cardno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.cardNo
     *
     * @param cardno the value for patient.cardNo
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setCardno(String cardno) {
        this.cardno = cardno == null ? null : cardno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column patient.balance
     *
     * @return the value of patient.balance
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public Double getBalance() {
        return balance;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column patient.balance
     *
     * @param balance the value for patient.balance
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    public void setBalance(Double balance) {
        this.balance = balance;
    }
}