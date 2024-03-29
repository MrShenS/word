package com.briup.Hospital.bean;

import java.util.Date;

public class UserPatient {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.price
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private Double price;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.status
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.symptom
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String symptom;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.advice
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String advice;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.user_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private Integer userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.patient_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private Integer patientId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.date
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private Date date;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.complained
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String complained;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.pastMedicalHistory
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String pastmedicalhistory;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.historyOfPresentIllness
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String historyofpresentillness;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column userpatient.physicalExamResult
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    private String physicalexamresult;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.id
     *
     * @return the value of userpatient.id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.id
     *
     * @param id the value for userpatient.id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.price
     *
     * @return the value of userpatient.price
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public Double getPrice() {
        return price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.price
     *
     * @param price the value for userpatient.price
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.status
     *
     * @return the value of userpatient.status
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.status
     *
     * @param status the value for userpatient.status
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.symptom
     *
     * @return the value of userpatient.symptom
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getSymptom() {
        return symptom;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.symptom
     *
     * @param symptom the value for userpatient.symptom
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setSymptom(String symptom) {
        this.symptom = symptom == null ? null : symptom.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.advice
     *
     * @return the value of userpatient.advice
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getAdvice() {
        return advice;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.advice
     *
     * @param advice the value for userpatient.advice
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setAdvice(String advice) {
        this.advice = advice == null ? null : advice.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.user_id
     *
     * @return the value of userpatient.user_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.user_id
     *
     * @param userId the value for userpatient.user_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.patient_id
     *
     * @return the value of userpatient.patient_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public Integer getPatientId() {
        return patientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.patient_id
     *
     * @param patientId the value for userpatient.patient_id
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setPatientId(Integer patientId) {
        this.patientId = patientId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.date
     *
     * @return the value of userpatient.date
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public Date getDate() {
        return date;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.date
     *
     * @param date the value for userpatient.date
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.complained
     *
     * @return the value of userpatient.complained
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getComplained() {
        return complained;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.complained
     *
     * @param complained the value for userpatient.complained
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setComplained(String complained) {
        this.complained = complained == null ? null : complained.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.pastMedicalHistory
     *
     * @return the value of userpatient.pastMedicalHistory
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getPastmedicalhistory() {
        return pastmedicalhistory;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.pastMedicalHistory
     *
     * @param pastmedicalhistory the value for userpatient.pastMedicalHistory
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setPastmedicalhistory(String pastmedicalhistory) {
        this.pastmedicalhistory = pastmedicalhistory == null ? null : pastmedicalhistory.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.historyOfPresentIllness
     *
     * @return the value of userpatient.historyOfPresentIllness
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getHistoryofpresentillness() {
        return historyofpresentillness;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.historyOfPresentIllness
     *
     * @param historyofpresentillness the value for userpatient.historyOfPresentIllness
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setHistoryofpresentillness(String historyofpresentillness) {
        this.historyofpresentillness = historyofpresentillness == null ? null : historyofpresentillness.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column userpatient.physicalExamResult
     *
     * @return the value of userpatient.physicalExamResult
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public String getPhysicalexamresult() {
        return physicalexamresult;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column userpatient.physicalExamResult
     *
     * @param physicalexamresult the value for userpatient.physicalExamResult
     *
     * @mbg.generated Tue Apr 09 09:47:48 CST 2019
     */
    public void setPhysicalexamresult(String physicalexamresult) {
        this.physicalexamresult = physicalexamresult == null ? null : physicalexamresult.trim();
    }
}