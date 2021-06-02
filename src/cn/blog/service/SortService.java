package cn.blog.service;

import cn.blog.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cgs
 * @create 2020-11-22-3:04 下午
 */
@Service
public interface SortService {
    /**
     * 根据id查询分类
     *
     * @param id
     * @return Sort
     */
    Sort selectSortById(Integer id);

    /**
     * 查询全部分类
     *
     * @return List<Sort>
     */
    List<Sort> getSorts();

    /**
     * 统计分类条数
     *
     * @return long
     */
    long countAllNum();

    /**
     * 新增分类
     *
     * @param sort
     * @return true：成功，false：失败
     */
    boolean insertSort(Sort sort);

    /**
     * 更新分类
     *
     * @param sort
     * @return true：成功，false：失败
     */
    boolean updateSortById(Sort sort);

    /**
     * 根据sortId删除分类
     *
     * @param id
     * @return true：成功。false：失败
     */
    boolean deleteSortById(Integer id);
}
