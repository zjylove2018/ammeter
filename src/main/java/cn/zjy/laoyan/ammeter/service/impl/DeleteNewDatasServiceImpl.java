package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.DeleteNewDatasMapper;
import cn.zjy.laoyan.ammeter.service.DeleteNewDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
 * @author dayong
 * @date 2018/5/27 0027 下午 5:23
 */
@Service
public class DeleteNewDatasServiceImpl implements DeleteNewDatasService {
    @Autowired
    private DeleteNewDatasMapper deleteNewDatasMapper;

    //根据id去删除最新添加的一条数据(物理删除)
    @Override
    public void deleteNewDateById(Integer id) {
        deleteNewDatasMapper.deleteNewDateById(id);
    }

    //根据id去删除最新添加的一条数据(逻辑删除)
    @Override
    public void updateNewDateById(Integer id) {
        deleteNewDatasMapper.updateNewDateById(id);
    }
}
