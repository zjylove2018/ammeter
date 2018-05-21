package cn.zjy.laoyan.ammeter.pojo;

import java.util.Date;

/**
 * 所有数据的实体类
 * `id` BIGINT(50) NOT NULL AUTO_INCREMENT,
 *   `cheque_num` VARCHAR(50) DEFAULT NULL,
 *   `worker` VARCHAR(10) DEFAULT NULL,
 *   `modifier_date` DATE DEFAULT NULL,
 *   `item_num` VARCHAR(50) DEFAULT NULL,
 *
 *   `payment_num` VARCHAR(50) DEFAULT NULL,
 *   `ammeter_num` VARCHAR(50) DEFAULT NULL,
 *   `payment_total` VARCHAR(50) DEFAULT NULL,
 *   `isAccount` TINYINT(1) DEFAULT NULL,
 *   `station_type` VARCHAR(50) DEFAULT NULL,
 *
 *   `agreement_price` TINYINT(1) DEFAULT NULL,
 *   `area` VARCHAR(80) DEFAULT NULL,
 *   `network_identity` VARCHAR(50) DEFAULT NULL,
 *   `station_num` VARCHAR(50) DEFAULT NULL,
 *   `station_name` VARCHAR(50) DEFAULT NULL,
 *
 *   `machine_room` VARCHAR(50) DEFAULT NULL,
 *   `machine_QR` VARCHAR(50) DEFAULT NULL,
 *   `payment_period` VARCHAR(50) DEFAULT NULL,
 *   `befor_payment_date` DATE DEFAULT NULL,
 *   `last_ammeter_num` DOUBLE DEFAULT NULL,
 *
 *   `now_ammeter_num` DOUBLE DEFAULT NULL,
 *   `reality_report_num` DOUBLE DEFAULT NULL,
 *   `last_check_ammeter` DATE DEFAULT NULL,
 *   `now_check_ammeter` DATE DEFAULT NULL,
 *   `multiple` DOUBLE DEFAULT NULL,
 *
 *   `form_price` DOUBLE DEFAULT NULL,
 *   `finance_price` DOUBLE DEFAULT NULL,
 *   `finance_expend_money` DOUBLE DEFAULT NULL,
 *   `electricity_num_a` DOUBLE DEFAULT NULL,
 *   `electricity_num_b` DOUBLE DEFAULT NULL,
 *
 *   `electricity_num_c` DOUBLE DEFAULT NULL,
 *   `electricity_num_d` DOUBLE DEFAULT NULL,
 *   `electricity_num_price` DOUBLE DEFAULT NULL,
 *   `move_account_money` DOUBLE DEFAULT NULL,
 *   `returned_money_count` INT(11) DEFAULT NULL,
 *
 *   `gross_margin` DOUBLE DEFAULT NULL,
 *   `ammeter_type` VARCHAR(50) DEFAULT NULL,
 *   `ammeter_discern_num` VARCHAR(50) DEFAULT NULL,
 *   `ammeter_state` VARCHAR(50) DEFAULT NULL,
 *   `station_state` VARCHAR(50) DEFAULT NULL,
 *
 *   `ammeter_address` VARCHAR(50) DEFAULT NULL,
 *   `affiliation_company` VARCHAR(50) DEFAULT NULL,
 *   `rent_company` VARCHAR(50) DEFAULT NULL,
 *   `linkman` VARCHAR(10) DEFAULT NULL,
 *   `phone` VARCHAR(20) DEFAULT NULL,
 *
 *   `gathering_company` VARCHAR(50) DEFAULT NULL,
 *   `machine_room_address` VARCHAR(50) DEFAULT NULL,
 *   `tenement_address` VARCHAR(50) DEFAULT NULL,
 *   `remark` VARCHAR(50) DEFAULT NULL,
 *   `affirm_pact_money` VARCHAR(30) DEFAULT NULL,
 *
 *   `balance_date` DATE DEFAULT NULL,
 *   `contract_date` DATE DEFAULT NULL,
 *   `income_date` DATE DEFAULT NULL,
 *   `is_invoice` Boolean DEFAULT NULL,
 *   `contract_num` VARCHAR(50) DEFAULT NULL,
 *
 *   `invoice_type` VARCHAR(10) DEFAULT NULL,
 *   `tax_rate` DOUBLE DEFAULT NULL,
 *   `tax_money` DOUBLE DEFAULT NULL,
 *   `invoice_num` VARCHAR(50) DEFAULT NULL,
 */
