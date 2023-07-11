package com.kosa.hrsystem.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.Action;
import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.DeptDAO;
import com.kosa.hrsystem.dao.RankDAO;
import com.kosa.hrsystem.dao.WorkScheduleDAO;
import com.kosa.hrsystem.dto.CodeTableDTO;
import com.kosa.hrsystem.vo.WorkScheduleTypeVO;

public class WorkScheduleTypeService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		WorkScheduleDAO dao = new WorkScheduleDAO();

		try {
			List<WorkScheduleTypeVO> list = dao.selectAllWorkType();
			List<CodeTableDTO> optDept= new DeptDAO().selectAllDept();
			List<CodeTableDTO> optRank= new RankDAO().selectAllRank();
			
			request.setAttribute("list", list);
			request.setAttribute("optDept",optDept);
			request.setAttribute("optRank",optRank);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/views/admin/manage/workScheduleView.jsp");
			return forward;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
