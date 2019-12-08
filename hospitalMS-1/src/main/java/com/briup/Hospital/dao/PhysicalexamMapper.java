package com.briup.Hospital.dao;

import com.briup.Hospital.bean.Physicalexam;
import com.briup.Hospital.bean.PhysicalexamExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
@Repository
public interface PhysicalexamMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    long countByExample(PhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByExample(PhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insert(Physicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insertSelective(Physicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    List<Physicalexam> selectByExample(PhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    Physicalexam selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExampleSelective(@Param("record") Physicalexam record, @Param("example") PhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExample(@Param("record") Physicalexam record, @Param("example") PhysicalexamExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKeySelective(Physicalexam record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table physicalexam
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKey(Physicalexam record);
}