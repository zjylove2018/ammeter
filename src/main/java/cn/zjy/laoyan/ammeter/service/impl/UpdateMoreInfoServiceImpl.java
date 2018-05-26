package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.UpdateMoreInfoMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.UpdateMoreInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 5:02
 */
@Service
public class UpdateMoreInfoServiceImpl implements UpdateMoreInfoService {
    @Autowired
    private UpdateMoreInfoMapper updateMoreInfoMapper;

    //修改更多数据里的一条数据,先到数据库查询出这条数据
    @Override
    public DataInfo selectInfoById(Integer id) {
        DataInfo dataInfo = updateMoreInfoMapper.selectInfoById(id);
        return dataInfo;
    }
}
