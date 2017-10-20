package com.dby.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dby.utils.DataSourceUtils;

public class UserDao {

	public int checkUsername(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select count(*) from user where username=?";
		Long isExist = (long) runner.query(sql,new ScalarHandler(), username);
		return isExist.intValue();
	}

}
