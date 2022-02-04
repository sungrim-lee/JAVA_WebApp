package com.coderby.hr.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List; 

import com.coderby.hr.model.AllianceVO;
import com.coderby.hr.model.MemberVO;
import com.coderby.hr.model.PointHistoryVO;

public class CjDAO implements ICjDAO {
   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
         System.out.println("드라이버클래스가 로드되었습니다.");
      } catch (ClassNotFoundException e) {
         System.out.println("클래스파일을 찾을 수 없습니다.");
      }
   }
   
   public static final String URL = "jdbc:oracle:thin:@192.168.2.8:1521/xe";
   public static final String ID = "hr";
   public static final String PW = "hr";

   public int insertMember(MemberVO member) {
	   Connection con = null;
	   try {
		   con = DriverManager.getConnection(URL, ID, PW);
		   String sql ="insert into members values (?,?,?,'basic',?)";
		   PreparedStatement stmt = con.prepareStatement(sql);
		   stmt.setString(1, member.getPhoneNumber());
		   stmt.setString(2, member.getAddress());
		   stmt.setString(3, member.getName());
		   stmt.setDate(4, member.getBirthDay());
		   return stmt.executeUpdate();
		   
	   } catch (SQLException e) {
		   throw new RuntimeException(e);
	   }finally {
		   if(con!=null) {
			   try {con.close();} catch (SQLException e) {}
		   }
	   }
   }
   @Override
   public double searchAccumulatePoint(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select sum(save_point) as sum_point from point_histories where phone_number=? ";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            return rs.getDouble("sum_point");
         }
         else {
            throw new RuntimeException("no row selected");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }
   
   public int updateGrade(String phoneNumber) {
      
      Connection con = null;
      try {
         ICjDAO dao = new CjDAO();
         
         con = DriverManager.getConnection(URL, ID, PW);
         String sql = "update members "
               + " set grade=? " +
               " where phone_number=? ";
         double accPoint = dao.searchAccumulatePoint(phoneNumber);
         PreparedStatement stmt = con.prepareStatement(sql);
         if(accPoint>=50000) {
            stmt.setString(1, "gold");
         }
         else if(accPoint>=30000) {
            stmt.setString(1, "silver");
         }
         else {
            stmt.setString(1, "basic");
         }
         stmt.setString(2, phoneNumber);
         
         return stmt.executeUpdate();
         
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }

   @Override
   public MemberVO searchGradePoint(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql = "select m.name as name ,p.phone_number,m.grade as grade ,p.total_point as total_point from "
               + "(select rank() over (order by use_date desc) as rank , "
               + "phone_number, alliance_id,amount,use_date,use_point,save_point,total_point "
               + "from point_histories where phone_number=? order by use_date desc) p "
               + "join members m on p.phone_number=m.phone_number where rank=1";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            MemberVO member = new MemberVO();
            member.setGrade(rs.getString("grade"));
            member.setPoint(rs.getDouble("total_point"));
            member.setName(rs.getString("name"));
            member.setPhoneNumber(phoneNumber);
            return member;
         }
         else {
            throw new RuntimeException("no row selected");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
      
   }

   @Override
   public double alertVanishPoint(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select sum(save_point) as point,last_day(sysdate) from point_histories "
               + "where use_date<add_months(last_day(sysdate),-12)+1 and phone_number=?";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            return rs.getDouble("point");
         }
         else {
            throw new RuntimeException("no row selected");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }   
   }
   public int countDeleteHistoryRow(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql="select count(*) as count from point_histories where phone_number=? and "
               + "use_date < add_months(last_day(sysdate),-13)+1";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            return rs.getInt("count");
         }
         else {
            throw new RuntimeException("no row selected");
         }
      }catch(SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con != null) {
            try {con.close();}catch(Exception e) {}
         }
      }
   }
   
   public int deleteHistory(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql="delete point_histories where phone_number=? and "
               + "use_date < add_months(last_day(sysdate),-13) + 1";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         int rowCount = stmt.executeUpdate();
         if(rowCount>0) {
            return rowCount;
         }else {
            throw new RuntimeException("no row selected");
         }
      }catch(SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con != null) {
            try {con.close();}catch(Exception e) {}
         }
      }
   }

   
   @Override
   public double expirePoint(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select sum(save_point) as vanish_point from point_histories where phone_number=? and "
               + "use_date < add_months(last_day(sysdate),-13) +1";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            return (double)rs.getDouble("vanish_point");
         }
         else {
            throw new RuntimeException("no row selected");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }

   @Override
   public MemberVO selectMember(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select * from members "
               + "where phone_number=?";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            MemberVO member = new MemberVO();
            member.setPhoneNumber(rs.getString("phone_number"));
            member.setAddress(rs.getString("address"));
            member.setName(rs.getString("name"));
            member.setGrade(rs.getString("grade"));
            member.setBirthDay(rs.getDate("birthday"));
            return member;
         }
         else {
            throw new RuntimeException("일치하는 정보가 없습니다.");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
//      return null;
   }

   @Override
   public List<PointHistoryVO> searchPointHistory(String phoneNumber) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select h.phone_number, h.alliance_id,a.alliance_name,h.amount,h.use_date,h.use_point,h.save_point,h.total_point " + 
               "from point_histories h " + 
               "join members m on h.phone_number = m.phone_number " + 
               "join alliances a on h.alliance_id=a.alliance_id where m.phone_number=?  "
               +" order by h.use_date desc";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         ResultSet rs = stmt.executeQuery();
         List<PointHistoryVO> pointHistoryList = new ArrayList<>();
         while(rs.next()) {
            PointHistoryVO pointHistory = new PointHistoryVO();
            pointHistory.setPhoneNumber(rs.getString("phone_number"));
            pointHistory.setAllianceId(rs.getInt("alliance_id"));
            pointHistory.setAllianceName(rs.getString("alliance_name"));
            pointHistory.setAmount(rs.getDouble("amount"));
            pointHistory.setUseDate(rs.getDate("use_date"));
            pointHistory.setUsePoint(rs.getDouble("use_point"));
            pointHistory.setSavePoint(rs.getDouble("save_point"));
            pointHistory.setTotalPoint(rs.getDouble("total_point"));
            pointHistoryList.add(pointHistory);
         }
         return pointHistoryList;
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
      
   }

   public List<MemberVO> selectAllMember(){
	   Connection con = null;
	      try {
	         con = DriverManager.getConnection(URL, ID, PW);
	         String sql ="select phone_number,name from members";
	         PreparedStatement stmt = con.prepareStatement(sql);
	         ResultSet rs = stmt.executeQuery();
	         List<MemberVO> MemberList = new ArrayList<>();
	         while(rs.next()) {
	        	 MemberVO member = new MemberVO();
	        	 member.setPhoneNumber(rs.getString("phone_number"));
	        	 member.setName(rs.getString("name"));
	        	 MemberList.add(member);
	         }
	         return MemberList;
	      } catch (SQLException e) {
	         throw new RuntimeException(e);
	      }finally {
	         if(con!=null) {
	            try {con.close();} catch (SQLException e) {}
	         }
	      }
   }
   
   @Override
   public List<AllianceVO> selectAllAlliance() {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql ="select alliance_id,alliance_name,basic,silver,gold from alliances";
         PreparedStatement stmt = con.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery();
         List<AllianceVO> allianceList = new ArrayList<>();
         while(rs.next()) {
            AllianceVO alliance = new AllianceVO();
            alliance.setAllianceId(rs.getInt("alliance_id"));
            alliance.setAllianceName(rs.getString("alliance_name"));
            alliance.setBasic(rs.getDouble("basic"));
            alliance.setSilver(rs.getDouble("silver"));
            alliance.setGold(rs.getDouble("gold"));
            allianceList.add(alliance);
         }
         return allianceList;
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }

   @Override
   public int insertPointHistory(PointHistoryVO pointhistory) {
      Connection con = null;
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql = "insert into point_histories values(?,?,?,SYSDATE,?,?,?,?)";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, pointhistory.getPhoneNumber());
         stmt.setInt(2, pointhistory.getAllianceId());
         stmt.setDouble(3, pointhistory.getAmount());
