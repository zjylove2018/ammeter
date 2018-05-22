package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 5:25
 */
@Controller
@RequestMapping("/ammeter")
public class AddAndUpdateDatasController{

    //添加新数据的页面
    @RequestMapping("/addAmmeterInfo")
    public String addNewDate() {
        //要让页面加载完成后显示最近添加的一条数据
        System.out.print(1222222);
        return "";
    }

    //修改数据的页面
    @RequestMapping("/updateAmmeterInfo")
    public String updateDate(){
        //要让页面加载完成后显示最近添加的一条数据

        return "";
    }
}
