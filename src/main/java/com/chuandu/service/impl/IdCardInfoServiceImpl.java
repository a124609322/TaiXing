package com.chuandu.service.impl;

import com.chuandu.dao.IdCardInfoMapper;
import com.chuandu.model.IdCardInfo;
import com.chuandu.service.IdCardInfoService;
import com.chuandu.util.CommonUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.UUID;

/**
 * Created by Administrator on 2016/3/28.
 */
@Service
public class IdCardInfoServiceImpl extends BaseService implements IdCardInfoService {

    @Resource
    private IdCardInfoMapper idCardInfoMapper;


    @Override
    public void saveOrUpdateIdCard(IdCardInfo idCardInfo, String waybillcode, MultipartFile frontCard, MultipartFile backCard) throws IOException {
        IdCardInfo temp = idCardInfoMapper.selectByIdNumber(idCardInfo.getIdcardnum(),idCardInfo.getCardtype());
        String frontCardSrc = CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum()+"/frontcard."+frontCard.getContentType().split("/")[1];
        String backCardSrc = CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum()+"/backcard."+backCard.getContentType().split("/")[1];
        if(null == temp){
            temp = idCardInfo;
            temp.setId(UUID.randomUUID().toString());
            temp.setWaybillcode1(waybillcode);
            temp.setDeleted(1);
            temp.setCreatedate(new Date());
            temp.setFrontcard(frontCardSrc);
            temp.setBackcard(backCardSrc);
            idCardInfoMapper.insertSelective(temp);
        }else{
            temp.setName(idCardInfo.getName());
            temp.setPhone(idCardInfo.getPhone());
            temp.setEmail(idCardInfo.getEmail());
            temp.setModifydate(new Date());
            temp.setFrontcard(frontCardSrc);
            temp.setBackcard(backCardSrc);
            if(StringUtils.isNotBlank(waybillcode)){
                if(StringUtils.isBlank(temp.getWaybillcode1())){
                    temp.setWaybillcode1(waybillcode);
                }else if(StringUtils.isBlank(temp.getWaybillcode2())){
                    temp.setWaybillcode2(waybillcode);
                }else if(StringUtils.isBlank(temp.getWaybillcode3())){
                    temp.setWaybillcode3(waybillcode);
                }else if(StringUtils.isBlank(temp.getWaybillcode4())){
                    temp.setWaybillcode4(waybillcode);
                }else if(StringUtils.isBlank(temp.getWaybillcode5())){
                    temp.setWaybillcode5(waybillcode);
                }else if(StringUtils.isBlank(temp.getWaybillcode6())){
                    temp.setWaybillcode6(waybillcode);
                }else{
                    temp.setWaybillcode1(temp.getWaybillcode2());
                    temp.setWaybillcode2(temp.getWaybillcode3());
                    temp.setWaybillcode3(temp.getWaybillcode4());
                    temp.setWaybillcode4(temp.getWaybillcode5());
                    temp.setWaybillcode5(temp.getWaybillcode6());
                    temp.setWaybillcode6(waybillcode);
                }
            }
            idCardInfoMapper.updateByPrimaryKeySelective(temp);
        }
        String src =CommonUtil.getPropertiesValue("config.properties","basePath")+CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum();
        File file = new File(src);
        File[] tempFiles = null;
        if(file.exists()){
            tempFiles = file.listFiles();
        }else{
            file.mkdirs();
        }
        File frontFile = new File(CommonUtil.getPropertiesValue("config.properties","basePath")+temp.getFrontcard());
        frontCard.transferTo(frontFile);
        File backFile = new File(CommonUtil.getPropertiesValue("config.properties","basePath")+temp.getBackcard());
        backCard.transferTo(backFile);
        if(null != tempFiles){
            for(File deleteFile : tempFiles){
                deleteFile.delete();
            }
        }
    }
}
