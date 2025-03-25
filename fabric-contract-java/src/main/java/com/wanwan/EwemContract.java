package com.wanwan;

import com.alibaba.fastjson.JSON;
import lombok.extern.java.Log;
import org.apache.commons.lang3.StringUtils;
import org.hyperledger.fabric.contract.Context;
import org.hyperledger.fabric.contract.ContractInterface;
import org.hyperledger.fabric.contract.annotation.*;
import org.hyperledger.fabric.shim.ChaincodeException;
import org.hyperledger.fabric.shim.ChaincodeStub;
import org.hyperledger.fabric.shim.ledger.CompositeKey;
import org.hyperledger.fabric.shim.ledger.KeyModification;
import org.hyperledger.fabric.shim.ledger.KeyValue;
import org.hyperledger.fabric.shim.ledger.QueryResultsIterator;

import java.time.Instant;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Contract(
        name = "EwemContract",
        info = @Info(
                title = "Fruit Traceability Contract",
                description = "A smart contract for fruit traceability",
                version = "0.0.1-SNAPSHOT",
                license = @License(
                        name = "Apache 2.0 License",
                        url = "http://www.apache.org/licenses/LICENSE-2.0.html"),
                contact = @Contact(
                        email = "f.smart@example.com",
                        name = "F Smart",
                        url = "https://hyperledger.example.com"))
)
@Default
@Log
public class EwemContract implements ContractInterface {

    private static final String OBJECT_TYPE = "EwemRecord";


    // 农产品上链
    @Transaction()
    public String insertFruit(Context ctx, String arg1) {
        ChaincodeStub stub = ctx.getStub();
        String txid = stub.getTxId();
        String timestamp = getFormattedTimestamp(stub);
        try {
            Fruit fruit = JSON.parseObject(arg1, Fruit.class);
            BaseAttrs[] attrs = fruit.getAttrs();
            BaseAttrs baseAttrs1 = new BaseAttrs();
            baseAttrs1.setK("区块链交易ID");
            baseAttrs1.setV(txid);
            BaseAttrs baseAttrs2 = new BaseAttrs();
            baseAttrs2.setK("区块链交易时间");
            baseAttrs2.setV(timestamp);
            BaseAttrs[] newArray = new BaseAttrs[attrs.length + 2];
            for (int i = 0; i < attrs.length; i++) {
                newArray[i] = attrs[i];
            }
            newArray[attrs.length] = baseAttrs1;
            newArray[attrs.length+1] = baseAttrs2;
            fruit.setAttrs(newArray);
            String json = JSON.toJSONString(fruit);
            CompositeKey compositeKey = stub.createCompositeKey(OBJECT_TYPE,fruit.getBatchId().toString(), fruit.getLinkId().toString());
            stub.putStringState(compositeKey.toString(), json);
        } catch (Exception e) {
            log.info("Failed to insert fruit: " + e);
            throw new ChaincodeException("Failed to insert fruit: " + e.getMessage());
        }

        return txid;
    }

    @Transaction()
    public String updateFruit(Context ctx, String arg1) {
        ChaincodeStub stub = ctx.getStub();
        String txid = stub.getTxId();
        String timestamp = getFormattedTimestamp(stub);
        try {
            Fruit fruit = JSON.parseObject(arg1, Fruit.class);
            BaseAttrs[] attrs = fruit.getAttrs();
            BaseAttrs baseAttrs1 = new BaseAttrs();
            baseAttrs1.setK("区块链交易ID");
            baseAttrs1.setV(txid);
            BaseAttrs baseAttrs2 = new BaseAttrs();
            baseAttrs2.setK("区块链交易时间");
            baseAttrs2.setV(timestamp);
            BaseAttrs[] newArray = new BaseAttrs[attrs.length + 2];
            for (int i = 0; i < attrs.length; i++) {
                newArray[i] = attrs[i];
            }
            newArray[attrs.length] = baseAttrs1;
            newArray[attrs.length+1] = baseAttrs2;
            fruit.setAttrs(newArray);
            String json = JSON.toJSONString(fruit);
            CompositeKey compositeKey = stub.createCompositeKey(OBJECT_TYPE,fruit.getBatchId().toString(), fruit.getLinkId().toString());
            stub.putStringState(compositeKey.toString(), json);
        } catch (Exception e) {
            log.info("Failed to update fruit: " + e);
            throw new ChaincodeException("Failed to update fruit: " + e.getMessage());
        }

        return txid;
    }

    @Transaction
    public void deleteFruit(final Context ctx, final String key1,final String key2) {

        ChaincodeStub stub = ctx.getStub();
        CompositeKey compositeKey = stub.createCompositeKey(OBJECT_TYPE,key1, key2);
        String catState = stub.getStringState(compositeKey.toString());

        if (StringUtils.isBlank(catState)) {
            String errorMessage = String.format("Cat %s does not exist", compositeKey);
            System.out.println(errorMessage);
            throw new ChaincodeException(errorMessage);
        }
        try {
            stub.delState(compositeKey.toString());
        } catch (Exception e) {
            log.info("Failed to delete fruit: " + e);
            throw new ChaincodeException("Failed to delete fruit: " + e.getMessage());
        }
    }



    // 获取所有的农产品信息
    @Transaction()
    public Fruit[] getFruitInfo(Context ctx, String traceability_code) throws Exception {
        ChaincodeStub stub = ctx.getStub();
        CompositeKey compositeKey = stub.createCompositeKey(OBJECT_TYPE, traceability_code);
        QueryResultsIterator<KeyValue> results = stub.getStateByPartialCompositeKey(compositeKey.toString());
        List<Fruit> fruits = new ArrayList<>();
        try {
            for (KeyValue result : results) {
                try {
                    log.info("result StringValue: " + result.getStringValue());
                    Fruit fruit = JSON.parseObject(result.getStringValue(), Fruit.class);
                    if(fruit!=null){
                        fruits.add(fruit);
                    }
                } catch (Exception e) {
                    // 如果解析失败，则跳过该条记录
                    log.info("****************Failed to get all fruit info: " + e);
                    continue;
                }
            }
        } catch (Exception e) {
            throw new ChaincodeException("Failed to get all fruit info: " + e.getMessage());
        } finally {
            results.close();
        }
        return fruits.toArray(new Fruit[fruits.size()]);
    }


    // 获取格式化的时间戳
    private String getFormattedTimestamp(ChaincodeStub stub) {
        return Instant.ofEpochSecond(stub.getTxTimestamp().getEpochSecond())
                .atZone(ZoneId.of("Asia/Shanghai"))
                .format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

    @Override
    public void beforeTransaction(Context ctx) {
        log.info("*************************************** beforeTransaction ***************************************");
    }

    @Override
    public void afterTransaction(Context ctx, Object result) {
        log.info("*************************************** afterTransaction ***************************************");
        log.info("result --------> " + result);
    }
}
