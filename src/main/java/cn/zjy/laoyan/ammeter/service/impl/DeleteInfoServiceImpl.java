package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.DeleteInfoMapper;
import cn.zjy.laoyan.ammeter.service.DeleteInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 3:30
 */
@Service
public class DeleteInfoServiceImpl implements DeleteInfoService {

    @Autowired
    private DeleteInfoMapper deleteInfoMapper;

    //根据id物理删除数据
    @Override
    public void deleteInfoById(Integer id) {
        deleteInfoMapper.deleteInfoById(id);
    }
}
