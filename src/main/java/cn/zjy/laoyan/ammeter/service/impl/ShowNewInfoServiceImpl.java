package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.ShowNewInfoMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowNewInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 3:08
 */

@Service
public class ShowNewInfoServiceImpl implements ShowNewInfoService {

    //日志打印

    @Autowired
    private ShowNewInfoMapper showNewInfoMapper;

    //要让页面加载完成后显示最近添加的一条数据
    @Override
    public DataInfo getNewInfo() {
        DataInfo dataInfo = null;
        dataInfo = showNewInfoMapper.getNewInfo();
        return dataInfo;
    }
}