//         SYSDATE
         stmt.setDouble(4, pointhistory.getUsePoint());
         stmt.setDouble(5, pointhistory.getSavePoint());
         stmt.setDouble(6, pointhistory.getTotalPoint());
         if(pointhistory.getSubstractPoint()<0) {
        	 stmt.setString(7, null);
         }
         else {
        	 stmt.setDouble(7, pointhistory.getSubstractPoint());
         }
         return stmt.executeUpdate();
         
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }

   @Override
   public List<AllianceVO> searchPointPct(String phoneNumber) {
      Connection con = null;
      CjDAO dao = new CjDAO();
      String grade = dao.searchGradePoint(phoneNumber).getGrade();
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql = "select alliance_id,alliance_name," + grade + " as point_pct from alliances";
         PreparedStatement stmt = con.prepareStatement(sql);
         List<AllianceVO> allianceList = new ArrayList<>();
         ResultSet rs = stmt.executeQuery();
         while(rs.next()) {
            AllianceVO alliance = new AllianceVO();
            alliance.setAllianceId(rs.getInt("alliance_id"));
            alliance.setAllianceName(rs.getString("alliance_name"));
            alliance.setPointPct(rs.getDouble("point_pct"));
            allianceList.add(alliance);
         }
         return allianceList;
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }

   }
   
   public double searchDetailPointPct(String phoneNumber, int allianceId) {
      Connection con = null;
      CjDAO dao = new CjDAO();
      try {
         con = DriverManager.getConnection(URL, ID, PW);
         String sql = "select alliance_id,alliance_name,grade,pct from "
               + "(select * from "
               + "(select alliance_id,alliance_name,basic,silver,gold from alliances) unpivot "
               + "(pct for grade in(basic,silver,gold))) where lower(grade)="
               + "(select grade from members where phone_number=? ) and alliance_id=?";
         PreparedStatement stmt = con.prepareStatement(sql);
         stmt.setString(1, phoneNumber);
         stmt.setInt(2, allianceId);
         ResultSet rs = stmt.executeQuery();
         if(rs.next()) {
            return rs.getDouble("pct");
         }
         else {
            throw new RuntimeException("no data selected");
         }
      } catch (SQLException e) {
         throw new RuntimeException(e);
      }finally {
         if(con!=null) {
            try {con.close();} catch (SQLException e) {}
         }
      }
   }
 //옛날 포인트부터 차감
 	public double sumPreviousMonthUsePoint(String phoneNumber) {
 		Connection con = null;
 		try {
 			con = DriverManager.getConnection(URL, ID, PW);
 			String sql = " select sum(use_point) as previous_point from point_histories "
 					+ " where use_date > (select use_date from "
 					+ " (select use_date,rank() over(order by use_date desc) as ranking from point_histories where phone_number=? "
 					+ " and alliance_id=0 and save_point=0 order by use_date desc) where ranking=1)-1 "
 					+ " and phone_number=? ";
 			PreparedStatement stmt = con.prepareStatement(sql);
 			stmt.setString(1, phoneNumber);
 			stmt.setString(2, phoneNumber);
 			ResultSet rs = stmt.executeQuery();
 			if(rs.next()) {
 				return rs.getDouble("previous_point");
 			}
 			else {
 				throw new RuntimeException("no row selected");
 			}
 			
 		} catch (SQLException e) {
 			throw new RuntimeException(e);
 		}finally {
 			if(con!=null) {
 				try {con.close();} catch (SQLException e) {}
 			}
 		}
 	}
 	
 	public double searchOneSubstractPoint(String phoneNumber) {
        Connection con = null;
        try {
           con = DriverManager.getConnection(URL, ID, PW);
           String sql = "select substract_point from "
                 + " (select substract_point,rank() over(order by use_date desc) as ranking from point_histories where phone_number=? "
                 + " and alliance_id=0 and save_point=0 order by use_date desc) where ranking=1";
           PreparedStatement stmt = con.prepareStatement(sql);
           stmt.setString(1, phoneNumber);
           ResultSet rs = stmt.executeQuery();
           if(rs.next()) {
              return rs.getDouble("substract_point");
           }
           else {
              throw new RuntimeException("no row selected");
           }
           
        } catch (SQLException e) {
           throw new RuntimeException(e);
        }finally {
           if(con!=null) {
              try {con.close();} catch (SQLException e) {}
           }
        }
     }
 	
 	
}