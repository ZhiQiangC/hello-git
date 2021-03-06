package com.finance.entity;

import java.util.Date;

public class FinanceTypeEntity {
 
	private String id;
	
    private String typeNumber; // 类型编号
	
	private String typeName;//类型名称
	
	private String updateUserId;//修改人ID
	
	private String updateUserName;//修改人姓名
	
	private Date updateTime;//修改时间
	
	private Date createTime;//创建时间
	
    private String isUsing; // 是否启用
    
    public String getIsUsing() {
        return isUsing;
    }
    
    public void setIsUsing(String isUsing) {
        this.isUsing = isUsing;
    }

    public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTypeNumber() {
        return typeNumber;
    }

    public void setTypeNumber(String typeNumber) {
        this.typeNumber = typeNumber;
    }

    public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getUpdateUserName() {
		return updateUserName;
	}

	public void setUpdateUserName(String updateUserName) {
		this.updateUserName = updateUserName;
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
}
