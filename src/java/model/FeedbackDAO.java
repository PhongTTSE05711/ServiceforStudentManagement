/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Feedback;
import com.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FeedbackDAO {

    public List<Feedback> selectAllReport() throws Exception {
        Connection conn = new DBContext().getConnection();
        String query = "select * from Feedback";
        PreparedStatement ps = conn.prepareStatement(query);
        List<Feedback> a = new ArrayList<>();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            String receiverName = rs.getString("ReceiverName");
            String senderName = rs.getString("SenderName");
            String title = rs.getString("Title");
            String detail = rs.getString("Detail");
            Date date = rs.getDate("Date");
            String status = rs.getString("Status");
            a.add(new Feedback(receiverName,senderName, title, detail, date, status));
        }
        rs.close();
        conn.close();
        return a;
    }

    public void setReportStatus(int rid, String status) throws Exception {
        String query = "update Feedback set Status=? where ReportID=?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, status);
        ps.setInt(2, rid);
        ps.executeUpdate();
        conn.close();
    }

    public void insertFeedback(Feedback a) throws Exception {
        String query = "insert into Feedback values(?,?,?,?,?,?)";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(query);
        ps.setString(1, a.getReceiverName());
        ps.setString(2, a.getSenderName());
        ps.setString(3, a.getTitle());
        ps.setString(4, a.getDetail());
        ps.setDate(5, new java.sql.Date(a.getDate().getTime()));
        ps.setString(6, a.getStatus());
        ps.executeUpdate();
        conn.close();
    }
}
