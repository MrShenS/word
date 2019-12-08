package com.briup.Hospital.dao;

import com.briup.Hospital.bean.Drug;
import com.briup.Hospital.bean.DrugExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DrugMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    long countByExample(DrugExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByExample(DrugExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insert(Drug record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int insertSelective(Drug record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    List<Drug> selectByExample(DrugExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    Drug selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExampleSelective(@Param("record") Drug record, @Param("example") DrugExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByExample(@Param("record") Drug record, @Param("example") DrugExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKeySelective(Drug record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table drug
     *
     * @mbg.generated Tue Apr 09 09:47:47 CST 2019
     */
    int updateByPrimaryKey(Drug record);
}