package com.ewem.code.dao;

import com.alibaba.fastjson.JSONArray;
import com.ewem.code.domain.Fruit;
import com.ewem.code.domain.Link;
import com.ewem.code.domain.vo.BatchLinkVO;
import com.ewem.code.mapper.LinkMapper;
import org.hyperledger.fabric.client.Contract;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class FabricDao {

    private static final Logger log = LoggerFactory.getLogger(FabricDao.class);



    @Resource
    Contract contract;

    @Resource
    LinkMapper linkMapper;


    /**
     * 农产品上链
     */
    public String insertFruit(String args) {
        try {
            byte[] result = contract.submitTransaction("insertFruit", args);
            return new String(result, StandardCharsets.UTF_8);
        } catch (Exception e) {
            log.error("区块链异常 insertFruit:{}",e);
            throw new RuntimeException("区块链异常，insertFruit失败");
        }
    }

    public String updateFruit(String args) {
        try {
            byte[] result = contract.submitTransaction("updateFruit", args);
            return new String(result, StandardCharsets.UTF_8);
        } catch (Exception e) {
            log.error("区块链异常 updateFruit:{}",e);
            throw new RuntimeException("区块链异常，updateFruit失败");
        }
    }

    public String deleteFruit(String[] args) {
        try {
            byte[] result = contract.submitTransaction("deleteFruit", args);
            return new String(result, StandardCharsets.UTF_8);
        } catch (Exception e) {
            log.error("区块链异常 deleteFruit:{}",e);
            throw new RuntimeException("区块链异常，deleteFruit失败");
        }
    }

    /**
     * 根据溯源码获取农产品信息
     */
    public List<BatchLinkVO> getFruitInfo(String traceability_code) {
        try {

            byte[] result = contract.evaluateTransaction("getFruitInfo", traceability_code);
            List<Fruit> fruits = JSONArray.parseArray(new String(result, StandardCharsets.UTF_8), Fruit.class);
            List<BatchLinkVO> collect = fruits.stream().map(e -> {
                BatchLinkVO batchLink = new BatchLinkVO();
                batchLink.setAttrs(e.getAttrs());
                Link link = linkMapper.selectById(e.getLinkId());
                batchLink.setLink(link);
                return batchLink;
            }).collect(Collectors.toList());
            return collect;
        } catch (Exception e) {
            log.error("区块链异常 getFruitInfo:{}",e);
            throw new RuntimeException("区块链异常，查询失败");
        }
    }

    /**
     * 获取农产品上链历史
     */
    public String getFruitHistory(String traceability_code) {
        try {

            byte[] result = contract.evaluateTransaction("getFruitHistory", traceability_code);
            return new String(result, StandardCharsets.UTF_8);
        } catch (Exception e) {
            log.error("区块链异常 getFruitHistory:{}",e);
            throw new RuntimeException("区块链异常，查询失败");
        }
    }

}
