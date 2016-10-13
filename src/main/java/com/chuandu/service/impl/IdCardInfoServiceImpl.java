package com.chuandu.service.impl;

import com.chuandu.constant.Constant;
import com.chuandu.dao.IdCardInfoMapper;
import com.chuandu.model.IdCardInfo;
import com.chuandu.model.Waybill;
import com.chuandu.service.IdCardInfoService;
import com.chuandu.util.CommonUtil;
import com.chuandu.util.ExcelUtil;
import com.chuandu.vo.Pager;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * Created by Administrator on 2016/3/28.
 */
@Service
public class IdCardInfoServiceImpl extends BaseService implements IdCardInfoService {

    @Resource
    private IdCardInfoMapper idCardInfoMapper;


    @Override
    public void saveOrUpdateIdCard(IdCardInfo idCardInfo, String waybillcode, String frontCard, String backCard) throws IOException {
        IdCardInfo temp = idCardInfoMapper.selectByIdNumber(idCardInfo.getIdcardnum(),idCardInfo.getCardtype());
        String frontCardSrc = null;
        BufferedImage backCardImage = null;
        BufferedImage frontCardImage = null;
        BufferedImage idCardImage = null;
        if(StringUtils.isNotBlank(frontCard)){
            byte[] frontCardByte = CommonUtil.generateImage(frontCard);
            InputStream frontCardIS = new ByteArrayInputStream(frontCardByte);
            frontCardImage = ImageIO.read(frontCardIS);
        }
        if(StringUtils.isNotBlank(backCard)){
            byte[] backCardByte = CommonUtil.generateImage(backCard);
            InputStream backCardIS = new ByteArrayInputStream(backCardByte);
            backCardImage = ImageIO.read(backCardIS);
        }
        if(null != backCardImage && null != frontCardImage){
            idCardImage = CommonUtil.mergeImage(frontCardImage,backCardImage,false);
        }
        if(null == temp){
            temp = idCardInfo;
            temp.setId(UUID.randomUUID().toString());
            temp.setWaybillcode1(waybillcode);
            temp.setDeleted(1);
            temp.setCreatedate(new Date());
            frontCardSrc = CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum()+"/"+idCardInfo.getIdcardnum()+".jpg";
            temp.setFrontcard(frontCardSrc);
            idCardInfoMapper.insertSelective(temp);
        }else{
            temp.setName(idCardInfo.getName());
            temp.setPhone(idCardInfo.getPhone());
            temp.setEmail(idCardInfo.getEmail());
            temp.setModifydate(new Date());
            frontCardSrc = CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum()+"/"+idCardInfo.getIdcardnum()+".jpg";
            temp.setFrontcard(frontCardSrc);
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
        if(null == idCardImage){
            return;
        }
        String src =CommonUtil.getPropertiesValue("config.properties","basePath")+CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum();
        File file = new File(src);
        File[] tempFiles = null;
        if(file.exists()){
            tempFiles = file.listFiles();
            if(null != tempFiles){
                for(File deleteFile : tempFiles){
                    deleteFile.delete();
                }
            }
        }else{
            file.mkdirs();
        }
        String fileSrc = CommonUtil.getPropertiesValue("config.properties","basePath")+temp.getFrontcard();
        CommonUtil.saveImage(idCardImage,fileSrc,"jpg");
    }

    @Override
    public List<IdCardInfo> selectPager(Pager pager) {
        int count = idCardInfoMapper.selectPagerForCount(pager);
        pager.setTotal(count);
        return idCardInfoMapper.selectPager(pager);
    }

    @Override
    public void handlerExportData(String[] ids, OutputStream os) throws IOException {

        //处理非法数据
        List<String> idList = new ArrayList<String>();
        for(String id : ids){
            if(StringUtils.isNotBlank(id)){
                idList.add(id);
            }
        }
        List<IdCardInfo> idCardInfoList = idCardInfoMapper.selectByPrimaryKeys(idList);
        String[][] data = new String[idCardInfoList.size()+1][Constant.EXPORT_INCARD_LIST];
        handleHeader(data);
        handleContent(data,idCardInfoList);
        ExcelUtil.exportExcel(data,os);
    }

    @Override
    public void handlerExportPicData(String[] ids, OutputStream os) throws IOException {
        //处理非法数据
        List<String> idList = new ArrayList<String>();
        for(String id : ids){
            if(StringUtils.isNotBlank(id)){
                idList.add(id);
            }
        }
        List<IdCardInfo> idCardInfoList = idCardInfoMapper.selectByPrimaryKeys(idList);
        ZipOutputStream zos = new ZipOutputStream(os);
        ZipEntry zipEntry  = null;
        String frontSrc = CommonUtil.getPropertiesValue("config.properties","basePath");
        byte[] buf = null;
        int readLen = 0;
        InputStream is = null;
        for(IdCardInfo idCardInfo : idCardInfoList){
            if(StringUtils.isNotBlank(idCardInfo.getFrontcard())){
                buf = new byte[1024];
                readLen = 0;
                zipEntry = new ZipEntry(idCardInfo.getFrontcard().substring(idCardInfo.getFrontcard().lastIndexOf("/")+1));
                zos.putNextEntry(zipEntry);
                is = new BufferedInputStream(new FileInputStream(frontSrc+idCardInfo.getFrontcard()));
                // 把数据写入到客户端
                while ((readLen = is.read(buf, 0, 1024)) != -1) {
                    zos.write(buf, 0, readLen);
                }
                is.close();
            }
        }
        zos.close();
    }

    @Override
    public boolean isExist(String idcardnum, Integer cardtype) {
        IdCardInfo temp = idCardInfoMapper.selectByIdNumber(idcardnum,cardtype);
        if(null != temp && StringUtils.isNotBlank(temp.getIdcardnum())){
            return true;
        }
        return false;
    }

    @Override
    public void deleteList(String[] idList) throws IOException {
        IdCardInfo idCardInfo = null;
        for(String id : idList){
            idCardInfo = idCardInfoMapper.selectByPrimaryKey(id);
            if(null == idCardInfo){
                continue;
            }
            idCardInfoMapper.deleteByPrimaryKey(id);
            String src =CommonUtil.getPropertiesValue("config.properties","basePath")+CommonUtil.getPropertiesValue("config.properties","idcardpic_url")+idCardInfo.getIdcardnum();
            File file = new File(src);
            File[] tempFiles = null;
            if(file.exists()){
                tempFiles = file.listFiles();
                if(null != tempFiles){
                    for(File deleteFile : tempFiles){
                        deleteFile.delete();
                    }
                }
                file.delete();
            }
        }
    }

    private void handleContent(String[][] data, List<IdCardInfo> idCardInfoList) {
        int i = 1;
        for(IdCardInfo info : idCardInfoList){
            data[i][0] = info.getIdcardnum();
            data[i][1] = info.getName();
            data[i][2] = info.getPhone();
            data[i][3] = info.getEmail();
            data[i][4] = info.getWaybillcode1();
            data[i][5] = info.getWaybillcode2();
            data[i][6] = info.getWaybillcode3();
            data[i][7] = info.getWaybillcode4();
            data[i][8] = info.getWaybillcode5();
            data[i][9] = info.getWaybillcode6();
            i++;
        }
    }

    private void handleHeader(String[][] data){
        data[0][0] = "身份证号码";
        data[0][1] = "姓名";
        data[0][2] = "手机";
        data[0][3] = "邮箱";
        data[0][4] = "订单①";
        data[0][5] = "订单②";
        data[0][6] = "订单③";
        data[0][7] = "订单④";
        data[0][8] = "订单⑤";
        data[0][9] = "订单⑥";
    }
}
