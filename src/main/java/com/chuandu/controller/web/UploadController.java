package com.chuandu.controller.web;

import com.chuandu.controller.BaseController;
import com.chuandu.model.IdCardInfo;
import com.chuandu.service.IdCardInfoService;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by Administrator on 2016/3/28.
 */
@Controller("uploadController")
@RequestMapping("/upload")
public class UploadController extends BaseController {

    private Logger logger = Logger.getLogger(UploadController.class);

    @Autowired
    private IdCardInfoService idCardInfoService;



    @RequestMapping(value = "/idcard",method = RequestMethod.POST)
    public String uploadIdCard(IdCardInfo idCardInfo,String waybillcode, MultipartFile frontCard,MultipartFile backCard,Model model){
        boolean flag = true;
        try {
            //判断数据有效性
            if(StringUtils.isBlank(idCardInfo.getIdcardnum())){
                flag = false;
                model.addAttribute("idCardNumError","证件号码不能为空！");
            }
            if(null == idCardInfo.getCardtype()){
                flag = false;
                model.addAttribute("cardTypeError","证件类型不能为空！");
            }
            if(StringUtils.isBlank(idCardInfo.getPhone())){
                flag = false;
                model.addAttribute("phoneError","电话号码不能为空！");
            }
            if(StringUtils.isBlank(idCardInfo.getEmail())){
                flag = false;
                model.addAttribute("emailError","电子邮件不能为空！");
            }
            if(StringUtils.isBlank(idCardInfo.getName())){
                flag = false;
                model.addAttribute("nameError","姓名不能为空！");
            }
            if(frontCard.getSize() == 0){
                flag = false;
                model.addAttribute("frontCardError","正面照片不能为空！");
            }else {
                //判断附件有效性
                String contentType = frontCard.getContentType();
                long size = frontCard.getSize();
                if(size >= 1048576l){
                    flag = false;
                    model.addAttribute("frontCardError","正面照片附件大小超过1024kb！");
                }
                if(!"image/png".equals(contentType) && !"image/jpg".equals(contentType) && !"image/gif".equals(contentType) && !"image/jpeg".equals(contentType)){
                    flag = false;
                    model.addAttribute("frontCardError","正面照片附件格式不正确！");
                }
            }
            if(backCard.getSize() == 0){
                flag = false;
                model.addAttribute("backCardError","背面照片不能为空！");
            }else{
                //判断附件有效性
                String contentType = backCard.getContentType();
                long size = backCard.getSize();
                if(size >= 1048576l){
                    flag = false;
                    model.addAttribute("backCardError","背面照片附件大小超过1024kb！");
                }
                if(!"image/png".equals(contentType) && !"image/jpg".equals(contentType) && !"image/gif".equals(contentType) && !"image/jpeg".equals(contentType)){
                    flag = false;
                    model.addAttribute("backCardError","背面照片附件格式不正确！");
                }
            }

            if(flag){
                idCardInfoService.saveOrUpdateIdCard(idCardInfo,waybillcode,frontCard,backCard);
            }else{
                model.addAttribute("idcardnumber",idCardInfo.getIdcardnum());
                model.addAttribute("cardtype",idCardInfo.getCardtype());
                model.addAttribute("phone",idCardInfo.getPhone());
                model.addAttribute("email",idCardInfo.getEmail());
                model.addAttribute("name",idCardInfo.getName());
                model.addAttribute("frontcard",frontCard.getOriginalFilename());
                model.addAttribute("backcard",backCard.getOriginalFilename());
                model.addAttribute("waybillcode",waybillcode);
                return "idcardupload";
            }
        } catch (Exception e) {
            logger.error(e.getMessage(),e);
        }
        return "page/common/sucess";
    }
}
