package cn.blog.service.impl;

import cn.blog.dao.AdminMapper;
import cn.blog.domain.Admin;
import cn.blog.domain.AdminExample;
import cn.blog.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-7:40 下午
 */
@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin getInfo(Integer id) {
        return adminMapper.selectByPrimaryKey(id);
    }

    @Override
    public Admin getInfoByUsername(String username) {
        if (null == username) {
            return null;
        }
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andUserNameEqualTo(username);
        List<Admin> admins = adminMapper.selectByExample(example);
        if (admins.size() > 0) {
            return admins.get(0);
        }
        return null;
    }

    @Override
    public Integer updateAdmin(Admin admin) {
        return adminMapper.updateByPrimaryKey(admin);
    }


}
