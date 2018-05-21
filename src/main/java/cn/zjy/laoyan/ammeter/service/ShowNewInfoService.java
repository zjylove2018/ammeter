package cn.zjy.laoyan.ammeter.service;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 3:08
 */
public interface ShowNewInfoService {
    //要让页面加载完成后显示最近添加的一条数据
    DataInfo getNewInfo();
}
