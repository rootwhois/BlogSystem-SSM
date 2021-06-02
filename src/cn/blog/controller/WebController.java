package cn.blog.controller;

import cn.blog.domain.Web;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * @author cgs
 * @create 2020-11-25-5:18 下午
 */
@Controller
public class WebController extends BaseController {
    /**
     * 调出后台网站信息编辑页
     *
     * @return
     */
    @RequestMapping("/admin/web/edit")
    public ModelAndView webConfig() {
        Web web = webService.getWebInfo();
        ModelAndView modelAndView = new ModelAndView("/admin/web_edit.jsp");
        modelAndView.addObject("web", web);
        return modelAndView;
    }

    /**
     * 网站信息修改请求处理
     *
     * @param id
     * @param name
     * @param domain
     * @param redirectAttributes
     * @return
     */
    @RequestMapping("/admin/web/edit/do")
    public String updateWeb(@RequestParam(defaultValue = "") int id,
                            @RequestParam(defaultValue = "") String name,
                            @RequestParam(defaultValue = "") String domain,
                            RedirectAttributes redirectAttributes) {
        Web web = new Web();
        web.setWebId(id);
        web.setWebName(name);
        web.setWebDomain(domain);
        //todo
        web.setWebIsOpen(true);
        if (webService.updateWebConfig(web)) {
            redirectAttributes.addFlashAttribute("succ", "修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("web", web);
            redirectAttributes.addFlashAttribute("error", "修改失败！");
        }
        return "redirect:/admin/web/edit";
    }
}
