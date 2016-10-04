package com.chuandu.service;

import com.chuandu.model.IdCardInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

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
    void saveOrUpdateIdCard(IdCardInfo idCardInfo, String waybillcode, MultipartFile frontCard, MultipartFile backCard) throws IOException;
}
