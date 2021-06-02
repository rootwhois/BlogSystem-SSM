package cn.blog.service.impl;

import cn.blog.dao.WebMapper;
import cn.blog.domain.Web;
import cn.blog.service.WebService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-7:47 下午
 */
@Service
public class WebServiceImpl implements WebService {
    @Autowired
    private WebMapper webMapper;

    @Override
    public Web getWebInfo() {
        List<Web> webs = webMapper.selectByExample(null);
        return webs.get(0);
    }

    @Override
    public boolean updateWebConfig(Web web) {
        boolean flag = false;
        int i = webMapper.updateByPrimaryKey(web);
        if (i > 0) {
            flag = true;
        }
        return flag;
    }
}
