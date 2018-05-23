package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/*
 * @author dayong
 * @date 2018/5/23 0023 上午 10:03
 */

@Repository
public interface AddAndUpdateDatasMapper {
    //添加一条新数据
    void insertOneData(DataInfo dataInfo);
}
