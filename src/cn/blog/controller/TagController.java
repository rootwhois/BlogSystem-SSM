package cn.blog.controller;

import cn.blog.domain.Article;
import cn.blog.domain.Tag;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;

/**
 * @author cgs
 * @create 2020-11-23-4:00 下午
 */
@Controller
public class TagController extends BaseController {
    /**
     * 调出标签页
     *
     * @return
     */
    @RequestMapping("/tag/list")
    public ModelAndView getTags(@RequestParam(defaultValue = "1") Integer pageNum) {
        //单独设置了下这里的每页显示个数
        PageHelper.startPage(pageNum, pageSize = 20);
        PageHelper.orderBy("tag_id asc");
        List<Tag> tags = tagService.getTags();
        PageInfo<Tag> pageInfo = new PageInfo(tags, 5);
        ModelAndView modelAndView = new ModelAndView("tagsList.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 调出后台标签页
     *
     * @return
     */
    @RequestMapping("/admin/tag/list")
    public ModelAndView listTag(@RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<Tag> tags = tagService.getTags();
        PageHelper.orderBy("tag_id asc");
        PageInfo<Tag> pageInfo = new PageInfo(tags, 5);
        ModelAndView modelAndView = new ModelAndView("admin/tag_list.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 调出后台标签详情页
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/tag/detail")
    public ModelAndView getTagDetail(@RequestParam(defaultValue = "") int id) {
        List<Article> articles = articleService.selectByTagId(id);
        Tag tag = tagService.selectTagById(id);
        ModelAndView modelAndView = new ModelAndView("admin/tag_detail.jsp");
        modelAndView.addObject("articles", articles);
        modelAndView.addObject("tag", tag);
        return modelAndView;
    }

    /**
     * 调出后台标签编辑页
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/tag/edit")
    public ModelAndView editTag(@RequestParam(defaultValue = "") int id) {
        ModelAndView modelAndView = new ModelAndView("admin/tag_edit.jsp");
        modelAndView.addObject("tag", tagService.selectTagById(id));
        return modelAndView;
    }

    /**
     * 调出后台标签新增页
     *
     * @return
     */
    @RequestMapping("/admin/tag/add")
    public ModelAndView tagAdd() {
        return new ModelAndView("admin/tag_edit.jsp");
    }

    /**
     * 标签新增或修改请求处理
     *
     * @param id
     * @param name
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/tag/edit/do")
    public String addOrUpdateTag(@RequestParam(defaultValue = "") String id,
                                 @RequestParam(defaultValue = "") String name,
                                 RedirectAttributes redirectAttributes) {
        Tag tag = new Tag();
        tag.setTagName(name);
        if (id.equals("")) {
            //新增
            if (tagService.insertTag(tag)) {
                redirectAttributes.addFlashAttribute("succ", "添加成功！");
            } else {
                redirectAttributes.addFlashAttribute("tag", tag);
                redirectAttributes.addFlashAttribute("error", "添加失败！");
            }
        } else {
            int tagId = Integer.parseInt(id);
            tag.setTagId(tagId);
            if (tagService.updateTagById(tag)) {
                redirectAttributes.addFlashAttribute("succ", "修改成功！");
            } else {
                redirectAttributes.addFlashAttribute("tag", tag);
                redirectAttributes.addFlashAttribute("error", "修改失败！");
            }
        }
        return "redirect:/admin/tag/add";
    }

    /**
     * 标签删除请求处理
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/tag/del")
    public @ResponseBody
    Object delTag(@RequestParam(defaultValue = "") int id) {
        HashMap<String, String> map = new HashMap<>();
        if (articleService.selectByTagId(id).isEmpty() && tagService.deleteTagById(id)) {
            map.put("stateCode", "1");
        } else {
            map.put("stateCode", "0");
        }
        return map;
    }
}
