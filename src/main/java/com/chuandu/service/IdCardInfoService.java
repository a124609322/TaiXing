package com.chuandu.service;

import com.chuandu.model.IdCardInfo;
import com.chuandu.vo.Pager;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Created by a1246_000 on 2016/10/4.
 */
public interface IdCardInfoService {

    /**
     * @Description:保存或者更新身份证信息
     * @param idCardInfo
     * @param waybillcode
     * @param frontCard
     * @param backCard
     */
    void saveOrUpdateIdCard(IdCardInfo idCardInfo, String waybillcode, String frontCard, String backCard) throws IOException;

    List<IdCardInfo> selectPager(Pager pager);

    void handlerExportData(String[] ids, OutputStream os) throws IOException;

    void handlerExportPicData(String[] ids, OutputStream os) throws IOException;

    boolean isExist(String idcardnum, Integer cardtype);

    void deleteList(String[] idList) throws IOException;
}
