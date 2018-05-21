package cn.zjy.laoyan.ammeter.controller;

import cn.zjy.laoyan.ammeter.pojo.DataInfo;
import cn.zjy.laoyan.ammeter.pojo.User;
import cn.zjy.laoyan.ammeter.service.ImportExcleService;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/ammeter")
public class ImportExcleController {


    @Autowired
    private ImportExcleService importExcleService;

    @RequestMapping("/showAllUser")
    @ResponseBody
    public List<User> users(){

        return importExcleService.selectUsers();
    }

    @RequestMapping("/User_importXls")
    public void UserImportExcle(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) throws Exception {
        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream("C:\\Users\\Administrator\\Desktop\\用户名.xls"));
        HSSFSheet sheet = workbook.getSheet("Sheet1");

        List<User> users = new ArrayList<>();

        for (Row row : sheet) {
            //将第一行数据：标题信息不需要
            if (row.getRowNum() == 0) {
                continue;
            }
            String u_id = getCellValue(row.getCell(0));
            String username = getCellValue(row.getCell(1));
            String password = getCellValue(row.getCell(2));
            String telphone = getCellValue(row.getCell(3));
            String name = getCellValue(row.getCell(4));

            User user = new User();
            user.setU_id(u_id);
            user.setUsername(username);
            user.setPassword(password);
            user.setTelphone(telphone);
            user.setName(name);

            users.add(user);
        }
        importExcleService.insertUsers(users);
    }

    @RequestMapping("/ammeterInfo_importXls")
    public String ammeterInfoImportExcle(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {

        //检查文件
//        checkFile(file);
        String fileName = file.getOriginalFilename();
        List<DataInfo> dataInfoList = new ArrayList<>();
//        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(fileName));
        HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream("C:\\Users\\Administrator\\Desktop\\数据.xls"));
        HSSFSheet sheet = workbook.getSheet("Sheet1");

        //遍历sheet标签页中行
        for (Row row : sheet) {
            //将第一行数据：标题信息不需要
            if(row.getRowNum()==0){
                continue;
            }
            //通过索引获取单元格：将来每一行中数据，每一列数据都固定
            String info_id = getCellValue(row.getCell(0));
            String cheque_num = getCellValue(row.getCell(1));
            String worker = row.getCell(2).getStringCellValue();
            Date modifier_date = row.getCell(3).getDateCellValue();
            String item_num = row.getCell(4).getStringCellValue();

            String payment_num = row.getCell(5).getStringCellValue();
            Integer ammeter_num = row.getCell(6).getCellType();
            String payment_total = getCellValue(row.getCell(7));
            String isAccount = row.getCell(8).getStringCellValue();
            String station_type = row.getCell(9).getStringCellValue();

            String agreement_price = getCellValue(row.getCell(10));
            String area = row.getCell(11).getStringCellValue();
            String network_identity = row.getCell(12).getStringCellValue();
            Integer station_num = row.getCell(13).getCellType();
            String station_name = row.getCell(14).getStringCellValue();

            String machine_room = row.getCell(15).getStringCellValue();
            String machine_QR = row.getCell(16).getStringCellValue();
            String payment_period = getCellValue(row.getCell(17));
            String befor_payment_date = getCellValue(row.getCell(18));
            String last_ammeter_num = getCellValue(row.getCell(19));

            Double now_ammeter_num = row.getCell(20).getNumericCellValue();
            Double reality_report_num = row.getCell(21).getNumericCellValue();
            Date last_check_ammeter = row.getCell(22).getDateCellValue();
            Date now_check_ammeter = row.getCell(23).getDateCellValue();
            Double multiple = row.getCell(24).getNumericCellValue();

            Double form_price = row.getCell(25).getNumericCellValue();
            Double finance_price = row.getCell(26).getNumericCellValue();
            Double finance_expend_money = row.getCell(27).getNumericCellValue();
            Double electricity_num_a = row.getCell(28).getNumericCellValue();
            Double electricity_num_b = row.getCell(29).getNumericCellValue();

            Double electricity_num_c = row.getCell(30).getNumericCellValue();
            Integer electricity_num_d = row.getCell(31).getCellType();
            Double electricity_num_price = row.getCell(32).getNumericCellValue();
            Double move_account_money = row.getCell(33).getNumericCellValue();
            String returned_money_count = getCellValue(row.getCell(34));

            Double gross_margin = row.getCell(35).getNumericCellValue();
            String ammeter_type = row.getCell(36).getStringCellValue();
            String ammeter_discern_num = getCellValue(row.getCell(37));
            String ammeter_state = row.getCell(38).getStringCellValue();
            String station_state = row.getCell(39).getStringCellValue();

            String ammeter_address = row.getCell(40).getStringCellValue();
            String affiliation_company = row.getCell(41).getStringCellValue();
            String rent_company = row.getCell(42).getStringCellValue();
            String linkman = row.getCell(43).getStringCellValue();
            Integer phone = row.getCell(44).getCellType();

            String gathering_company = row.getCell(45).getStringCellValue();
            String machine_room_address = row.getCell(46).getStringCellValue();
            String tenement_address = row.getCell(47).getStringCellValue();
            String remark = row.getCell(48).getStringCellValue();
            String affirm_pact_money = row.getCell(49).getStringCellValue();

            Date balance_date = row.getCell(50).getDateCellValue();
            Date contract_date = row.getCell(51).getDateCellValue();
            Date income_date = row.getCell(52).getDateCellValue();
            String is_invoice = getCellValue(row.getCell(53));
            String contract_num = row.getCell(54).getStringCellValue();

            String invoice_type = row.getCell(55).getStringCellValue();
            Double tax_rate = row.getCell(56).getNumericCellValue();
            Double tax_money = row.getCell(57).getNumericCellValue();
            String invoice_num = row.getCell(58).getStringCellValue();

            Date currentTime = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String creat_time = formatter.format(currentTime);

            //创建电表相关数据对象
            DataInfo dataInfo = new DataInfo();

            dataInfo.setInfo_id(info_id);
            dataInfo.setCheque_num(cheque_num);
            dataInfo.setWorker(worker);
            dataInfo.setModifier_date(modifier_date);
            dataInfo.setItem_num(item_num);

            dataInfo.setPayment_num(payment_num);
            dataInfo.setAmmeter_num(ammeter_num);
            dataInfo.setPayment_total(payment_total);
            dataInfo.setIsAccount(isAccount);
            dataInfo.setStation_type(station_type);

            dataInfo.setAgreement_price(agreement_price);
            dataInfo.setArea(area);
            dataInfo.setNetwork_identity(network_identity);
            dataInfo.setStation_num(station_num);
            dataInfo.setStation_name(station_name);

            dataInfo.setMachine_room(machine_room);
            dataInfo.setMachine_QR(machine_QR);
            dataInfo.setPayment_period(payment_period);
            dataInfo.setBefor_payment_date(befor_payment_date);
            dataInfo.setLast_ammeter_num(last_ammeter_num);

            dataInfo.setNow_ammeter_num(now_ammeter_num);
            dataInfo.setReality_report_num(reality_report_num);
            dataInfo.setLast_check_ammeter(last_check_ammeter);
            dataInfo.setNow_check_ammeter(now_check_ammeter);
            dataInfo.setMultiple(multiple);

            dataInfo.setForm_price(form_price);
            dataInfo.setFinance_price(finance_price);
            dataInfo.setFinance_expend_money(finance_expend_money);
            dataInfo.setElectricity_num_a(electricity_num_a);
            dataInfo.setElectricity_num_b(electricity_num_b);

            dataInfo.setElectricity_num_c(electricity_num_c);
            dataInfo.setElectricity_num_d(electricity_num_d);
            dataInfo.setElectricity_num_price(electricity_num_price);
            dataInfo.setMove_account_money(move_account_money);
            dataInfo.setReturned_money_count(returned_money_count);

            dataInfo.setGross_margin(gross_margin);
            dataInfo.setAmmeter_type(ammeter_type);
            dataInfo.setAmmeter_discern_num(ammeter_discern_num);
            dataInfo.setAmmeter_state(ammeter_state);
            dataInfo.setStation_state(station_state);

            dataInfo.setAmmeter_address(ammeter_address);
            dataInfo.setAffiliation_company(affiliation_company);
            dataInfo.setRent_company(rent_company);
            dataInfo.setLinkman(linkman);
            dataInfo.setPhone(phone);

            dataInfo.setGathering_company(gathering_company);
            dataInfo.setMachine_room_address(machine_room_address);
            dataInfo.setTenement_address(tenement_address);
            dataInfo.setRemark(remark);
            dataInfo.setAffirm_pact_money(affirm_pact_money);

            dataInfo.setBalance_date(balance_date);
            dataInfo.setContract_date(contract_date);
            dataInfo.setIncome_date(income_date);
            dataInfo.setIs_invoice(is_invoice);
            dataInfo.setContract_num(contract_num);

            dataInfo.setInvoice_type(invoice_type);
            dataInfo.setTax_rate(tax_rate);
            dataInfo.setTax_money(tax_money);
            dataInfo.setInvoice_num(invoice_num);
            dataInfo.setCreat_time(creat_time);

            //将封装好的对象放入到集合中
            dataInfoList.add(dataInfo);
        }

        importExcleService.insertLists(dataInfoList);
        System.out.println("共有 " + dataInfoList.size() + " 条数据：");

        request.setAttribute("dataInfoList", dataInfoList);
        return "showDatas";
    }

    //检查上传的文件是否正确
    /*public static void checkFile(MultipartFile file) throws IOException{
        //判断文件是否存在
        if(null == file){
            throw new FileNotFoundException("文件不存在！");
        }
        //获得文件名
        String fileName = file.getOriginalFilename();
        //判断文件是否是excel文件
        if(!fileName.endsWith("xls") && !fileName.endsWith("xlsx")){
            throw new IOException(fileName + "不是excel文件");
        }
    }*/

    //获取单元格的值
    private String getCellValue(Cell c) {
        String o = null;
        switch (c.getCellType()) {
            case Cell.CELL_TYPE_BLANK:
                o = ""; break;
            case Cell.CELL_TYPE_BOOLEAN:
                o = String.valueOf(c.getBooleanCellValue()); break;
            case Cell.CELL_TYPE_FORMULA:
                o = String.valueOf(c.getCellFormula()); break;
            case Cell.CELL_TYPE_NUMERIC:
                o = String.valueOf(c.getNumericCellValue()); break;
            case Cell.CELL_TYPE_STRING:
                o = c.getStringCellValue(); break;
            default:
                o = null;
                break;
        }
        return o;
    }
}
