package cn.zjy.laoyan.ammeter.service;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;

import java.util.List;

/*
 * @author dayong
 * @date 2018/5/22 0022 下午 4:45
 */
public interface ShowAllDatasService {
    //查询所有的数据信息
    //TODO 分页查询实现
    List<DataInfo> selectSignificanceInfo();
}
