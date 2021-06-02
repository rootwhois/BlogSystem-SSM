package cn.blog.service;

import cn.blog.domain.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-3:04 下午
 */
@Service
public interface TagService {
    /**
     * 根据标签id获取标签
     *
     * @param id
     * @return Tag
     */
    Tag selectTagById(Integer id);

    /**
     * 查询所有标签
     *
     * @return List<Tag>
     */
    List<Tag> getTags();

    /**
     * 统计标签总数
     *
     * @return long
     */
    long countAllNum();

    /**
     * 插入标签
     *
     * @param tag
     * @return true：成功，false：失败
     */
    boolean insertTag(Tag tag);

    /**
     * 更新标签
     *
     * @param tag
     * @return true：成功，false：失败
     */
    boolean updateTagById(Tag tag);

    /**
     * 根据sortId删除标签
     *
     * @param id
     * @return true：成功，false：失败
     */
    boolean deleteTagById(Integer id);
}
