package cn.zjy.laoyan.ammeter.service.impl;

import cn.zjy.laoyan.ammeter.mapper.ImportExcleMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.pojo.User;
import cn.zjy.laoyan.ammeter.service.ImportExcleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class ImportExcleServiceImpl implements ImportExcleService {

    /**
     * 日志打印
     */
 //   private Logger logger = LoggerFactory.getLogger(ImportExcleServiceImpl.class);

    @Autowired
    private ImportExcleMapper importExcleMapper;

    @Override
    public void insertLists(List<DataInfo> dataInfoList) {
        if(Objects.isNull(dataInfoList)){
  //          logger.info("传入的数据集合为空:{}",dataInfoList);
        }
        importExcleMapper.insertLists(dataInfoList);
    }

    @Override
    public void insertUsers(List<User> users) {
        importExcleMapper.insertUsers(users);
    }

    @Override
    public List<User> selectUsers() {
        return importExcleMapper.selectUsers();
    }

}
