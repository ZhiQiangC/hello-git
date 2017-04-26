package com.test.user.dto;

import java.util.List;

/**
 * Created by zhph on 2016-12-27.
 */
public class UserListDto {

    private Integer curPage;

    private Integer recordCount;

    private Integer pageCount;

    private  Integer pageSize;

    private List<?> results;

    public Integer getCurPage() {
        return curPage;
    }

    public void setCurPage(Integer curPage) {
        this.curPage = curPage;
    }

    public Integer getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Integer recordCount) {
        this.recordCount = recordCount;
    }

    public Integer getPageCount() {
        if (recordCount % pageSize == 0) {
            return  recordCount / pageSize;
        } else {
            return  recordCount / pageSize + 1;
        }
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public List<?> getResults() {
        return results;
    }

    public void setResults(List<?> results) {
        this.results = results;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
