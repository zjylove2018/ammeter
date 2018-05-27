package cn.zjy.laoyan.ammeter.service;

/*
 * @author dayong
 * @date 2018/5/27 0027 下午 5:23
 */
public interface DeleteNewDatasService {
    //根据id去删除最新添加的一条数据(物理删除)
    void deleteNewDateById(Integer id);

    //根据id去删除最新添加的一条数据(逻辑删除)
    void updateNewDateById(Integer id);
}
