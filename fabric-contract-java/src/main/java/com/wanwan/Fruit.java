package com.wanwan;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

// 农产品结构体
@DataType
@Data
@Accessors(chain = true)
@NoArgsConstructor  // 添加无参构造函数
@AllArgsConstructor // 添加全参构造函数
public class Fruit {
    /**
     * 批次ID
     */
    @Property
    private Long batchId;

    /**
     * 环节ID
     */
    @Property
    private Long linkId;

    /**
     * 动态参数
     */
    @Property
    private BaseAttrs[] attrs;

    /**
     * 备注
     */
    @Property
    private String remark;

    @Property
    private String txid;

    @Property
    private String timestamp;


}
