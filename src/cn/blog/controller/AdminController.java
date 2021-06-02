package cn.blog.controller;

import cn.blog.domain.Admin;
import cn.blog.service.AdminService;
import cn.blog.util.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;

/**
 * @author cgs
 * @create 2020-11-23-3:43 下午
 */
@Controller
public class AdminController extends BaseController {

    @Autowired
    private AdminService adminService;

    /**
     * 关于页面
     *
     * @return
     */
    @RequestMapping("/about")
    public ModelAndView aboutMe() {
        return new ModelAndView("about.jsp");
    }

    /**
     * 登陆页面
     *
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView showLoginPage() {
        return new ModelAndView("admin/login.jsp");
    }

    /**
     * 登录处理
     *
     * @param username
     * @param password
     * @param session
     * @param req
     * @return
     */
    @RequestMapping("/login/do")
    public @ResponseBody
    Object login(@RequestParam(defaultValue = "") String username,
                 @RequestParam(defaultValue = "") String password,
                 HttpSession session,
                 HttpServletRequest req) {
        Admin admin = adminService.getInfoByUsername(username);
        HashMap<String, String> map = new HashMap<>();
        if (null == username) {
            map.put("stateCode", "1");
        } else if (null == admin || !admin.getUserPassword().equals(password)) {
            map.put("stateCode", "2");
        } else {
            String remoteAddr = req.getRemoteAddr();
            admin.setUserLastLoginIp(remoteAddr);
            admin.setUserLastLoginTime(new Date());
            adminService.updateAdmin(admin);
            //过拦截
            session.setAttribute("userId", admin.getUserId());
            map.put("stateCode", "0");
        }
        return map;
    }

    /**
     * 后台主页
     *
     * @return
     */
    @RequestMapping({"/admin/index", "/admin"})
    public ModelAndView adminIndex(@SessionAttribute int userId) {
        long articleCount = articleService.countAllNum();
        long sortCount = sortService.countAllNum();
        long tagCount = tagService.countAllNum();
        long commentCount = commentService.countAllNum();
        Admin admin = adminService.getInfo(userId);
        ModelAndView modelAndView = new ModelAndView("admin/main.jsp");
        modelAndView.addObject("articleCount", articleCount);
        modelAndView.addObject("sortCount", sortCount);
        modelAndView.addObject("tagCount", tagCount);
        modelAndView.addObject("commentCount", commentCount);
        modelAndView.addObject("admin", admin);
        return modelAndView;
    }

    /**
     * 登出请求处理
     *
     * @param session
     * @return
     */
    @RequestMapping("/admin/logout")
    public ModelAndView logout(HttpSession session) {
        session.removeAttribute("userId");
        return new ModelAndView("admin/login.jsp");
    }

    /**
     * 个人信息修改页面
     *
     * @param userId
     * @return
     */
    @RequestMapping("/admin/my/edit")
    public ModelAndView myEdit(@SessionAttribute int userId) {
        ModelAndView modelAndView = new ModelAndView("admin/my_edit.jsp");
        modelAndView.addObject("admin", adminService.getInfo(userId));
        return modelAndView;
    }

