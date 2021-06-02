package cn.blog.service;

import cn.blog.domain.Comment;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-2:28 下午
 */
public interface CommentService {
    /**
     * 获取全部评论
     *
     * @param article_id
     * @param offset
     * @param limit
     * @return List<Comment>
     */
    List<Comment> allComments(int article_id, int offset, int limit);

    /**
     * 新增评论
     *
     * @param comment
     * @return 1成功，0失败
     */
    int insertComment(Comment comment);

    /**
     * 查询评论总条数
     *
     * @return long
     */
    long countAllNum();

    /**
     * 根据id删除评论
     *
     * @param id
     * @return true：成功，false：失败
     */
    boolean delById(Integer id);

    /**
     * 根据ArticleId查询评论
     *
     * @param id
     * @return List<Comment>
     */
    List<Comment> selectCommentByArticleId(Integer id);

    /**
     * 根据ArticleId查询评论条数
     *
     * @param id
     * @return long
     */
    long countByArticleId(Integer id);
}
