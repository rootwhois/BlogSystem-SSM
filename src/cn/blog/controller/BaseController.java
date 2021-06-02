package cn.blog.controller;

import cn.blog.domain.Admin;
import cn.blog.domain.Sort;
import cn.blog.domain.Tag;
import cn.blog.domain.Web;
import cn.blog.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-7:35 下午
 */
public abstract class BaseController {

    //每页显示多少行数据
    public Integer pageSize = 10;

    @Autowired
    ArticleService articleService;
    @Autowired
    CommentService commentService;
    @Autowired
    TagService tagService;
    @Autowired
    WebService webService;
    @Autowired
    AdminService adminService;
    @Autowired
    SortService sortService;


    @ModelAttribute
    public void populateModel(@SessionAttribute(required = false) Object webName, HttpSession session) {
        if (null == webName) {
            setWebInfo(session);
        }
    }

    /**
     * 放置全局数据到Session中
     *
     * @param session
     */
    public void setWebInfo(HttpSession session) {
        Web webInfo = webService.getWebInfo();
        Admin info = adminService.getInfo(webInfo.getWebId());
        List<Sort> sorts = sortService.getSorts();
        List<Tag> tags = tagService.getTags();

        session.setAttribute("webName", webInfo.getWebName());
        session.setAttribute("webDomain", webInfo.getWebDomain());
        session.setAttribute("userNickName", info.getUserNickname());
        session.setAttribute("userAvatar", info.getUserAvatar());
        session.setAttribute("userEmail", info.getUserEmail());
        session.setAttribute("webName", webInfo.getWebName());
    }
}
