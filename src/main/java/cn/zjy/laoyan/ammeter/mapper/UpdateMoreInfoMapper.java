package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.stereotype.Repository;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 5:08
 */
@Repository
public interface UpdateMoreInfoMapper {
    //修改更多数据里的一条数据,先到数据库查询出这条数据
    DataInfo selectInfoById(Integer id);

}