    /**
     * 个人信息修改请求处理
     *
     * @param req
     * @param redirectAttributes
     * @param id
     * @param nickname
     * @param email
     * @param birthday
     * @param file
     * @return
     * @throws ParseException
     */
    @RequestMapping("/admin/my/edit/do")
    public String myEdit(HttpServletRequest req,
                         RedirectAttributes redirectAttributes,
                         @RequestParam(defaultValue = "") int id,
                         @RequestParam(defaultValue = "") String nickname,
                         @RequestParam(defaultValue = "") String email,
                         @RequestParam(defaultValue = "") String birthday,
                         @RequestParam(value = "avatar", required = false) MultipartFile file) throws ParseException {
        String avatar = Utils.uploadFile(req, file);

        Admin admin = adminService.getInfo(id);
        admin.setUserId(id);
        admin.setUserNickname(nickname);
        admin.setUserEmail(email);
        if (null != avatar) {
            admin.setUserAvatar(avatar);
        }
        admin.setUserBirthday(Utils.StringToSqlDate(birthday, "yyyy-MM-dd"));
        if (adminService.updateAdmin(admin) > 0) {
            redirectAttributes.addFlashAttribute("succ", "修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("admin", admin);
            redirectAttributes.addFlashAttribute("error", "修改失败！");
        }
        return "redirect:/admin/my/edit";
    }

    /**
     * 账号信息修改
     *
     * @param userId
     * @return
     */
    @RequestMapping("/admin/account/edit")
    public ModelAndView accountEdit(@SessionAttribute int userId) {
        ModelAndView modelAndView = new ModelAndView("admin/account_edit.jsp");
        modelAndView.addObject("admin", adminService.getInfo(userId));
        return modelAndView;
    }

    /**
     * 账号信息修改请求处理
     *
     * @param id
     * @param username
     * @param question1
     * @param answer1
     * @param question2
     * @param answer2
     * @param question3
     * @param answer3
     * @param password
     * @param redirectAttributes
     * @return
     * @throws ParseException
     */
    @RequestMapping("/admin/account/do")
    public String editAccount(@RequestParam(defaultValue = "") int id,
                              @RequestParam(defaultValue = "") String username,
                              @RequestParam(defaultValue = "") String question1,
                              @RequestParam(defaultValue = "") String answer1,
                              @RequestParam(defaultValue = "") String question2,
                              @RequestParam(defaultValue = "") String answer2,
                              @RequestParam(defaultValue = "") String question3,
                              @RequestParam(defaultValue = "") String answer3,
                              @RequestParam(defaultValue = "") String password,
                              RedirectAttributes redirectAttributes) throws ParseException {
        Admin admin = adminService.getInfo(id);
        admin.setUserId(id);
        admin.setUserName(username);
        admin.setQuestion1(question1);
        admin.setAnswer1(answer1);
        admin.setQuestion2(question2);
        admin.setAnswer2(answer2);
        admin.setQuestion3(question3);
        admin.setAnswer3(answer3);
        if (!"".equals(password)) {
            admin.setUserPassword(password);
        }
        if (adminService.updateAdmin(admin) > 0) {
            redirectAttributes.addFlashAttribute("succ", "修改成功！");
        } else {
            redirectAttributes.addFlashAttribute("admin", admin);
            redirectAttributes.addFlashAttribute("error", "修改失败！");
        }
        return "redirect:/admin/account/edit";
    }

    /**
     * 忘记密码步骤1
     *
     * @return
     */
    @RequestMapping("/login/reset/step1")
    public ModelAndView reset1() {
        ModelAndView modelAndView = new ModelAndView("admin/resetPwd1.jsp");
        return modelAndView;
    }

    /**
     * 忘记密码步骤2
     *
     * @param username
     * @return
     */
    @RequestMapping("/login/reset/step2")
    public ModelAndView reset2(@RequestParam(defaultValue = "") String username) {
        ModelAndView modelAndView = null;
        Admin admin = adminService.getInfoByUsername(username);
        if (null != admin) {
            modelAndView = new ModelAndView("admin/resetPwd2.jsp");
            modelAndView.addObject("succ", "请继续完成以下确认步骤！");
            modelAndView.addObject("admin", admin);
        } else {
            modelAndView = new ModelAndView("admin/resetPwd1.jsp");
            modelAndView.addObject("error", "用户名不存在！");
        }
        return modelAndView;
    }

    /**
     * 忘记密码步骤3
     *
     * @param id
     * @param answer1
     * @param answer2
     * @param answer3
     * @param password1
     * @param redirectAttributes
     * @return
     * @throws ParseException
     */
    @RequestMapping("/login/reset/step3")
    public String reset3(@RequestParam(defaultValue = "") String id,
                         @RequestParam(defaultValue = "") String answer1,
                         @RequestParam(defaultValue = "") String answer2,
                         @RequestParam(defaultValue = "") String answer3,
                         @RequestParam(defaultValue = "") String password1,
                         RedirectAttributes redirectAttributes) throws ParseException {
        String path = "";
        Integer count = 0;
        Admin admin = adminService.getInfo(Integer.parseInt(id));
        if (null != admin) {
            String answer11 = admin.getAnswer1();
            String answer21 = admin.getAnswer2();
            String answer31 = admin.getAnswer3();
            if (answer11.equals(answer1) && answer21.equals(answer2) && answer31.equals(answer3) && !"".equals(password1)) {
                admin.setUserPassword(password1);
                count = adminService.updateAdmin(admin);
            }

        }
        if (count > 0) {
            path = "redirect:/login";
            redirectAttributes.addFlashAttribute("succ", "修改成功！");
        } else {
            path = "redirect:/login/resetPwd2.jsp";
            redirectAttributes.addFlashAttribute("error", "修改失败！");
        }
        return path;
    }

}
