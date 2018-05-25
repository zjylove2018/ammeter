package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.mapper.ShowNewInfoMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 5:27
 * 这个controller是用来做跳转页面用的,暂时无业务需求,今后有业务需求再做处理
 */
@Controller
@RequestMapping("/ammeter")
public class SkipJsp {

    @Autowired
    private ShowNewInfoMapper showNewInfoMapper;

    @RequestMapping({"/addDatas"})
    public String toAddDatas(){

        return "datasAdd";
    }

    //这是主页上的修改数据.默认修改为最新添加的数据
    @RequestMapping({"/updateDatas"})
    public String toUpdateDatas(Model model){
        DataInfo newInfo = showNewInfoMapper.getNewInfo();
        model.addAttribute("newInfo",newInfo);
        return "datasUpdate";
    }
}
