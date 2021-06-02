package cn.blog.service.impl;

import cn.blog.dao.TagMapper;
import cn.blog.domain.Tag;
import cn.blog.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-3:08 下午
 */
@Service
public class TagServiceImpl implements TagService {
    @Autowired
    private TagMapper tagMapper;

    @Override
    public Tag selectTagById(Integer id) {
        return tagMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Tag> getTags() {
        return tagMapper.selectByExample(null);
    }

    @Override
    public long countAllNum() {
        return tagMapper.countByExample(null);
    }

    @Override
    public boolean insertTag(Tag tag) {
        boolean flag = tagMapper.insert(tag) > 0;
        return flag;
    }

    @Override
    public boolean updateTagById(Tag tag) {
        boolean flag = tagMapper.updateByPrimaryKey(tag) > 0;
        return flag;
    }

    @Override
    public boolean deleteTagById(Integer id) {
        boolean flag = tagMapper.deleteByPrimaryKey(id) > 0;
        return flag;
    }
}
