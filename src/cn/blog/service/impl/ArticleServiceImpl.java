package cn.blog.service.impl;

import cn.blog.dao.ArticleMapper;
import cn.blog.domain.Article;
import cn.blog.domain.ArticleExample;
import cn.blog.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-21-10:06 下午
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ArticleMapper articleMapper;

    @Override
    public Article selectById(Integer id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Article> queryAll() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("article_id desc");
        return articleMapper.selectByExample(example);
    }

    @Override
    public long countAllNum() {
        return articleMapper.countByExample(null);
    }

    @Override
    public boolean updateArticle(Article article) {
        boolean flag = articleMapper.updateByPrimaryKey(article) > 0;
        return flag;
    }

    @Override
    public int deleteById(Integer id) {
        return articleMapper.deleteByPrimaryKey(id);
    }

    @Override
    public boolean insert(Article article) {
        boolean flag = articleMapper.insert(article) > 0;
        return flag;
    }

    @Override
    public List<Article> queryByKeywords(String type, String keywords) {
        if (null == type) {
            return null;
        }
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria;
        example.setOrderByClause("article_id desc");
        switch (type) {
            case "articles":
                example.or().andArticleTitleLike("%" + keywords + "%");
                example.or().andArticleContentLike("%" + keywords + "%");
                break;
            case "tags":
                criteria = example.createCriteria();
                criteria.andArticleTagIdEqualTo(Integer.parseInt(keywords));
                break;
            case "sorts":
                criteria = example.createCriteria();
                criteria.andArticleSortIdEqualTo(Integer.parseInt(keywords));
                break;
            default:
                return null;
        }
        return articleMapper.selectByExample(example);
    }

    @Override
    public List<Article> selectBySortId(Integer id) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andArticleSortIdEqualTo(id);
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }

    @Override
    public List<Article> selectByTagId(Integer id) {
        ArticleExample example = new ArticleExample();
        ArticleExample.Criteria criteria = example.createCriteria();
        criteria.andArticleTagIdEqualTo(id);
        List<Article> articles = articleMapper.selectByExample(example);
        return articles;
    }
}
