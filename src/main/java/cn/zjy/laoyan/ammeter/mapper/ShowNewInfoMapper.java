package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.stereotype.Repository;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 3:13
 */

@Repository
public interface ShowNewInfoMapper {
    //要让页面加载完成后显示最近添加的一条数据
    DataInfo getNewInfo();
}
