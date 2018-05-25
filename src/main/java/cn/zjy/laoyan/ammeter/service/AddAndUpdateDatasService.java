package cn.zjy.laoyan.ammeter.service;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;

/*
 * @author dayong
 * @date 2018/5/23 0023 上午 10:02
 */
public interface AddAndUpdateDatasService {

    //更改页面最后添加的新数据
    void updateOneData(DataInfo dataInfo);

    //添加一条新数据
    void insertNewDate(DataInfo dataInfo);
}
