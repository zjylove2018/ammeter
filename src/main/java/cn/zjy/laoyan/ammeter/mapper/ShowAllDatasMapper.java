package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/*
 * @author dayong
 * @date 2018/5/22 0022 下午 4:46
 */
@Repository
public interface ShowAllDatasMapper {
    //查询所有的数据信息
    //TODO 分页查询实现
    List<DataInfo> selectSignificanceInfo();
}
