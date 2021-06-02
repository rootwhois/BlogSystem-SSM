package cn.blog.controller;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Ueditor的传图请求处理控制器
 *
 * @author cgs
 * @create 2020-11-27-10:55 上午
 */
@Controller
public class UploadController extends BaseController {

    //保存图片的路径
    //    String savePath = "/Users/admin/Desktop/upload";
    String savePath = "WEB-INF/jsp/static/upload/image/";

    @GetMapping("/admin/ueditor/uploadPic")
    public String intiUeditor() {
        return "redirect:/static/ueditor/jsp/config.json";
    }

    @RequestMapping(value = "/admin/ueditor/uploadPic",
            method = RequestMethod.POST,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> save(HttpServletRequest req) {
        Map<String, Object> rs = new HashMap<>();
        MultipartHttpServletRequest mReq = null;
        MultipartFile file = null;
        InputStream is = null;
        String fileName = "";
        // 原始文件名   UEDITOR创建页面元素时的alt和title属性
        String originalFileName = "";
        String filePath = "";
        try {
            mReq = (MultipartHttpServletRequest) req;
            // 从config.json中取得上传文件的ID
            file = mReq.getFile("upfile");
            // 取得文件的原始文件名称
            fileName = file.getOriginalFilename();
            originalFileName = fileName;
            //apache图片资源访问的路径
       /* String path=DeployProperties.getInstance().getProperty("PATH");
        String url=DeployProperties.getInstance().getProperty("APACHE_URL");*/
//            String webDomain = webService.getWebInfo().getWebDomain();
//            String path= webDomain+"static/upload/image/";
            String path = req.getContextPath() + "/static/upload/image";
            //获取图片文件的后缀名
            String type = fileName.substring(fileName.lastIndexOf("."));
            //保存到服务器上的文件名
            String trueFileName = System.currentTimeMillis() + type;
            //保存到服务器上的地址
            String realPath = req.getRealPath("") + savePath + trueFileName;
            //保存到服务器上
            file.transferTo(new File(realPath));
            //对外访问的路径,
            String picUrl = path + "/" + trueFileName;
            /*你的处理图片的代码*/
            rs.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
            rs.put("url", picUrl);//能访问到你现在图片的路径
            rs.put("title", originalFileName);
            rs.put("original", originalFileName);

        } catch (Exception e) {
            rs.put("state", "文件上传失败!"); //在此处写上错误提示信息，这样当错误的时候就会显示此信息
            rs.put("url", "");
            rs.put("title", "");
            rs.put("original", "");
            e.printStackTrace();
        }
        return rs;
    }

}