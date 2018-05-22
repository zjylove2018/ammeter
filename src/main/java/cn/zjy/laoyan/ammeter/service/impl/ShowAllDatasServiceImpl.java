package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.ShowAllDatasMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowAllDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*
 * @author dayong
 * @date 2018/5/22 0022 下午 4:46
 */
@Service
public class ShowAllDatasServiceImpl implements ShowAllDatasService {
    @Autowired
    private ShowAllDatasMapper showAllDatasMapper;

    @Override
    public List<DataInfo> selectSignificanceInfo() {
        //查询所有的数据信息
        //TODO 分页查询实现
        List<DataInfo> dataInfos = null;
        dataInfos = showAllDatasMapper.selectSignificanceInfo();
        return dataInfos;
    }
}
