package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.AddAndUpdateDatasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/*
 * @author dayong
 * @date 2018/5/21 0021 下午 5:25
 */
@Controller
@RequestMapping("/ammeter")
public class AddAndUpdateDatasController{

    @Autowired
    private AddAndUpdateDatasService addAndUpdateDatasService;

    //添加新数据的页面
    @RequestMapping("/addAmmeterInfo")
    public String addNewDate(@Valid DataInfo dataInfo) {

        //添加一条新数据
        addAndUpdateDatasService.insertOneData(dataInfo);
        System.out.print(dataInfo);
        return "showDatas";
    }

    //修改数据的页面
    @RequestMapping("/updateAmmeterInfo")
    public String updateDate(){
        //

        return "";
    }
}
