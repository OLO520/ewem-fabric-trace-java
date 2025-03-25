package com.ewem.code.mapper;

import com.ewem.code.domain.BatchLink;
import com.ewem.code.domain.vo.BatchLinkVO;
import com.ewem.common.core.mybatisplus.BaseMapperPlus;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

/**
 * 批次环节记录Mapper接口
 *
 * @author ewem
 * @date 2021-08-01
 */
@Mapper
public interface BatchLinkMapper extends BaseMapperPlus<BatchLink> {


    List<BatchLink> selectBatchLinkList(BatchLink batchLink);

    List<BatchLinkVO> queryBatchLinkVOList(BatchLink batchLink);
}
