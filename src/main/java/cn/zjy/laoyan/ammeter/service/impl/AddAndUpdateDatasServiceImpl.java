package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.AddAndUpdateDatasMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.AddAndUpdateDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        addAndUpdateDatasMapper.insertNewDate(dataInfo);
    }
}
