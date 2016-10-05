package com.chuandu.dao;

import com.chuandu.model.IdCardInfo;
import com.chuandu.vo.Pager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IdCardInfoMapper {
    int deleteByPrimaryKey(String id);

    int insert(IdCardInfo record);

    int insertSelective(IdCardInfo record);

    IdCardInfo selectByPrimaryKey(String id);

    IdCardInfo selectByIdNumber(@Param(value = "number") String number, @Param(value = "cardtype") Integer cardtype);

    int updateByPrimaryKeySelective(IdCardInfo record);

    int updateByPrimaryKey(IdCardInfo record);

    int selectPagerForCount(Pager pager);

    List<IdCardInfo> selectPager(Pager pager);

    List<IdCardInfo> selectByPrimaryKeys(List<String> ids);
}