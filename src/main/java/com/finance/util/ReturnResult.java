package com.finance.util;

/**
 * Created by Administrator on 2017/1/19.
 */
public class ReturnResult {
    private boolean success; //�ɹ���ʧ�ܣ�true�ɹ���fasleʧ�ܣ�
    private String msg;  //��Ϣ

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
