package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.AddAndUpdateDatasMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.AddAndUpdateDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * @author dayong
 * @date 2018/5/23 0023 上午 10:03
 */
@Service
public class AddAndUpdateDatasServiceImpl implements AddAndUpdateDatasService {
    @Autowired
    private AddAndUpdateDatasMapper addAndUpdateDatasMapper;

    //更改页面显示的最新数据
    @Override
    public void updateOneData(DataInfo dataInfo) {
        addAndUpdateDatasMapper.updateOneData(dataInfo);
    }

    //添加一条新数据
    @Override
    public void insertNewDate(DataInfo dataInfo) {
        //设置新添加数据的时间
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String creat_time = formatter.format(currentTime);
        //设置一个默认字段:10代表的是显示数据,新添加的数据默认是显示出来的
        String isShow = "10";
        dataInfo.setIsShow(isShow);
        dataInfo.setCreat_time(creat_time);

        addAndUpdateDatasMapper.insertNewDate(dataInfo);
    }
}
