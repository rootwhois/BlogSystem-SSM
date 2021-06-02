package cn.blog.service.impl;

import cn.blog.dao.SortMapper;
import cn.blog.domain.Sort;
import cn.blog.service.SortService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-3:08 下午
 */
@Service
public class SortServiceImpl implements SortService {
    @Autowired
    private SortMapper sortMapper;

    @Override
    public Sort selectSortById(Integer id) {
        return sortMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Sort> getSorts() {
        return sortMapper.selectByExample(null);
    }

    @Override
    public long countAllNum() {
        return sortMapper.countByExample(null);
    }

    @Override
    public boolean insertSort(Sort sort) {
        boolean flag = sortMapper.insert(sort) > 0;
        return flag;
    }

    @Override
    public boolean updateSortById(Sort sort) {
        boolean flag = sortMapper.updateByPrimaryKey(sort) > 0;
        return flag;
    }

    @Override
    public boolean deleteSortById(Integer id) {
        boolean flag = sortMapper.deleteByPrimaryKey(id) > 0;
        return flag;
    }
}
