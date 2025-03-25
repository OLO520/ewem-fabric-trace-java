package com.ewem.code.domain.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.ewem.code.domain.BaseAttrs;
import com.ewem.code.domain.Batch;
import com.ewem.code.domain.Link;
import com.ewem.common.annotation.Excel;
import com.ewem.common.core.domain.BaseEntityPlus;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.List;

/**
 * 批次环节记录对象 ewem_batch_link
 *
 * @author ewem
 * @date 2021-08-01
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class BatchLinkVO implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 前端显示名称
     */
    private Link link;

    /**
     * 动态参数
     */
    @TableField(typeHandler = JacksonTypeHandler.class)
    private List<BaseAttrs> attrs;


}
