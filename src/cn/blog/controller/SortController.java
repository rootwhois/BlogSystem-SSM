package cn.blog.controller;

import cn.blog.domain.Article;
import cn.blog.domain.Comment;
import cn.blog.domain.Sort;
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
 * @create 2020-11-23-3:59 下午
 */
@Controller
public class SortController extends BaseController {
    /**
     * 调出分类页
     *
     * @return
     */
    @RequestMapping("/sort/list")
    public ModelAndView getSorts(@RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("sort_id asc");
        List<Sort> sorts = sortService.getSorts();
        PageInfo<Comment> pageInfo = new PageInfo(sorts, 5);
        ModelAndView modelAndView = new ModelAndView("sortsList.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 后台列出所有分类
     *
     * @return
     */
    @RequestMapping("/admin/sort/list")
    public ModelAndView listSort(@RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        PageHelper.orderBy("sort_id asc");
        List<Sort> sorts = sortService.getSorts();
        PageInfo<Comment> pageInfo = new PageInfo(sorts, 5);
        ModelAndView modelAndView = new ModelAndView("admin/sort_list.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        return modelAndView;
    }

    /**
     * 后台列出分类详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/sort/detail")
    public ModelAndView getSortDetail(@RequestParam(defaultValue = "") int id,
                                      @RequestParam(defaultValue = "1") Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<Article> articles = articleService.selectBySortId(id);
        PageHelper.orderBy("sort_id asc");
        PageInfo<Comment> pageInfo = new PageInfo(articles, 5);
        Sort sort = sortService.selectSortById(id);
        ModelAndView modelAndView = new ModelAndView("admin/sort_detail.jsp");
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.addObject("sort", sort);
        modelAndView.addObject("id", id);
        return modelAndView;
    }

    /**
     * 调出后台编辑分类页
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/sort/edit")
    public ModelAndView editSort(@RequestParam(defaultValue = "") int id) {
        ModelAndView modelAndView = new ModelAndView("admin/sort_edit.jsp");
        modelAndView.addObject("sort", sortService.selectSortById(id));
        return modelAndView;
    }

    /**
     * 调出后台新增分类页
     *
     * @return
     */
    @RequestMapping("/admin/sort/add")
    public ModelAndView sortAdd() {
        return new ModelAndView("admin/sort_edit.jsp");
    }

    /**
     * 分类新增或修改请求处理
     *
     * @param id
     * @param name
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/sort/edit/do")
    public String addOrUpdateSort(@RequestParam(defaultValue = "") String id,
                                  @RequestParam(defaultValue = "") String name,
                                  RedirectAttributes redirectAttributes) {
        Sort sort = new Sort();
        sort.setSortName(name);
        if (id.equals("")) {
            //新增
            if (sortService.insertSort(sort)) {
                redirectAttributes.addFlashAttribute("succ", "添加成功！");
            } else {
                redirectAttributes.addFlashAttribute("sort", sort);
                redirectAttributes.addFlashAttribute("error", "添加失败！");
            }
        } else {
            int sortId = Integer.parseInt(id);
            sort.setSortId(sortId);
            if (sortService.updateSortById(sort)) {
                redirectAttributes.addFlashAttribute("succ", "修改成功！");
            } else {
                redirectAttributes.addFlashAttribute("sort", sort);
                redirectAttributes.addFlashAttribute("error", "修改失败！");
            }
        }
        return "redirect:/admin/sort/add";
    }

    /**
     * 后台删除分类请求处理
     *
     * @param id
     * @return
     */
    @RequestMapping("/admin/sort/del")
    public @ResponseBody
    Object delSort(@RequestParam(defaultValue = "") int id) {
        HashMap<String, String> map = new HashMap<>();
        if (articleService.selectBySortId(id).isEmpty() && sortService.deleteSortById(id)) {
            map.put("stateCode", "1");
        } else {
            map.put("stateCode", "0");
        }
        return map;
    }
}
