package cn.blog.dao;

import cn.blog.domain.Tag;
import cn.blog.domain.TagExample;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TagMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    long countByExample(TagExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int deleteByExample(TagExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int deleteByPrimaryKey(Integer tagId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int insert(Tag record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int insertSelective(Tag record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    List<Tag> selectByExample(TagExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    Tag selectByPrimaryKey(Integer tagId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int updateByExampleSelective(@Param("record") Tag record, @Param("example") TagExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int updateByExample(@Param("record") Tag record, @Param("example") TagExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int updateByPrimaryKeySelective(Tag record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tag
     *
     * @mbg.generated Fri Nov 27 19:46:20 CST 2020
     */
    int updateByPrimaryKey(Tag record);
}