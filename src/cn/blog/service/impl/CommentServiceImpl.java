package cn.blog.service.impl;

import cn.blog.dao.CommentMapper;
import cn.blog.domain.Comment;
import cn.blog.domain.CommentExample;
import cn.blog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-2:30 下午
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Override
    public List<Comment> allComments(int article_id, int offset, int limit) {
        return null;
    }

    @Override
    public int insertComment(Comment comment) {
        return commentMapper.insert(comment);
    }

    @Override
    public long countAllNum() {
        return commentMapper.countByExample(null);
    }

    @Override
    public boolean delById(Integer id) {
        boolean flag = commentMapper.deleteByPrimaryKey(id) > 0;
        return flag;
    }

    @Override
    public List<Comment> selectCommentByArticleId(Integer id) {
        CommentExample example = new CommentExample();
        example.setOrderByClause("comment_id desc");
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andCommentArticleIdEqualTo(id);
        return commentMapper.selectByExampleWithBLOBs(example);
    }

    @Override
    public long countByArticleId(Integer id) {
        CommentExample example = new CommentExample();
        CommentExample.Criteria criteria = example.createCriteria();
        criteria.andCommentArticleIdEqualTo(id);
        return commentMapper.countByExample(example);
    }
}
