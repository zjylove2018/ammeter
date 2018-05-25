package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.ShowMoreInfoMapper;
import cn.zjy.laoyan.ammeter.mapper.ShowNewInfoMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowMoreInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @author dayong
 * @date 2018/5/23 0023 下午 4:33
 */
@Service
public class ShowMoreInfoServiceImpl implements ShowMoreInfoService {
    @Autowired
    private ShowMoreInfoMapper showMoreInfoMapper;

    //根据id查询出所有的数据并返回到页面上
    @Override
    public DataInfo selectInfo(Integer id) {
        DataInfo dataInfo = null;
        dataInfo = showMoreInfoMapper.selectInfo(id);
        return dataInfo;
    }
}
