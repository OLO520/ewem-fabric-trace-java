package com.wanwan;


import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hyperledger.fabric.contract.annotation.DataType;
import org.hyperledger.fabric.contract.annotation.Property;

// 历史查询结果结构体
@DataType
@Data
@Accessors(chain = true)
@NoArgsConstructor  // 添加无参构造函数
public class HistoryQueryResult {
    @Property
    private Fruit record;
    @Property
    private String txId;
    @Property
    private String timestamp;
    @Property
    private boolean isDelete;

    public HistoryQueryResult(Fruit fruit, String txId, String timestamp, boolean deleted) {
        this.record = fruit != null ? fruit : new Fruit();
        this.txId = txId;
        this.timestamp = timestamp;
        this.isDelete = deleted;
    }
}
