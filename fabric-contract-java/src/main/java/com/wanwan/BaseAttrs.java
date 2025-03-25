package com.wanwan;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

@DataType
@Data
@Accessors(chain = true)
@NoArgsConstructor  // 添加无参构造函数
@AllArgsConstructor // 添加全参构造函数
public class BaseAttrs  {

    @Property
    private String k;

    @Property
    private Object v;

}
