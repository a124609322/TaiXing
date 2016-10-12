package com.chuandu.controller.admin;

import com.chuandu.controller.BaseController;
import com.chuandu.model.IdCardInfo;
import com.chuandu.service.IdCardInfoService;
import com.chuandu.vo.Pager;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

/**
 * Created by Administrator on 2016/3/28.
 */
@Controller
@RequestMapping("/admin/idcardinfo")
public class IdCardInfoController extends BaseController {

    private Logger logger = Logger.getLogger(IdCardInfoController.class);

    @Autowired
    private IdCardInfoService idCardInfoService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public Model list(Pager pager, Model model, String idnums, String name, String code, Integer deleted) throws ParseException {
        pager.setDataMap(new HashMap<String, Object>());
        pager.getDataMap().put("deleted", deleted);
        if (StringUtils.isNotBlank(name)) {
            pager.getDataMap().put("name", name);
        }
        if (StringUtils.isNotBlank(code)) {
            pager.getDataMap().put("code", code);
        }
        if (StringUtils.isNotBlank(idnums)) {
            String[] idNumArray = idnums.split("\\n");
            pager.getDataMap().put("idNumArray", idNumArray);
        }
        List<IdCardInfo> idCardInfoList = null;
        try {
            idCardInfoList = idCardInfoService.selectPager(pager);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        model.addAttribute("idCardInfoList", idCardInfoList);
        model.addAttribute("totalCount", pager.getTotal());
        return model;
    }

    @RequestMapping(value = "/exportIdCardList", method = RequestMethod.GET)
    public void exportIdCardList(String id, HttpServletResponse response) {
        String[] ids = id.split("!");
        // 设置response方式,使执行此controller时候自动出现下载页面,而非直接使用excel打开
        String excelName = "身份证信息.xlsx";
        response.setContentType("application/vnd.ms-excel");
        OutputStream os = null;
        try {
            response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(excelName, "UTF-8"));
            os = response.getOutputStream();
            idCardInfoService.handlerExportData(ids, os);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        } finally {
            if (null != os) {
                try {
                    os.flush();
                    os.close();
                } catch (IOException e) {
                    logger.error(e.getMessage(), e);
                }
            }
        }
    }

    @RequestMapping(value = "/exportIdCardPic", method = RequestMethod.GET)
    public void exportIdCardPic(String id, HttpServletResponse response) {
        String[] ids = id.split("!");
        // 设置response方式,使执行此controller时候自动出现下载页面,而非直接使用excel打开
        String excelName = "身份证信息照片.zip";
        response.setContentType("application/zip");
        OutputStream os = null;
        try {
            response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(excelName, "UTF-8"));
            os = response.getOutputStream();
            idCardInfoService.handlerExportPicData(ids, os);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
        } finally {
            if (null != os) {
                try {
                    os.flush();
                    os.close();
                } catch (IOException e) {
                    logger.error(e.getMessage(), e);
                }
            }
        }
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public Model deleteWaybill(String[] idList, Model model) {
        boolean success = true;
        try {
            idCardInfoService.deleteList(idList);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            success = false;
        }
        model.addAttribute("success", success);
        return model;
    }
}
