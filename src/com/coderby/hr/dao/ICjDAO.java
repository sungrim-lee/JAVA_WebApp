package com.coderby.hr.dao;

import java.util.List;

import com.coderby.hr.model.AllianceVO;
import com.coderby.hr.model.MemberVO;
import com.coderby.hr.model.PointHistoryVO;

public interface ICjDAO {
	int insertMember(MemberVO member);
	public double searchAccumulatePoint(String phoneNumber);
	public int updateGrade(String phoneNumber);
    MemberVO searchGradePoint(String phoneNumber);
    double alertVanishPoint(String phoneNumber);
    int countDeleteHistoryRow(String phoneNumber);
    int deleteHistory(String phoneNumber);
    double expirePoint(String phoneNumber);
    MemberVO selectMember(String phoneNumber);
    List<PointHistoryVO> searchPointHistory(String phoneNumber);
    List<MemberVO> selectAllMember();
    List<AllianceVO> selectAllAlliance();
    int insertPointHistory(PointHistoryVO pointhistory);
    List<AllianceVO> searchPointPct(String phoneNumber);
    double searchDetailPointPct(String phoneNumber, int allianceId);
    //옛날포인트부터 차감 메서드
    double sumPreviousMonthUsePoint(String phoneNumber);
    double searchOneSubstractPoint(String phoneNumber);
}
