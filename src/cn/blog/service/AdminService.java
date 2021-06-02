package cn.blog.service;

import cn.blog.domain.Admin;

/**
 * @author cgs
 * @create 2020-11-22-7:39 下午
 */
public interface AdminService {
    /**
     * 根据id获取Admin
     *
     * @param id
     * @return Admin
     */
    Admin getInfo(Integer id);

    /**
     * 根据username获取Admin
     *
     * @param username
     * @return Admin
     */
    Admin getInfoByUsername(String username);

    /**
     * 更新Admin讯息
     *
     * @param admin
     * @return 1成功，0失败
     */
    Integer updateAdmin(Admin admin);
}
