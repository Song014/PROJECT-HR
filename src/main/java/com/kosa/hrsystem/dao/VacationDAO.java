package com.kosa.hrsystem.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kosa.hrsystem.dto.VacationDTO;
import com.kosa.hrsystem.dto.VacationTypeDTO;
import com.kosa.hrsystem.utils.SqlMapConfig;
import com.kosa.hrsystem.vo.VacationVO;

public class VacationDAO {
    private SqlSessionFactory factory = SqlMapConfig.getSqlSession();
    // 휴가 관리자 조회
    public List<VacationVO> selectAllVacation(){
        SqlSession session = factory.openSession(true);
        List<VacationVO> list= session.selectList("selectAllVacation");
        
        session.close();
        return list;
    }
    //휴가 관리자 삽입
    public int insertVacation(VacationDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.insert("insertVacation",dto);
        System.out.println(result);
        
        session.close();
        return result;
    }
    
    //휴가 관리자 수정
    public int updateVacation(VacationDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateVacation",dto);

        session.close();
        return result;
    }
    
    // 휴가 관리자 삭제
    public int deleteVacation(int num) throws Exception {
    	SqlSession session = factory.openSession(true);
        int result = session.delete("deleteVacation",num);

        session.close();
        return result;
    }
    
    //휴가 일정 유형 전체 조회
    public List<VacationTypeDTO> selectAll(){
        SqlSession session = factory.openSession(true);
        List<VacationTypeDTO> list= session.selectList("selectAll");

        session.close();
        return list;
    }
    //휴가 일정 유형 삽입
    public int insertVctnType(VacationTypeDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.insert("insertVctnType",dto);
        System.out.println(result);
        
        session.close();
        return result;
    }
    //휴가 일정 유형 수정
    public int updateVctnType(VacationTypeDTO dto) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.update("updateVctnType",dto);

        session.close();
        return result;
    }
    //휴가 일정 유형 삭제
    public int deleteVctnType(int num) throws Exception {
        SqlSession session = factory.openSession(true);
        int result = session.delete("deleteVctnType",num);

        session.close();
        return result;
    }
}
