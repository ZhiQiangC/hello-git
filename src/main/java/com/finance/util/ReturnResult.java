package com.finance.util;

/**
 * Created by Administrator on 2017/1/19.
 */
public class ReturnResult {
    private boolean success; //成功或失败（true成功，fasle失败）
    private String msg;  //信息

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
