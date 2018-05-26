package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.UpdateMoreInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 4:53
 */
@Controller
@RequestMapping("/ammeter")
public class UpdateMoreInfoController {
    @Autowired
    private UpdateMoreInfoService updateMoreInfoService;

    //修改更多数据里的一条数据
    @RequestMapping("/updateMoreInfoById")
    public String deleteInfoById(Integer id, Model model){

        //先通过id查到一条数据.再把数据传到页面上
        DataInfo dataInfo = updateMoreInfoService.selectInfoById(id);
        model.addAttribute("newInfo",dataInfo);
        return "datasUpdate";
    }
}