public class DataInfo {

    //数据ID
    private String info_id;

    //支票号
    private String cheque_num;

    //缴费员
    private String worker;

    //更新日期
    private Date modifier_date;

    //项目编号
    private String item_num;

    //缴费号
    private String payment_num;

    //电表数
    private Integer ammeter_num;

    //缴费次数
    private String payment_total;

    //和移动结算情况
    private String isAccount;

    //基站类型
    private String station_type;

    //是否协议价
    private String agreement_price;

    //区域
    private String area;

    //网络标识
    private String network_identity;

    //站号
    private Integer station_num;

    //站名
    private String station_name;

    //所属机房
    private String machine_room;

    //机房二维码
    private String machine_QR;

    //缴费周期
    private String payment_period;

    //预交费日期
    private String befor_payment_date;

    //上期表数
    private String last_ammeter_num;

    //本期表数
    private Double now_ammeter_num;

    //实际报移动用电量
    private Double reality_report_num;

    //上期查表日期
    private Date last_check_ammeter;

    //本期查表日期
    private Date now_check_ammeter;

    //倍率
    private Double multiple;

    //抄表单单价
    private Double form_price;

    //财务单价
    private Double finance_price;

    //实际从财务支出金额
    private Double finance_expend_money;

    //用电量（1.05元/度）
    private Double electricity_num_a;

    //用电量（1.09元/度）
    private Double electricity_num_b;

    //用电量（1.123元/度）
    private Double electricity_num_c;

    //用电量（协议价）
    private Integer electricity_num_d;

    //协议价
    private Double electricity_num_price;

    //移动结算金额
    private Double move_account_money;

    //回款次数
    private String returned_money_count;

    //毛利（国税）
    private Double gross_margin;

    //电表类型
    private String ammeter_type;

    //电表识别号
    private String ammeter_discern_num;

    //电表问题
    private String ammeter_state;

    //基站问题
    private String station_state;

    //地址
    private String ammeter_address;

    //所属移动分公司
    private String affiliation_company;

    //出租单位名称
    private String rent_company;

    //甲方联系人
    private String linkman;

    //联系方式
    private Integer phone;

    //实际收款单位
    private String gathering_company;

    //机房位置
    private String machine_room_address;

    //物业位置
    private String tenement_address;

    //备注
    private String remark;

    //申请确认合同额
    private String affirm_pact_money;

    //结算日期
    private Date balance_date;

    //确认合同时间
    private Date contract_date;

    //确认收入时间
    private Date income_date;

    //是否有发票
    private String is_invoice;

    //合同编号
    private String contract_num;

    //发票类型
    private String invoice_type;

    //税点(%)
    private Double tax_rate;

    //税额
    private Double tax_money;

    //发票号
    private String invoice_num;

    //数据创建时间
    private  String creat_time;



    public String getInfo_id() {
        return info_id;
    }

    public void setInfo_id(String info_id) {
        this.info_id = info_id;
    }

    public String getCheque_num() {
        return cheque_num;
    }

    public void setCheque_num(String cheque_num) {
        this.cheque_num = cheque_num;
    }

    public String getWorker() {
        return worker;
    }

    public void setWorker(String worker) {
        this.worker = worker;
    }

    public Date getModifier_date() {
        return modifier_date;
    }

    public void setModifier_date(Date modifier_date) {
        this.modifier_date = modifier_date;
    }

