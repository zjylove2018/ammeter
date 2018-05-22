package cn.zjy.laoyan.ammeter.controller;

import org.springframework.stereotype.Controller;
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

    @RequestMapping({"/addDatas"})
    public String toAddDatas(){

        return "datasAdd";
    }

    @RequestMapping({"/updateDatas"})
    public String toUpdateDatas(){

        return "datasUpdate";
    }
}
