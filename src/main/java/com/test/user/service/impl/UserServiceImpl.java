package com.test.user.service.impl;

import com.test.user.dao.UserEntityMapper;
import com.test.user.dto.UserListDto;
import com.test.user.dto.UserQueryDto;
import com.test.user.entity.UserEntity;
import com.test.user.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * Created by zhph on 2016-12-19.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    UserEntityMapper entityMapper;

    public List<UserEntity> selectAll() {
        return entityMapper.selectAll();
    }

    public UserEntity findByName(String account) {
        return entityMapper.selectByAccount(account);
    }

    public Set<String> selectRolesName(String account) {
        return entityMapper.selectRolesName(account);
    }

    public Set<String> selectPermissionName(Set<String> roleNames) {
        return entityMapper.selectPermissionName(roleNames);
    }

    public UserListDto queryUserList(UserQueryDto userDto) {
        UserListDto listDto = new UserListDto();
        listDto.setRecordCount(entityMapper.selectRecordCount(userDto));
        listDto.setPageSize(userDto.getPageSize());
        listDto.setCurPage(userDto.getCurPage());
        listDto.setResults(entityMapper.selectUserList(userDto));
        return  listDto;
    }
}
