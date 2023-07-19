package com.kosa.hrsystem.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kosa.hrsystem.action.ActionForward;
import com.kosa.hrsystem.dao.RequestHistoryDAO;
import com.kosa.hrsystem.dto.RequestHistoryDTO;
import com.kosa.hrsystem.vo.RequestHistoryVO;

public class RequestHistoryServiceImp implements RequestHistoryService {

    @Override
    public ActionForward selectAllRequest(HttpServletRequest request, HttpServletResponse response) {
        RequestHistoryDAO dao = new RequestHistoryDAO();
        try {
            List<RequestHistoryVO> list = dao.selectAllRequest();

            request.setAttribute("list", list);
            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setPath("/views/admin/requestHistory/requestHistoryView.jsp");
            return forward;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public ActionForward update(HttpServletRequest request, HttpServletResponse response) {

        String historyStatus = request.getParameter("historyStatus");
        String historyNum = request.getParameter("historyNum");
        String historyRequest = request.getParameter("code");
        String historyType = request.getParameter("historyType");
        RequestHistoryDAO dao = new RequestHistoryDAO();

        // 요청번호  요청타입 요청사항
        HashMap<String, Object> map = new HashMap<>();
        map.put("historyType", historyType); // 근무, 휴가, 근태
        map.put("historyRequest", historyRequest); // 해당 내역의 번호( 근무번호, 휴가번호, 근태번호)
        map.put("historyNum", historyNum); // 요청번호
        map.put("historyStatus", historyStatus); // 요청 상태 승인인지 거절인지

        // 상태 승인 취소
        dao.update(map);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setPath("/requesthistory.do");
        return forward;
    }

    @Override
    public void approval(HttpServletRequest request, HttpServletResponse response) {
        // 승인
        boolean flag = Boolean.parseBoolean(request.getParameter("approval"));
        String rqstNum = request.getParameter("rqstNum");
        String remarks = request.getParameter("remarks");

        RequestHistoryDAO requestHistoryDAO = new RequestHistoryDAO();
        HashMap<String,Object> map = new HashMap<>();
        if (flag) {
            map.put("rqstNum",rqstNum);
            map.put("remarks",remarks);
            map.put("state",1);
            requestHistoryDAO.update(map);
        } else {
            map.put("rqstNum",rqstNum);
            map.put("remarks",remarks);
            map.put("state",2);
            requestHistoryDAO.update(map);
        }

    }


}
