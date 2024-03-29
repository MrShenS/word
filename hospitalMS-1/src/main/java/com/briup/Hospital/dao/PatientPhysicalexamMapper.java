package com.briup.Hospital.dao;

import com.briup.Hospital.bean.PatientPhysicalexam;
import com.briup.Hospital.bean.PatientPhysicalexamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PatientPhysicalexamMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    long countByExample(PatientPhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByExample(PatientPhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insert(PatientPhysicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insertSelective(PatientPhysicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    List<PatientPhysicalexam> selectByExample(PatientPhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    PatientPhysicalexam selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExampleSelective(@Param("record") PatientPhysicalexam record, @Param("example") PatientPhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExample(@Param("record") PatientPhysicalexam record, @Param("example") PatientPhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKeySelective(PatientPhysicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table patientphysicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKey(PatientPhysicalexam record);
}