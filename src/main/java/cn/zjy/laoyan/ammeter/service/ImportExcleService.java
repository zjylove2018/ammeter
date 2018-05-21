package cn.zjy.laoyan.ammeter.service;


import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.pojo.User;

import java.util.List;

public interface ImportExcleService {

    //添加电表信息数据
    void insertLists(List<DataInfo> dataInfoList);

    //添加用户数据
    void insertUsers(List<User> user);

    List<User> selectUsers();
}
