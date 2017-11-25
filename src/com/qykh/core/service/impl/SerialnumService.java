package com.qykh.core.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.qykh.core.dao.ISerialnumDao;
import com.qykh.core.domain.TSerialnum;
import com.qykh.core.service.ISerialnumService;
import com.qykh.frame.page.PageTion;
import com.qykh.frame.page.Paramter;
import com.qykh.frame.util.DateUtil;
import com.qykh.frame.util.NumToString;
@Service
@Transactional
public class SerialnumService implements ISerialnumService{
	@Autowired
	private ISerialnumDao dao ;
	@Override
	public void delete(TSerialnum t) {
		dao.delete(t);
	}

	@Override
	public List<TSerialnum> list() {
		return null;
	}

	@Override
	public PageTion listByPage(int pageNo, int pageSize, Paramter par) {
		return dao.listByPage(pageNo, pageSize, par);
	}

	@Override
	public List<TSerialnum> queryByCondition(TSerialnum t) {
		return null;
	}

	@Override
	public TSerialnum queryById(Serializable id) {
		return dao.queryById(id);
	}

	@Override
	public void save(TSerialnum t) {
		dao.save(t);
	}

	@Override
	public void update(TSerialnum t) {
		dao.update(t);
	}

	@Override
	public String obtainNum(String flag) {
		String currentTime = DateUtil.sysDate();
		TSerialnum one = dao.queryOneByCondition("flag", flag);
		int num = 0;
		//时间版本中启用，非时间版本不启用，判断中加上条件one.getStime == currentTime
		if(one!=null){
			num = one.getNum();
		}else{
			one = new TSerialnum();
		}
		//补全5位作为编号
		String parseNumber5 = NumToString.parseNumber5(num);
		//加1储存
		one.setNum(++num);
		one.setFlag(flag);
		one.setStime(currentTime);
		//更新
		dao.saveOrUpdate(one);
		return parseNumber5;
	}

}
