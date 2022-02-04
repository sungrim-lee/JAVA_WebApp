package com.coderby.hr.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.coderby.hr.dao.CjDAO;
import com.coderby.hr.dao.ICjDAO;
import com.coderby.hr.model.AllianceVO;
import com.coderby.hr.model.MemberVO;
import com.coderby.hr.model.PointHistoryVO;

/**
 * Servlet implementation class PointServlet
 */
@WebServlet("/hr/Point.do")
public class PointServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	ICjDAO dao = new CjDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		
		String url = "/";
		
		if("main".equals(cmd)) {
			url = "/hr/main.jsp";
		}
		else if("manager".equals(cmd)) {
			url = "/hr/manager.jsp";
			List<MemberVO> memberList = new ArrayList<>();
			memberList = dao.selectAllMember();
			request.setAttribute("memberList", memberList);
		}
//		0324수정중
		else if("join".equals(cmd)) {
			url = "/hr/join.jsp";
			
		}
//		0324수정중
		else if("info".equals(cmd)) {
			url = "/hr/info.jsp";
			String phoneNumber = request.getParameter("phoneNumber");
			MemberVO gradePoint = dao.searchGradePoint(phoneNumber);
			double totalPoint = gradePoint.getPoint();
			//         dao.deletePoint(phoneNumber);
			double vanishPoint = dao.alertVanishPoint(phoneNumber);
			//         포인트 만료
			double expirePoint=0;
			if(totalPoint<vanishPoint) {
				vanishPoint=totalPoint;
			}
			if(dao.countDeleteHistoryRow(phoneNumber)>0) {
				
				expirePoint = dao.expirePoint(phoneNumber);
				dao.deleteHistory(phoneNumber);
				
				double substractPoint = dao.sumPreviousMonthUsePoint(phoneNumber);
				//추가73라인
	            substractPoint=substractPoint + dao.searchOneSubstractPoint(phoneNumber);
	            //
				if(expirePoint>substractPoint) {
					expirePoint=expirePoint-substractPoint;
					substractPoint=0;
				}
				else if(expirePoint==substractPoint) {
					expirePoint=0;
					substractPoint=0;
				}
				else {
					expirePoint=0;
					substractPoint=substractPoint-expirePoint;
				}
				
				int allianceId=0;
				double amount=0;
				double usePoint=expirePoint;
				double savePoint=0;
				totalPoint = totalPoint-expirePoint;
				if(totalPoint<0) {
					totalPoint=0;
				}
				
				PointHistoryVO pointHistory = new PointHistoryVO();
				pointHistory.setPhoneNumber(phoneNumber);
				pointHistory.setAllianceId(allianceId);
				pointHistory.setAmount(amount);
				pointHistory.setUsePoint(usePoint);
				pointHistory.setSavePoint(savePoint);
				pointHistory.setTotalPoint(totalPoint);
				pointHistory.setSubstractPoint(substractPoint);
				dao.insertPointHistory(pointHistory);
				//            phoneNumber,allianceId,amount,useDate,usePoint,savePoint,totalPoint
			}
			dao.updateGrade(phoneNumber);
			request.setAttribute("gradePoint", gradePoint);
			request.setAttribute("vanishPoint", vanishPoint);
			//         소멸된 포인트
			request.setAttribute("expirePoint", expirePoint);

		}

		else if("pointdetails".equals(cmd)) {
			url = "/hr/PointDetails.jsp";
			String phoneNumber = request.getParameter("phoneNumber");
			List<PointHistoryVO> pointHistoryList = dao.searchPointHistory(phoneNumber);
			request.setAttribute("pointHistoryList", pointHistoryList);
		}

		else if("buy".equals(cmd)) {
			url = "/hr/buy.jsp";
			String phoneNumber = request.getParameter("phoneNumber");
			MemberVO member = dao.searchGradePoint(phoneNumber);
			List<AllianceVO> allianceList = dao.searchPointPct(phoneNumber);
			request.setAttribute("allianceList", allianceList);
			request.setAttribute("phoneNumber", phoneNumber);
			request.setAttribute("member", member);
		}

		else {
			request.setAttribute("message", "요청한 명령이 없습니다");
			url = "/hr/error.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(url);
			disp.forward(request, response);
			return;
		}
		RequestDispatcher disp = request.getRequestDispatcher(url);
		disp.forward(request, response);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String cmd = request.getParameter("cmd");
		String url = "/";
		
		if("main".equals(cmd)) {
			MemberVO member = new MemberVO();
			String phoneNumber1 = request.getParameter("hp_no1");
			String phoneNumber2 = request.getParameter("hp_no2");
			String phoneNumber3 = request.getParameter("hp_no3");
			String phoneNumber = phoneNumber1+"-"+phoneNumber2+"-"+phoneNumber3;
			try {
				member = dao.selectMember(phoneNumber);
			}
			catch(RuntimeException e) {
				request.setAttribute("message", "잘못된 형식을 입력하셨습니다.");
				url = "/hr/error.jsp";
				RequestDispatcher disp = request.getRequestDispatcher(url);
				disp.forward(request, response);
			}
			url = "/hr/success.jsp";
			request.setAttribute("member", member);
			RequestDispatcher disp = request.getRequestDispatcher(url);
			disp.forward(request, response);
			return;
		}
		
		else if("join".equals(cmd)) {
			MemberVO member = new MemberVO();
			PointHistoryVO pointhistory = new PointHistoryVO();
			try {
				String phoneNumber1 = request.getParameter("phoneNumber1");
				String phoneNumber2 = request.getParameter("phoneNumber2");
				String phoneNumber3 = request.getParameter("phoneNumber3");
				String phoneNumber = phoneNumber1+"-"+phoneNumber2+"-"+phoneNumber3;
				String address = request.getParameter("address");
				String name = request.getParameter("name");
				SimpleDateFormat transformat = new SimpleDateFormat("yyyy-MM-dd");
				String birthdayStr = request.getParameter("birthday");
				java.sql.Date birthday = null;
				birthday = new java.sql.Date(transformat.parse(birthdayStr).getTime());
				member.setPhoneNumber(phoneNumber);
				member.setAddress(address);
				member.setName(name);
				member.setBirthDay(birthday);
				dao.insertMember(member);
				pointhistory.setPhoneNumber(phoneNumber);
				pointhistory.setAllianceId(0);
				pointhistory.setAmount(0);
				pointhistory.setUsePoint(0);
				pointhistory.setSavePoint(2000);
				pointhistory.setTotalPoint(2000);
				pointhistory.setSubstractPoint(0);
				dao.insertPointHistory(pointhistory);
				url = "/hr/Point.do?cmd=info&phoneNumber="+phoneNumber ;
			} 
			catch (ParseException | RuntimeException e) {
				request.setAttribute("message", e.getMessage());
				url = "/hr/error.jsp";
				RequestDispatcher disp = request.getRequestDispatcher(url);
				disp.forward(request, response);
				return;
			}
			
			
		}

		else if("buy".equals(cmd)) {
			try {
				int allianceId = Integer.parseInt(request.getParameter("allianceId"));
				String phoneNumber = request.getParameter("phoneNumber");

				double amount = Double.parseDouble(request.getParameter("amount"));
				double usePoint = Double.parseDouble(request.getParameter("usePoint"));

				String grade = dao.searchGradePoint(phoneNumber).getGrade();

				double totalPoint = dao.searchGradePoint(phoneNumber).getPoint();
				double pointPct = dao.searchDetailPointPct(phoneNumber, allianceId);
				//phoneNumber,allianceId,amount,useDate,usePoint,savePoint,totalPoint   
				Double savePoint = (amount-usePoint) * pointPct;

				if((totalPoint-usePoint)>=0) {
					totalPoint = totalPoint-usePoint+savePoint; 
				}
				else {
					request.setAttribute("phoneNumber", phoneNumber);
					request.setAttribute("message", "가용 포인트 초과!");
					url = "/hr/error.jsp";
					RequestDispatcher disp = request.getRequestDispatcher(url);
					disp.forward(request, response);
					return;
				}
				if(amount<usePoint) {
					request.setAttribute("phoneNumber", phoneNumber);
					request.setAttribute("message", "사용하실 포인트가 금액보다 많습니다!");
					url = "/hr/error.jsp";
					RequestDispatcher disp = request.getRequestDispatcher(url);
					disp.forward(request, response);
					return;
				}
				else if(amount<=0 || usePoint<0) {
					request.setAttribute("message", "마이너스 값을 입력하거나 금액을 사용하시지 않으셨습니다.");
					url = "/hr/error.jsp";
					RequestDispatcher disp = request.getRequestDispatcher(url);
					disp.forward(request, response);
					return;
				}


				PointHistoryVO pointhistory = new PointHistoryVO();
				pointhistory.setPhoneNumber(phoneNumber);
				pointhistory.setAllianceId(allianceId);
				pointhistory.setAmount(amount);
				pointhistory.setUsePoint(usePoint);
				pointhistory.setSavePoint(savePoint);
				pointhistory.setTotalPoint(totalPoint);
				dao.insertPointHistory(pointhistory);
				url="/hr/Point.do?cmd=pointdetails&phoneNumber="+phoneNumber ;
			}
			catch(NumberFormatException e) {
				String phoneNumber = request.getParameter("phoneNumber");
				request.setAttribute("phoneNumber", phoneNumber);
				request.setAttribute("message", "잘못된 형식을 입력하셨습니다");
				url = "/hr/error.jsp";
				RequestDispatcher disp = request.getRequestDispatcher(url);
				disp.forward(request, response);
				return;
			}
		}
		else {
			request.setAttribute("message", "요청한 명령이 없습니다");
			url = "/hr/error.jsp";
			RequestDispatcher disp = request.getRequestDispatcher(url);
			disp.forward(request, response);
			return;
		}
		response.sendRedirect(url);
	}

}