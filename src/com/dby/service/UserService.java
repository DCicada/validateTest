package com.dby.service;

import java.sql.SQLException;

import com.dby.dao.UserDao;

public class UserService {

	public boolean checkUsername(String username) throws SQLException {
		UserDao dao = new UserDao();
		int isExist = dao.checkUsername(username);
		return isExist>0?true:false;
	}

}
