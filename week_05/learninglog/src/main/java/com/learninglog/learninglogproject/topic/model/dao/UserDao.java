package com.learninglog.learninglogproject.topic.model.dao;

import com.learninglog.learninglogproject.topic.model.dao.UserDao;
import com.learninglog.learninglogproject.topic.model.User;
import com.learninglog.learninglogproject.utils.DbConnection;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.*;

public class UserDao {
    public boolean insertUser(User user) throws SQLException {
        String query = "INSERT INTO user(name,email,password)" + "VALUES(?,?,?)";
        try (Connection conn = DbConnection.getConnection(); PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());

            int insertedRows = st.executeUpdate();
            return insertedRows > 0;
        }
    }

    public User LoginUser(String email, String password) throws SQLException {
        String query = "SELECT * FROM user WHERE email=?";
        try (Connection conn = DbConnection.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String hashedPwDb = rs.getString("password");
                boolean isValidPw = BCrypt.checkpw(password, hashedPwDb);
                if (isValidPw) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    User obj = new User(id,name,email,hashedPwDb);
                    return obj;
                }
                else{
                    return null;
                }
            }
        }
        return null;
    }
}
