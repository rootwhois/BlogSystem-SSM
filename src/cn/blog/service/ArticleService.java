package cn.blog.service;

import cn.blog.domain.Article;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-21-10:05 下午
 */
public interface ArticleService {
    /**
     * 根据id获取文章
     *
     * @param id
     * @return
     */
    Article selectById(Integer id);

    /**
     * 查询全部文章
     *
     * @return
     */
    List<Article> queryAll();

    /**
     * 统计文章篇数
     *
     * @return long 文章篇数
     */
    long countAllNum();

    /**
     * 更新文章
     *
     * @param article
     * @return true：更新成功，false：更新失败
     */
    boolean updateArticle(Article article);

    /**
     * 根据id删除文章
     *
     * @param id
     * @return 1成功，0失败
     */
    int deleteById(Integer id);

    /**
     * 新增文章
     *
     * @param article
     * @return true成功，false失败
     */
    boolean insert(Article article);

    /**
     * 根据关键字查询文章
     *
     * @param type
     * @param keywords
     * @return List<Article>
     */
    List<Article> queryByKeywords(String type, String keywords);

    /**
     * 根据分类id查询相关文章
     *
     * @param id
     * @return List<Article>
     */
    List<Article> selectBySortId(Integer id);

    /**
     * 根据标签id查询相关文章
     *
     * @param id
     * @return List<Article>
     */
    List<Article> selectByTagId(Integer id);
}
