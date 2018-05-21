package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.ShowNewInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 2:59
 */

@Controller
@RequestMapping("/ammeter")
public class ShowNewInfoController {

    @Autowired
    private ShowNewInfoService showNewInfoService;

    @RequestMapping("/showNewInfo")
    @ResponseBody
    public String showNewInfo(Model model){
        //要让页面加载完成后显示最近添加的一条数据
        DataInfo dataInfo = showNewInfoService.getNewInfo();
        model.addAttribute("dataInfo",dataInfo);
        return "showDatas";
    }
}
