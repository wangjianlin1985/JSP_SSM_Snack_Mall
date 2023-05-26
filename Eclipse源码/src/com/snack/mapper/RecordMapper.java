package com.snack.mapper;

import com.snack.model.Record;
import com.snack.model.RecordExample;
import com.snack.model.domain.DoRecord;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface RecordMapper {
    int countByExample(RecordExample example);

    int deleteByExample(RecordExample example);

    int deleteByPrimaryKey(Integer recordId);

    int insert(Record record);

    int insertSelective(Record record);

    List<Record> selectByExample(RecordExample example);

    Record selectByPrimaryKey(Integer recordId);

    int updateByExampleSelective(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByExample(@Param("record") Record record, @Param("example") RecordExample example);

    int updateByPrimaryKeySelective(Record record);

    int updateByPrimaryKey(Record record);
    
    List<DoRecord> selectGroupBytype(Map<String,String> map);
}