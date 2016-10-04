package com.chuandu.dao;

import com.chuandu.model.IdCardInfo;
import org.apache.ibatis.annotations.Param;

public interface IdCardInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(IdCardInfo record);

    int insertSelective(IdCardInfo record);

    IdCardInfo selectByPrimaryKey(String id);

    IdCardInfo selectByIdNumber(@Param(value = "number") String number,@Param(value = "cardtype") Integer cardtype);

    int updateByPrimaryKeySelective(IdCardInfo record);

    int updateByPrimaryKey(IdCardInfo record);
}