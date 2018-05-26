package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.service.DeleteInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @author dayong
 * @date 2018/5/26 0026 下午 3:24
 * 显示所有数据中的删除数据操作
 */
@Controller
@RequestMapping("/ammeter")
public class DeleteInfoController {

    @Autowired
    private DeleteInfoService deleteInfoService;

    //物理删除数据.要删除就是真的删除了
    @RequestMapping("/deleteBrandById")
    public String deleteInfoById(Integer id){

        //根据id物理删除数据
        deleteInfoService.deleteInfoById(id);
        return "forward:/ammeter/showAllDatas";
    }
}
