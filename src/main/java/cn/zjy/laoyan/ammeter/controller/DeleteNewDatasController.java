package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.DeleteNewDatasService;
import cn.zjy.laoyan.ammeter.service.ShowNewInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @author dayong
 * @date 2018/5/25 0025 下午 7:05
 */
@Controller
@RequestMapping("/ammeter")
public class DeleteNewDatasController {

    @Autowired
    private ShowNewInfoService showNewInfoService;

    @Autowired
    private DeleteNewDatasService deleteNewDatasService;

    //删除最新数据(物理删除.直接从数据库删除)
    @RequestMapping("/deleteNewDatas")
    public String deleteNewDateById(Integer id,Model model) {
        //根据id去删除最新添加的一条数据(物理删除)
        deleteNewDatasService.deleteNewDateById(id);

        //删除完之后页面显示的最新数据
        DataInfo dataInfo = showNewInfoService.getNewInfo();
        model.addAttribute("dataInfo",dataInfo);
        return "showDatas";
    }

    //删除最新数据(逻辑删除.直接从数据库删除)
    @RequestMapping("/updateNewDatas")
    public String updateNewDateById(Integer id,Model model) {
        //根据id去删除最新添加的一条数据(逻辑删除)
        deleteNewDatasService.updateNewDateById(id);

        //删除完之后页面显示的最新数据
        DataInfo dataInfo = showNewInfoService.getNewInfo();
        model.addAttribute("dataInfo",dataInfo);
        return "showDatas";
    }
}
