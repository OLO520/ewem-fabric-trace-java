package com.ewem.common.enums;

/**
 * @author qianyan
 * <p>
 * 溯源方式状态
 */
public enum TraceType {

    COMMON("1", "普通溯源"),

    FABRIC("2", "区块链溯源");

    private final String code;
    private final String info;

    TraceType(String code, String info) {
        this.code = code;
        this.info = info;
    }

    public String getCode() {
        return code;
    }

    public String getInfo() {
        return info;
    }
}
