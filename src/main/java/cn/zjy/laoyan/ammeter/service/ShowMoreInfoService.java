package cn.zjy.laoyan.ammeter.service;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;

/*
 * @author dayong
 * @date 2018/5/23 0023 下午 4:33
 */
public interface ShowMoreInfoService {
    //根据id查询出所有的数据并返回到页面上
    DataInfo selectInfo(Integer id);
}
