package com.admin.dao;

import java.util.List;
import java.util.Map;

import com.admin.dto.UserVo;

public interface UserDao {

	UserVo findUserInfo(String username);

	List<Map<String, Object>> loadPermission(String username);

}
