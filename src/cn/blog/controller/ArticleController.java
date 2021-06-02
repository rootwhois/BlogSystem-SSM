package cn.blog.controller;

import cn.blog.domain.Article;
import cn.blog.domain.Comment;
import cn.blog.domain.Sort;
import cn.blog.domain.Tag;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.HashMap;
import java.util.List;


/**
 * @author cgs
 * @create 2020-11-22-10:58 上午
 */
@Controller
public class ArticleController extends BaseController {


    /**
     * 前台主页
     *
     * @return
     */
    @RequestMapping({"/", "/index"})
    public ModelAndView getMain(@RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("article_id desc");
        List<Article> articles = articleService.queryAll();
        List<Sort> sorts = sortService.getSorts();
        List<Tag> tags = tagService.getTags();
        PageInfo<Article> pageInfo = new PageInfo(articles, 5);
        ModelAndView modelAndView = new ModelAndView("index.jsp");
        modelAndView.addObject("sorts", sorts);
        modelAndView.addObject("tags", tags);
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 单页文章显示
     *
     * @param id
     * @return
     */
    @RequestMapping("/article/single")
    public ModelAndView getDetails(@RequestParam("articleId") int id, @RequestParam(defaultValue = "1") Integer commentPageNum) {
        Article article = articleService.selectById(id);
        PageHelper.startPage(commentPageNum, pageSize);
        List<Comment> comments = commentService.selectCommentByArticleId(id);
        PageHelper.orderBy("comment_id desc");
        PageInfo<Comment> pageInfo = new PageInfo(comments, 5);
        long commentCount = commentService.countByArticleId(id);
        Sort sort = sortService.selectSortById(id);
        List<Sort> sorts = sortService.getSorts();
        List<Tag> tags = tagService.getTags();
        ModelAndView modelAndView = new ModelAndView("single.jsp");
        modelAndView.addObject("article", article);
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("commentCount", commentCount);
        modelAndView.addObject("sort", sort);
        modelAndView.addObject("sorts", sorts);
        modelAndView.addObject("tags", tags);
        return modelAndView;
    }

    /**
     * 查询文章结果返回页
     *
     * @param type
     * @param keywords
     * @return
     */
    @RequestMapping("/search/articles")
    public ModelAndView searchArticlesByKeywords(@RequestParam(defaultValue = "") String type,
                                                 @RequestParam(defaultValue = "") String keywords,
                                                 @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> list = articleService.queryByKeywords(type, keywords);
        PageHelper.orderBy("article_id desc");
        PageInfo<Comment> pageInfo = new PageInfo(list, 5);
        ModelAndView modelAndView = new ModelAndView("search.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("type", type);
        modelAndView.addObject("keywords", keywords);
        modelAndView.addObject("sum", list.size());
        return modelAndView;
    }

    /**
     * 后台文章列表
     *
     * @return
     */
    @RequestMapping("/admin/article/list")
    public ModelAndView listArticleForAdmin(@RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> articles = articleService.queryAll();
        PageHelper.orderBy("article_id desc");
        PageInfo<Article> pageInfo = new PageInfo(articles, 5);
        ModelAndView modelAndView = new ModelAndView("admin/article_list.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 后台文章详情
     *
     * @param articleId
     * @return
     */
    @RequestMapping("/admin/article/detail")
    public ModelAndView getArticleDetailForAdmin(@RequestParam(defaultValue = "") int articleId) {
        Article article = articleService.selectById(articleId);
        Sort sort = sortService.selectSortById(article.getArticleSortId());
        Tag tag = tagService.selectTagById(article.getArticleTagId());
        ModelAndView modelAndView = new ModelAndView("admin/article_detail.jsp");
        modelAndView.addObject("article", article);
        modelAndView.addObject("sort", sort);
        modelAndView.addObject("tag", tag);
        return modelAndView;
    }

    /**
     * 后台文章编辑
     *
     * @param articleId
     * @return
     */
    @RequestMapping("/admin/article/edit")
    public ModelAndView editArticle(@RequestParam(defaultValue = "") int articleId) {
        ModelAndView modelAndView = new ModelAndView("admin/article_edit.jsp");
        modelAndView.addObject("article", articleService.selectById(articleId));
        modelAndView.addObject("sorts", sortService.getSorts());
        modelAndView.addObject("tags", tagService.getTags());
        return modelAndView;
    }

    /**
     * 后台文章搜索
     *
     * @param keywords
     * @return
     */
    @RequestMapping("/admin/article/search")
    public ModelAndView searchArticleForAdmin(@RequestParam(defaultValue = "") String keywords,
                                              @RequestParam(defaultValue = "1") Integer pageNum) {
        String type = "articles";
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("article_id desc");
        List<Article> articles;
        if (null == keywords) {
            articles = articleService.queryAll();
        } else {
            articles = articleService.queryByKeywords(type, keywords);
        }
        PageInfo<Article> pageInfo = new PageInfo(articles, 5);
        ModelAndView modelAndView = new ModelAndView("admin/article_list.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 后台添加文章页面
     *
     * @return
     */
    @RequestMapping("/admin/article/add")
    public ModelAndView articleAdd() {
        ModelAndView modelAndView = new ModelAndView("admin/article_edit.jsp");
        modelAndView.addObject("sorts", sortService.getSorts());
        modelAndView.addObject("tags", tagService.getTags());
        return modelAndView;
    }

    /**
     * 增加文章或修改请求处理
     *
     * @param id
     * @param title
     * @param content
     * @param userId
     * @param sortId
     * @param tagId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/article/edit/do")
    public String addOrUpdateArticle(@RequestParam(defaultValue = "") String id,
                                     @RequestParam(defaultValue = "") String title,
                                     @RequestParam(defaultValue = "") String content,
                                     @RequestParam(defaultValue = "") int sortId,
                                     @RequestParam(defaultValue = "") int tagId,
                                     @SessionAttribute int userId,
                                     RedirectAttributes redirectAttributes) {
        Article article = new Article();
        article.setArticleTitle(title);
        article.setArticleSortId(sortId);
        article.setArticleTagId(tagId);
        article.setArticleContent(content);
        article.setArticleDate(new Date());
        article.setArticleUserId(userId);
        if (id.equals("")) {
            //新增
            if (articleService.insert(article)) {
                redirectAttributes.addFlashAttribute("succ", "发表文章成功！");
            } else {
                redirectAttributes.addFlashAttribute("article", article);
                redirectAttributes.addFlashAttribute("error", "发表文章失败！");
            }
        } else {
            int articleId = Integer.parseInt(id);
            article.setArticleId(articleId);
            if (articleService.updateArticle(article)) {
                redirectAttributes.addFlashAttribute("article", article);
                redirectAttributes.addFlashAttribute("succ", "修改文章成功！");
            } else {
                redirectAttributes.addFlashAttribute("article", article);
                redirectAttributes.addFlashAttribute("error", "修改文章失败！");
            }
        }
        return "redirect:/admin/article/add";
    }

    /**
     * 后台删除文章请求处理
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/article/del")
    public @ResponseBody
    Object delArticle(@RequestParam(defaultValue = "") String id) {
        HashMap<String, String> map = new HashMap<>();
        if (articleService.deleteById(Integer.parseInt(id)) > 0) {
            map.put("stateCode", "1");
        } else {
            map.put("stateCode", "0");
        }
        return map;
    }
}
