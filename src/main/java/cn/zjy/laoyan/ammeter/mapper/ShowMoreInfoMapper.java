package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.stereotype.Repository;

/*
 * @author dayong
 * @date 2018/5/23 0023 下午 4:34
 */
@Repository
public interface ShowMoreInfoMapper {

    //根据id查询出所有的数据并返回到页面上
    DataInfo selectInfo(Integer id);
}