    public String getItem_num() {
        return item_num;
    }

    public void setItem_num(String item_num) {
        this.item_num = item_num;
    }

    public String getPayment_num() {
        return payment_num;
    }

    public void setPayment_num(String payment_num) {
        this.payment_num = payment_num;
    }

    public Integer getAmmeter_num() {
        return ammeter_num;
    }

    public void setAmmeter_num(Integer ammeter_num) {
        this.ammeter_num = ammeter_num;
    }

    public String getPayment_total() {
        return payment_total;
    }

    public void setPayment_total(String payment_total) {
        this.payment_total = payment_total;
    }

    public String getIsAccount() {
        return isAccount;
    }

    public void setIsAccount(String isAccount) {
        this.isAccount = isAccount;
    }

    public String getStation_type() {
        return station_type;
    }

    public void setStation_type(String station_type) {
        this.station_type = station_type;
    }

    public String getAgreement_price() {
        return agreement_price;
    }

    public void setAgreement_price(String agreement_price) {
        this.agreement_price = agreement_price;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getNetwork_identity() {
        return network_identity;
    }

    public void setNetwork_identity(String network_identity) {
        this.network_identity = network_identity;
    }

    public Integer getStation_num() {
        return station_num;
    }

    public void setStation_num(Integer station_num) {
        this.station_num = station_num;
    }

    public String getStation_name() {
        return station_name;
    }

    public void setStation_name(String station_name) {
        this.station_name = station_name;
    }

    public String getMachine_room() {
        return machine_room;
    }

    public void setMachine_room(String machine_room) {
        this.machine_room = machine_room;
    }

    public String getMachine_QR() {
        return machine_QR;
    }

    public void setMachine_QR(String machine_QR) {
        this.machine_QR = machine_QR;
    }

    public String getPayment_period() {
        return payment_period;
    }

    public void setPayment_period(String payment_period) {
        this.payment_period = payment_period;
    }

    public String getBefor_payment_date() {
        return befor_payment_date;
    }

    public void setBefor_payment_date(String befor_payment_date) {
        this.befor_payment_date = befor_payment_date;
    }

    public String getLast_ammeter_num() {
        return last_ammeter_num;
    }

    public void setLast_ammeter_num(String last_ammeter_num) {
        this.last_ammeter_num = last_ammeter_num;
    }

    public Double getNow_ammeter_num() {
        return now_ammeter_num;
    }

    public void setNow_ammeter_num(Double now_ammeter_num) {
        this.now_ammeter_num = now_ammeter_num;
    }

    public Double getReality_report_num() {
        return reality_report_num;
    }

    public void setReality_report_num(Double reality_report_num) {
        this.reality_report_num = reality_report_num;
    }

    public Date getLast_check_ammeter() {
        return last_check_ammeter;
    }

    public void setLast_check_ammeter(Date last_check_ammeter) {
        this.last_check_ammeter = last_check_ammeter;
    }

    public Date getNow_check_ammeter() {
        return now_check_ammeter;
    }

    public void setNow_check_ammeter(Date now_check_ammeter) {
        this.now_check_ammeter = now_check_ammeter;
    }

    public Double getMultiple() {
        return multiple;
    }

    public void setMultiple(Double multiple) {
        this.multiple = multiple;
    }

    public Double getForm_price() {
        return form_price;
    }

    public void setForm_price(Double form_price) {
        this.form_price = form_price;
    }

    public Double getFinance_price() {
        return finance_price;
    }

    public void setFinance_price(Double finance_price) {
        this.finance_price = finance_price;
    }

    public Double getFinance_expend_money() {
        return finance_expend_money;
    }

    public void setFinance_expend_money(Double finance_expend_money) {
        this.finance_expend_money = finance_expend_money;
    }

    public Double getElectricity_num_a() {
        return electricity_num_a;
    }

    public void setElectricity_num_a(Double electricity_num_a) {
        this.electricity_num_a = electricity_num_a;
    }

    public Double getElectricity_num_b() {
        return electricity_num_b;
    }

    public void setElectricity_num_b(Double electricity_num_b) {
        this.electricity_num_b = electricity_num_b;
    }

    public Double getElectricity_num_c() {
        return electricity_num_c;
    }

    public void setElectricity_num_c(Double electricity_num_c) {
        this.electricity_num_c = electricity_num_c;
    }

    public Integer getElectricity_num_d() {
        return electricity_num_d;
    }

    public void setElectricity_num_d(Integer electricity_num_d) {
        this.electricity_num_d = electricity_num_d;
    }

    public Double getElectricity_num_price() {
        return electricity_num_price;
    }

    public void setElectricity_num_price(Double electricity_num_price) {
        this.electricity_num_price = electricity_num_price;
    }

    public Double getMove_account_money() {
        return move_account_money;
    }

    public void setMove_account_money(Double move_account_money) {
        this.move_account_money = move_account_money;
    }

    public String getReturned_money_count() {
        return returned_money_count;
    }

    public void setReturned_money_count(String returned_money_count) {
        this.returned_money_count = returned_money_count;
    }

    public Double getGross_margin() {
        return gross_margin;
    }

    public void setGross_margin(Double gross_margin) {
        this.gross_margin = gross_margin;
    }

    public String getAmmeter_type() {
        return ammeter_type;
    }

    public void setAmmeter_type(String ammeter_type) {
        this.ammeter_type = ammeter_type;
    }

    public String getAmmeter_discern_num() {
        return ammeter_discern_num;
    }

    public void setAmmeter_discern_num(String ammeter_discern_num) {
        this.ammeter_discern_num = ammeter_discern_num;
    }

    public String getAmmeter_state() {
        return ammeter_state;
    }

    public void setAmmeter_state(String ammeter_state) {
        this.ammeter_state = ammeter_state;
    }

    public String getStation_state() {
        return station_state;
    }

    public void setStation_state(String station_state) {
        this.station_state = station_state;
    }

    public String getAmmeter_address() {
        return ammeter_address;
    }

    public void setAmmeter_address(String ammeter_address) {
        this.ammeter_address = ammeter_address;
    }

    public String getAffiliation_company() {
        return affiliation_company;
    }

    public void setAffiliation_company(String affiliation_company) {
        this.affiliation_company = affiliation_company;
    }

    public String getRent_company() {
        return rent_company;
    }

    public void setRent_company(String rent_company) {
        this.rent_company = rent_company;
    }

    public String getLinkman() {
        return linkman;
    }

    public void setLinkman(String linkman) {
        this.linkman = linkman;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public String getGathering_company() {
        return gathering_company;
    }

    public void setGathering_company(String gathering_company) {
        this.gathering_company = gathering_company;
    }

    public String getMachine_room_address() {
        return machine_room_address;
    }

    public void setMachine_room_address(String machine_room_address) {
        this.machine_room_address = machine_room_address;
    }

    public String getTenement_address() {
        return tenement_address;
    }

    public void setTenement_address(String tenement_address) {
        this.tenement_address = tenement_address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAffirm_pact_money() {
        return affirm_pact_money;
    }

    public void setAffirm_pact_money(String affirm_pact_money) {
        this.affirm_pact_money = affirm_pact_money;
    }

    public Date getBalance_date() {
        return balance_date;
    }

    public void setBalance_date(Date balance_date) {
        this.balance_date = balance_date;
    }

    public Date getContract_date() {
        return contract_date;
    }

    public void setContract_date(Date contract_date) {
        this.contract_date = contract_date;
    }

    public Date getIncome_date() {
        return income_date;
    }

    public void setIncome_date(Date income_date) {
        this.income_date = income_date;
    }

    public String getIs_invoice() {
        return is_invoice;
    }

    public void setIs_invoice(String is_invoice) {
        this.is_invoice = is_invoice;
    }

    public String getContract_num() {
        return contract_num;
    }

    public void setContract_num(String contract_num) {
        this.contract_num = contract_num;
    }

    public String getInvoice_type() {
        return invoice_type;
    }

    public void setInvoice_type(String invoice_type) {
        this.invoice_type = invoice_type;
    }

    public Double getTax_rate() {
        return tax_rate;
    }

    public void setTax_rate(Double tax_rate) {
        this.tax_rate = tax_rate;
    }

    public Double getTax_money() {
        return tax_money;
    }

    public void setTax_money(Double tax_money) {
        this.tax_money = tax_money;
    }

    public String getInvoice_num() {
        return invoice_num;
    }

    public void setInvoice_num(String invoice_num) {
        this.invoice_num = invoice_num;
    }

    public String getCreat_time() {
        return creat_time;
    }

    public void setCreat_time(String creat_time) {
        this.creat_time = creat_time;
    }

    public DataInfo() {

    }

    public DataInfo(String info_id, String cheque_num, String worker, Date modifier_date, String item_num, String payment_num, Integer ammeter_num, String payment_total, String isAccount, String station_type, String agreement_price, String area, String network_identity, Integer station_num, String station_name, String machine_room, String machine_QR, String payment_period, String befor_payment_date, String last_ammeter_num, Double now_ammeter_num, Double reality_report_num, Date last_check_ammeter, Date now_check_ammeter, Double multiple, Double form_price, Double finance_price, Double finance_expend_money, Double electricity_num_a, Double electricity_num_b, Double electricity_num_c, Integer electricity_num_d, Double electricity_num_price, Double move_account_money, String returned_money_count, Double gross_margin, String ammeter_type, String ammeter_discern_num, String ammeter_state, String station_state, String ammeter_address, String affiliation_company, String rent_company, String linkman, Integer phone, String gathering_company, String machine_room_address, String tenement_address, String remark, String affirm_pact_money, Date balance_date, Date contract_date, Date income_date, String is_invoice, String contract_num, String invoice_type, Double tax_rate, Double tax_money, String invoice_num, String creat_time) {
        this.info_id = info_id;
        this.cheque_num = cheque_num;
        this.worker = worker;
        this.modifier_date = modifier_date;
        this.item_num = item_num;
        this.payment_num = payment_num;
        this.ammeter_num = ammeter_num;
        this.payment_total = payment_total;
        this.isAccount = isAccount;
        this.station_type = station_type;
        this.agreement_price = agreement_price;
        this.area = area;
        this.network_identity = network_identity;
        this.station_num = station_num;
        this.station_name = station_name;
        this.machine_room = machine_room;
        this.machine_QR = machine_QR;
        this.payment_period = payment_period;
        this.befor_payment_date = befor_payment_date;
        this.last_ammeter_num = last_ammeter_num;
        this.now_ammeter_num = now_ammeter_num;
        this.reality_report_num = reality_report_num;
        this.last_check_ammeter = last_check_ammeter;
        this.now_check_ammeter = now_check_ammeter;
        this.multiple = multiple;
        this.form_price = form_price;
        this.finance_price = finance_price;
        this.finance_expend_money = finance_expend_money;
        this.electricity_num_a = electricity_num_a;
        this.electricity_num_b = electricity_num_b;
        this.electricity_num_c = electricity_num_c;
        this.electricity_num_d = electricity_num_d;
        this.electricity_num_price = electricity_num_price;
        this.move_account_money = move_account_money;
        this.returned_money_count = returned_money_count;
        this.gross_margin = gross_margin;
        this.ammeter_type = ammeter_type;
        this.ammeter_discern_num = ammeter_discern_num;
        this.ammeter_state = ammeter_state;
        this.station_state = station_state;
        this.ammeter_address = ammeter_address;
        this.affiliation_company = affiliation_company;
        this.rent_company = rent_company;
        this.linkman = linkman;
        this.phone = phone;
        this.gathering_company = gathering_company;
        this.machine_room_address = machine_room_address;
        this.tenement_address = tenement_address;
        this.remark = remark;
        this.affirm_pact_money = affirm_pact_money;
        this.balance_date = balance_date;
        this.contract_date = contract_date;
        this.income_date = income_date;
        this.is_invoice = is_invoice;
        this.contract_num = contract_num;
        this.invoice_type = invoice_type;
        this.tax_rate = tax_rate;
        this.tax_money = tax_money;
        this.invoice_num = invoice_num;
        this.creat_time = creat_time;
    }

    @Override
    public String toString() {
        return "DataInfo{" +
                "info_id='" + info_id + '\'' +
                ", cheque_num='" + cheque_num + '\'' +
                ", worker='" + worker + '\'' +
                ", modifier_date=" + modifier_date +
                ", item_num='" + item_num + '\'' +
                ", payment_num='" + payment_num + '\'' +
                ", ammeter_num=" + ammeter_num +
                ", payment_total='" + payment_total + '\'' +
                ", isAccount='" + isAccount + '\'' +
                ", station_type='" + station_type + '\'' +
                ", agreement_price='" + agreement_price + '\'' +
                ", area='" + area + '\'' +
                ", network_identity='" + network_identity + '\'' +
                ", station_num=" + station_num +
                ", station_name='" + station_name + '\'' +
                ", machine_room='" + machine_room + '\'' +
                ", machine_QR='" + machine_QR + '\'' +
                ", payment_period='" + payment_period + '\'' +
                ", befor_payment_date='" + befor_payment_date + '\'' +
                ", last_ammeter_num='" + last_ammeter_num + '\'' +
                ", now_ammeter_num=" + now_ammeter_num +
                ", reality_report_num=" + reality_report_num +
                ", last_check_ammeter=" + last_check_ammeter +
                ", now_check_ammeter=" + now_check_ammeter +
                ", multiple=" + multiple +
                ", form_price=" + form_price +
                ", finance_price=" + finance_price +
                ", finance_expend_money=" + finance_expend_money +
                ", electricity_num_a=" + electricity_num_a +
                ", electricity_num_b=" + electricity_num_b +
                ", electricity_num_c=" + electricity_num_c +
                ", electricity_num_d=" + electricity_num_d +
                ", electricity_num_price=" + electricity_num_price +
                ", move_account_money=" + move_account_money +
                ", returned_money_count='" + returned_money_count + '\'' +
                ", gross_margin=" + gross_margin +
                ", ammeter_type='" + ammeter_type + '\'' +
                ", ammeter_discern_num='" + ammeter_discern_num + '\'' +
                ", ammeter_state='" + ammeter_state + '\'' +
                ", station_state='" + station_state + '\'' +
                ", ammeter_address='" + ammeter_address + '\'' +
                ", affiliation_company='" + affiliation_company + '\'' +
                ", rent_company='" + rent_company + '\'' +
                ", linkman='" + linkman + '\'' +
                ", phone=" + phone +
                ", gathering_company='" + gathering_company + '\'' +
                ", machine_room_address='" + machine_room_address + '\'' +
                ", tenement_address='" + tenement_address + '\'' +
                ", remark='" + remark + '\'' +
                ", affirm_pact_money='" + affirm_pact_money + '\'' +
                ", balance_date=" + balance_date +
                ", contract_date=" + contract_date +
                ", income_date=" + income_date +
                ", is_invoice='" + is_invoice + '\'' +
                ", contract_num='" + contract_num + '\'' +
                ", invoice_type='" + invoice_type + '\'' +
                ", tax_rate=" + tax_rate +
                ", tax_money=" + tax_money +
                ", invoice_num='" + invoice_num + '\'' +
                ", creat_time=" + creat_time +
                '}';
    }
}
