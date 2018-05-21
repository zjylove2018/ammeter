package cn.zjy.laoyan.ammeter;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"cn.zjy.laoyan.ammeter.service","cn.zjy.laoyan.ammeter.controller"})
@MapperScan("cn.zjy.laoyan.ammeter.mapper")
public class AmmeterApplication {

    public static void main(String[] args) {
        SpringApplication.run(AmmeterApplication.class, args);
    }
}
