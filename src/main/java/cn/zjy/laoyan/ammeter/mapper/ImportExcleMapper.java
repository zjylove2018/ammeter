package cn.zjy.laoyan.ammeter.mapper;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.pojo.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ImportExcleMapper {

    //将集合保存到数据库
    void insertLists(List<DataInfo> dataInfoList);

    void insertUsers(List<User> users);

    List<User> selectUsers();
}
