package com.finance.entity;

import java.math.BigDecimal;
import java.util.Date;

public class FinanceOnlineBankingEntity {

    private String id;


    private String bankCardNo;


    private Date accountTime;


    private String financeType;


    private String financeChannel;


    private BigDecimal inputfee;


    private BigDecimal outputfee;


    private String status;


    private String accountName;


    private String accountNo;


    private String accountBankName;


    private String abstractInfo;


    private String operationUserName;


    private BigDecimal operationUserId;


    private Date updateTime;


    private Date createTime;


    private BigDecimal remainFee;


    private String detailStatus;


    private String loanContractNo;


    private String loanName;


    public String getId() {
        return id;
    }


    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }


    public String getBankCardNo() {
        return bankCardNo;
    }


    public void setBankCardNo(String bankCardNo) {
        this.bankCardNo = bankCardNo == null ? null : bankCardNo.trim();
    }


    public Date getAccountTime() {
        return accountTime;
    }


    public void setAccountTime(Date accountTime) {
        this.accountTime = accountTime;
    }


    public String getFinanceType() {
        return financeType;
    }


    public void setFinanceType(String financeType) {
        this.financeType = financeType == null ? null : financeType.trim();
    }


    public String getFinanceChannel() {
        return financeChannel;
    }


    public void setFinanceChannel(String financeChannel) {
        this.financeChannel = financeChannel == null ? null : financeChannel.trim();
    }


    public BigDecimal getInputfee() {
        return inputfee;
    }


    public void setInputfee(BigDecimal inputfee) {
        this.inputfee = inputfee;
    }


    public BigDecimal getOutputfee() {
        return outputfee;
    }


    public void setOutputfee(BigDecimal outputfee) {
        this.outputfee = outputfee;
    }


    public String getStatus() {
        return status;
    }


    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }


    public String getAccountName() {
        return accountName;
    }


    public void setAccountName(String accountName) {
        this.accountName = accountName == null ? null : accountName.trim();
    }


    public String getAccountNo() {
        return accountNo;
    }


    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo == null ? null : accountNo.trim();
    }


    public String getAccountBankName() {
        return accountBankName;
    }


    public void setAccountBankName(String accountBankName) {
        this.accountBankName = accountBankName == null ? null : accountBankName.trim();
    }


    public String getAbstractInfo() {
        return abstractInfo;
    }


    public void setAbstractInfo(String abstractInfo) {
        this.abstractInfo = abstractInfo == null ? null : abstractInfo.trim();
    }


    public String getOperationUserName() {
        return operationUserName;
    }


    public void setOperationUserName(String operationUserName) {
        this.operationUserName = operationUserName == null ? null : operationUserName.trim();
    }


    public BigDecimal getOperationUserId() {
        return operationUserId;
    }


    public void setOperationUserId(BigDecimal operationUserId) {
        this.operationUserId = operationUserId;
    }


    public Date getUpdateTime() {
        return updateTime;
    }


    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }


    public Date getCreateTime() {
        return createTime;
    }


    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public BigDecimal getRemainFee() {
        return remainFee;
    }


    public void setRemainFee(BigDecimal remainFee) {
        this.remainFee = remainFee;
    }


    public String getDetailStatus() {
        return detailStatus;
    }


    public void setDetailStatus(String detailStatus) {
        this.detailStatus = detailStatus == null ? null : detailStatus.trim();
    }


    public String getLoanContractNo() {
        return loanContractNo;
    }


    public void setLoanContractNo(String loanContractNo) {
        this.loanContractNo = loanContractNo == null ? null : loanContractNo.trim();
    }


    public String getLoanName() {
        return loanName;
    }


    public void setLoanName(String loanName) {
        this.loanName = loanName == null ? null : loanName.trim();
    }
}