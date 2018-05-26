package cn.zjy.laoyan.ammeter.mapper;

import org.springframework.stereotype.Repository;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 3:32
 */
@Repository
public interface DeleteInfoMapper {

    //根据id物理删除数据
    void deleteInfoById(Integer id);
}
