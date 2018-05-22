package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowAllDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/*
 * @author dayong
 * @date 2018/5/22 0022 下午 2:56
 */
@Controller
@RequestMapping({"/ammeter"})
public class ShowAllDatasController {

    @Autowired
    private ShowAllDatasService showAllDatasService;

    @RequestMapping({"/showAllDatas"})
    public String toAddDatas(Model model){
        //分页查询所有数据中重要的几个信息
        //TODO 分页查询实现
        List<DataInfo> dataInfoList = showAllDatasService.selectSignificanceInfo();
        model.addAttribute("dataInfoList",dataInfoList);
        System.out.print(dataInfoList.size());
        return "showAllDatas";
    }
}
