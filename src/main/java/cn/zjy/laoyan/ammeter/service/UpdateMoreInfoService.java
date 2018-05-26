package cn.zjy.laoyan.ammeter.service;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 5:02
 */
public interface UpdateMoreInfoService {
    //修改更多数据里的一条数据
    DataInfo selectInfoById(Integer id);
}
