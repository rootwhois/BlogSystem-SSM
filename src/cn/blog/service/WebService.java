package cn.blog.service;

import cn.blog.domain.Web;

/**
 * @author cgs
 * @create 2020-11-22-7:47 下午
 */
public interface WebService {
    /**
     * 获取网站信息
     *
     * @return Web
     */
    Web getWebInfo();

    /**
     * 更新网站信息
     *
     * @param web
     * @return true：成功，false：失败
     */
    boolean updateWebConfig(Web web);
}
