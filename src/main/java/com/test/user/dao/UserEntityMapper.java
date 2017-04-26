package com.test.user.dao;

import com.test.user.dto.UserQueryDto;
import com.test.user.entity.UserEntity;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Set;

@Repository
public interface UserEntityMapper {

    List<UserEntity> selectAll();

    UserEntity selectByAccount(String account);

    Set<String> selectRolesName(String account);

    Set<String> selectPermissionName(@Param("set") Set<String> roleNames);

    List<UserEntity> selectUserList(UserQueryDto userDto);

    Integer selectRecordCount(UserQueryDto userDto);
}