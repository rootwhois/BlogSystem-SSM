package cn.blog.controller;

import cn.blog.domain.Comment;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-6:13 下午
 */
@Controller
public class CommentController extends BaseController {

    /**
     * 新增评论请求提交处理
     *
     * @param articleId
     * @param name
     * @param email
     * @param commentContent
     * @param attr
     * @return
     */
    @RequestMapping("/comment/submit")
    public String submitComment(@RequestParam(defaultValue = "") Integer articleId,
                                @RequestParam(defaultValue = "") String name,
                                @RequestParam(defaultValue = "") String email,
                                @RequestParam(defaultValue = "") String commentContent,
                                RedirectAttributes attr) {

        Comment comment = new Comment();
        comment.setCommentArticleId(articleId);
        comment.setCommentTime(new Date());
        comment.setCommentNickname(name);
        comment.setCommentEmail(email);
        comment.setCommentContent(commentContent);

        if (0 != commentService.insertComment(comment)) {
            attr.addFlashAttribute("message", "评论成功！");
        } else {
            attr.addFlashAttribute("message", "评论失败！");
        }
        return "redirect:/article/single?articleId=" + articleId;
    }

    /**
     * 后台根据articleId拉取评论
     *
     * @param articleId
     * @return
     */
    @RequestMapping("/admin/comment")
    public ModelAndView submitComment(@RequestParam(defaultValue = "") Integer articleId,
                                      @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("comment_id desc");
        List<Comment> comments = commentService.selectCommentByArticleId(articleId);
        PageInfo<Comment> pageInfo = new PageInfo(comments, 5);
        ModelAndView modelAndView = new ModelAndView("admin/comment_list.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("articleId", articleId);
        return modelAndView;
    }

    /**
     * 后台根据commentId删除评论
     *
     * @param commentId
     * @return
     */
    @RequestMapping("/admin/comment/del")
    public @ResponseBody
    Object deleteCommentById(@RequestParam(defaultValue = "") Integer commentId) {
        boolean flag = commentService.delById(commentId);
        HashMap<String, String> map = new HashMap<>();
        if (flag) {
            map.put("stateCode", "0");
        } else {
            map.put("stateCode", "1");
        }
        return map;
    }
}
