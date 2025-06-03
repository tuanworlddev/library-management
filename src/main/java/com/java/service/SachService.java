package com.java.service;

import com.java.entity.Sach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.java.dao.SachDAO;

import java.util.List;

@Service
public class SachService {
	  @Autowired
	    private SachDAO sachDAO;

	    @Transactional
	    public void themSach(Sach sach) {
	        sachDAO.saveSach(sach);
	    }

	    @Transactional(readOnly = true)
	    public List<Sach> layTatCaSach() {
	        return sachDAO.getAllSach();
	    }

	    @Transactional(readOnly = true)
	    public Sach timSachTheoMa(String maSach) {
	        return sachDAO.findSachById(maSach);
	    }

	    @Transactional
	    public void xoaSach(String maSach) {
	        sachDAO.deleteSach(maSach);
	    }

	    @Transactional(readOnly = true)
	    public boolean kiemTraTonTai(String maSach) {
	        return sachDAO.existsById(maSach);
	    }
}
