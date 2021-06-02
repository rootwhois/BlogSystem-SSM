package cn.blog.test;

import cn.blog.domain.Web;
import cn.blog.service.impl.WebServiceImpl;
import org.junit.Test;

import java.io.IOException;

/**
 * @author cgs
 * @create 2020-11-21-4:10 下午
 */
public class test {

    @Test
    public void test2() throws IOException {
        Web webInfo = new WebServiceImpl().getWebInfo();
        System.out.println(webInfo);
    }
}
