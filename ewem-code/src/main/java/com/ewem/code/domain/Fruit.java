package com.ewem.code.domain;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

// 农产品结构体
@Data
@NoArgsConstructor  // 添加无参构造函数
@AllArgsConstructor // 添加全参构造函数
public class Fruit {
    /**
     * 批次ID
     */
    private Long batchId;

    /**
     * 环节ID
     */
    private Long linkId;

    /**
     * 动态参数
     */
    private List<BaseAttrs> attrs;

    /**
     * 备注
     */
    private String remark;

    private String txid;

    private String timestamp;


}
