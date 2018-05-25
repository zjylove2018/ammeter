package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.mapper.ShowAllDatasMapper;
import cn.zjy.laoyan.ammeter.mapper.ShowNewInfoMapper;
import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowMoreInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/*
 * @author dayong
 * @date 2018/5/23 0023 下午 4:29
 * 显示更多数据
 */
@Controller
@RequestMapping("/ammeter")
public class ShowMoreInfoController {

    @Autowired
    private ShowMoreInfoService showMoreInfoService;

    //显示更多数据
    @RequestMapping("/showMoreInfo")
    public String updateDate(Integer id, Model model){
        //根据id查询出所有的数据并返回到页面上
        DataInfo dataInfo = showMoreInfoService.selectInfo(id);
        model.addAttribute("dataInfo",dataInfo);
        return "showAllDatas";
    }
}
