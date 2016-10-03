package com.chuandu.controller.web;

import com.chuandu.controller.BaseController;
import com.chuandu.model.Banner;
import com.chuandu.service.BannerServcie;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * Created by Administrator on 2016/3/28.
 */
@Controller("uploadController")
@RequestMapping("/upload")
public class UploadController extends BaseController {

    private Logger logger = Logger.getLogger(UploadController.class);


    @RequestMapping(value = "/idcard",method = RequestMethod.GET)
    public String list(Model model){
        return "sucess";
    }
}
