package com.test.user.service;

import com.test.user.dto.UserListDto;
import com.test.user.dto.UserQueryDto;
import com.test.user.entity.UserEntity;

import java.util.List;
import java.util.Set;

/**
 * Created by zhph on 2016-12-19.
 */
public interface UserService {

    List<UserEntity> selectAll();

    UserEntity findByName(String account);

    Set<String> selectRolesName(String account);

    Set<String> selectPermissionName(Set<String> roleNames);

    UserListDto queryUserList(UserQueryDto userDto);
}
