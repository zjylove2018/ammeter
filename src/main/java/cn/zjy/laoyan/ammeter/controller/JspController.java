package cn.zjy.laoyan.ammeter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/*
 * @author dayong
 * @date 2018/5/19 0019 下午 5:49
 */
@Controller
public class JspController {

    @RequestMapping("/success")
    public String getJsp(){
        return "showDatas";
    }
}
