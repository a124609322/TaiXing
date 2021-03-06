package com.chuandu.controller.web;

import com.chuandu.constant.Constant;
import com.chuandu.controller.BaseController;
import com.chuandu.model.Manager;
import com.chuandu.model.Waybill;
import com.chuandu.service.WaybillServcie;
import com.chuandu.vo.Pager;
import com.mysql.jdbc.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2016/3/28.
 */
@Controller("webWaybillController")
@RequestMapping("/waybill")
public class WaybillController extends BaseController {

    private Logger logger = Logger.getLogger(WaybillController.class);

    @Autowired
    private WaybillServcie waybillServcie;

    @RequestMapping(value = "/view",method = RequestMethod.GET)
    public String view(Waybill waybill,Model model){
        Waybill temp = null;
        String timeconsuming ="";
        long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
        long nh = 1000 * 60 * 60;// 一小时的毫秒数
        long nm = 1000 * 60;// 一分钟的毫秒数
        long ns = 1000;// 一秒钟的毫秒数
        long diff;
        long day = 0;
        long hour = 0;
        long min = 0;
        long sec = 0;
        try {
            temp = waybillServcie.selectByCode(waybill.getCode());
            if(null != temp){
                if(temp.getLogisticsList().size() > 0){
                    if(null != temp.getEndtime()){
                        diff = temp.getEndtime().getTime() - temp.getLogisticsList().get(temp.getLogisticsList().size()-1).getDatetime().getTime();
                    }else{
                        diff = new Date().getTime() - temp.getLogisticsList().get(temp.getLogisticsList().size()-1).getDatetime().getTime();
                    }
                    day = diff / nd;// 计算差多少天
                    hour = diff % nd / nh + day * 24;// 计算差多少小时
                    min = diff % nd % nh / nm + day * 24 * 60;// 计算差多少分钟
                    sec = diff % nd % nh % nm / ns;// 计算差多少秒
                    // 输出结果
                    timeconsuming =  day + "天" + (hour - day * 24) + "小时" + (min - day * 24 * 60) + "分钟" + sec + "秒。";
                }else{
                    timeconsuming = "0天";
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
        if(null != temp){
            String companyCode = temp.getExpresscompany();
            if("SFEXPRESS".equals(companyCode)){
                temp.setExpresscompany("顺丰快递");
            }else if("ZTO".equals(companyCode)){
                temp.setExpresscompany("中通速递");
            }else if("YTO".equals(companyCode)){
                temp.setExpresscompany("圆通速递");
            }else if("YUNDA".equals(companyCode)){
                temp.setExpresscompany("韵达快运");
            }else if("HTKY".equals(companyCode)){
                temp.setExpresscompany("百世汇通");
            }else if("STO".equals(companyCode)){
                temp.setExpresscompany("申通快递");
            }else if("CNPL".equals(companyCode)){
                temp.setExpresscompany("中邮");
            }else if("CHINAPOST".equals(companyCode)){
                temp.setExpresscompany("邮政包裹");
            }
        }
        model.addAttribute("waybill",temp);
        model.addAttribute("timeconsuming",timeconsuming);
        return "/waybill";
    }
}
/*
{"value": "EMS", "text": "EMS"},
        {"value": "SFEXPRESS", "text": "顺丰快递"},
        {"value": "ZTO", "text": "中通速递"},
        {"value": "YTO", "text": "圆通速递"},
        {"value": "YUNDA", "text": "韵达快运"},
        {"value": "HTKY", "text": "百世汇通"},
        {"value": "STO", "text": "申通快递"},
        {"value": "CNPL", "text": "中邮"}*/
