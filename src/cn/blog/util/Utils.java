package cn.blog.util;

import cn.blog.domain.Article;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-5:58 下午
 */
public class Utils {

    /**
     * 日期格式化
     *
     * @param date 日期格式
     * @return 格式化后的格式
     */
    public static String formatDate(Date date) {
        return new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
    }


    /**
     * 将String转换成UtilDate
     *
     * @param s      要转换的字符串
     * @param format 要转换的格式
     * @return UtilDate
     * @throws ParseException
     */
    public static Date StringToDate(String s, String format) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Date parse = sdf.parse(s);
        return parse;
    }

    /**
     * 将String转换成SqlDate
     *
     * @param s      要转换的字符串
     * @param format 要转换的格式
     * @return SqlDate
     * @throws ParseException
     */
    public static java.sql.Date StringToSqlDate(String s, String format) throws ParseException {
        Date date = StringToDate(s, format);
        return new java.sql.Date(date.getTime());
    }

    /**
     * 将List转换成HashMap（考虑用泛型或用更好方法替代）
     *
     * @param list
     * @return
     */
    public static HashMap<Integer, String> fmtArticleListToMap(List<Article> list) {
        HashMap<Integer, String> results = new HashMap<>();
        for (Article article : list) {
            results.put(article.getArticleId(), article.getArticleContent());
        }
        return results;
    }

    /**
     * 上传图片
     *
     * @param req  HttpServletRequest
     * @param file MultipartFile
     * @return 相对路径
     */
    public static String uploadFile(HttpServletRequest req, MultipartFile file) {
        String result = null;
        String savePath = "WEB-INF/jsp/static/upload/image/";

        try {
            if ("".equals(file.getOriginalFilename())) {
                return result;
            }
            String fileName = System.currentTimeMillis() + file.getOriginalFilename();
            String realPath = req.getRealPath("") + savePath + fileName;
            File destFile = new File(realPath);
            destFile.getParentFile().mkdirs();
            file.transferTo(destFile);
            result = "static/upload/image/" + fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return "上传失败," + e.getMessage();
        }
        return result;
    }
}
