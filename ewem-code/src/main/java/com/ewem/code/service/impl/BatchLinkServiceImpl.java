package com.ewem.code.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.ewem.code.dao.FabricDao;
import com.ewem.code.domain.BatchLink;
import com.ewem.code.domain.Fruit;
import com.ewem.code.domain.vo.BatchLinkVO;
import com.ewem.code.mapper.BatchLinkMapper;
import com.ewem.code.service.IBatchLinkService;
import com.ewem.common.core.domain.AjaxResult;
import com.ewem.common.core.mybatisplus.ServicePlusImpl;
import com.ewem.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;

/**
 * 批次环节记录Service业务层处理
 *
 * @author ewem
 * @date 2021-08-01
 */
@Service
public class BatchLinkServiceImpl extends ServicePlusImpl<BatchLinkMapper, BatchLink> implements IBatchLinkService {

    private static final Logger log = LoggerFactory.getLogger(BatchLinkServiceImpl.class);

    @Autowired
    BatchLinkMapper batchLinkMapper;

    @Autowired
    FabricDao fabricDao;

    @Override
    public BatchLink queryById(Long id){
        return getById(id);
    }

    @Override
    public List<BatchLinkVO> queryBatchLinkVOList(BatchLink batchLink) {
        return batchLinkMapper.queryBatchLinkVOList(batchLink);
    }

    @Override
    public List<BatchLink> queryList(BatchLink batchLink) {
        return batchLinkMapper.selectBatchLinkList(batchLink);
    }

    private LambdaQueryWrapper<BatchLink> buildQueryWrapper(BatchLink batchLink) {
        //Map<String, Object> params = batchLink.getParams();
        LambdaQueryWrapper<BatchLink> lqw = Wrappers.lambdaQuery();
        lqw.eq(batchLink.getBatchId() != null, BatchLink::getBatchId, batchLink.getBatchId());
        lqw.eq(batchLink.getLinkId() != null, BatchLink::getLinkId, batchLink.getLinkId());
        lqw.eq(StringUtils.isNotBlank(batchLink.getStatus()), BatchLink::getStatus, batchLink.getStatus());
        return lqw;
    }

    @Override
    public AjaxResult insertBy(BatchLink batchLink) {
        validEntityBeforeSave(batchLink);
        boolean save = save(batchLink);
        String s ="";
        try {
            Fruit fruit = new Fruit();
            BeanUtils.copyProperties(batchLink, fruit);
            s = fabricDao.insertFruit(JSON.toJSONString(fruit));
        }catch (Exception e){
            log.error("insertFruit异常：{}",e);
        }
        if(save){
            if(s.isEmpty()){
                return AjaxResult.success("操作成功");
            }else {
                return AjaxResult.success("新增成功,链上交易ID: "+s);
            }
        }else {
            return AjaxResult.error("操作失败");
        }
    }

    @Override
    public AjaxResult updateBy(BatchLink batchLink) {
        validEntityBeforeUpdate(batchLink);
        boolean b = updateById(batchLink);
        String s ="";
        try {
            Fruit fruit = new Fruit();
            BeanUtils.copyProperties(batchLink, fruit);
            s = fabricDao.updateFruit(JSON.toJSONString(fruit));
        }catch (Exception e){
            log.error("updateFruit异常：{}",e);
        }
        if(b){
            if(s.isEmpty()){
                return AjaxResult.success("操作成功");
            }else {
                return AjaxResult.success("修改成功,链上交易ID: "+s);
            }
        }else {
            return AjaxResult.error("操作失败");
        }
    }

    /**
     * 保存前的数据校验
     *
     * @param batchLink 实体类数据
     */
    private void validEntityBeforeSave(BatchLink batchLink){
    }

    /**
     * 修改前的数据校验
     *
     * @param batchLink 实体类数据
     */
    private void validEntityBeforeUpdate(BatchLink batchLink) {
    }

    @Override
    public Boolean deleteWithValidByIds(Collection<Long> ids, Boolean isValid) {
        if(isValid){
        }
        ids.forEach(id -> {
            BatchLink batchLink = batchLinkMapper.selectById(id);
            removeById(id);
            try {
                fabricDao.deleteFruit(new String[]{batchLink.getBatchId().toString(),batchLink.getLinkId().toString()});
            }catch (Exception e){
                log.error("deleteFruit异常：{}",e);
            }
        });
        return true;
    }
}
