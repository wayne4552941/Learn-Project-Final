package fourth.service;

import java.awt.image.RescaleOp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fourth.bean.ExamEduBean;
import fourth.bean.ExamQuesBean;
import fourth.bean.ExamBean;
import fourth.bean.ExamSubBean;
import fourth.dao.ExamDao;
import fourth.dao.ExamDaoInterface;
import fourth.dao.ExamRepository;
import fourth.util.ExamUtil;

@Service
@Transactional
public class ExamService  {
	
	@Autowired
	private ExamDao examDao;
	
	@Autowired
	private ExamRepository examRes;
	
	//增加
	public ExamBean insert(String subString,String eduString,String examName,String examDate){
		
		
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		ExamBean insBean = new ExamBean();
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
			insBean = new ExamBean(subBean, eduBean, examName, tDate); 
//			insBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		
//		insBean.setSubject(subBean);
//		insBean.setEducation(eduBean);
//		insBean.setExamName(examName);
		System.err.println("get什麼小");
		System.err.println(insBean);
		
		return examRes.save(insBean);
		
	}
	
	//修改
	public ExamBean update(String updateId, String subString,String eduString,String examName,String examDate){
		
		
		Integer upId = Integer.valueOf(updateId);
		ExamSubBean subBean = new ExamSubBean(ExamUtil.getSubIdx(subString), subString);
		ExamEduBean eduBean = new ExamEduBean(ExamUtil.getEduIdx(eduString), eduString);
		
//		System.out.println(ExamUtil.getSubIdx(subString)+subString);
//		System.out.println(ExamUtil.getEduIdx(eduString)+eduString);
		
		ExamBean upBean = new ExamBean();
		
		try {
			
			Date tDate = new SimpleDateFormat("yyyy-MM-dd").parse(examDate);
//			upBean = new ExamBean(subBean, eduBean, examName, tDate); 
			upBean = new ExamBean(upId,subBean,eduBean,examName,tDate);
			upBean.setExamdate(tDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
//		upBean.setExamID(upId);
//		upBean.setSubject(subBean);
//		upBean.setEducation(eduBean);
//		upBean.setExamName(examName);
//		System.err.println("service內");
//		System.err.println(upBean);
		return examRes.save(upBean);
		
	}
	
	//查詢考卷
	public List<ExamBean> select(String subString,String eduString){
		
//		Integer subIdx = ExamUtil.getSubIdx(subString);
//		Integer eduIdx = ExamUtil.getEduIdx(eduString);
		return examRes.findBySubject_subjectNameAndEducation_educationName(subString, eduString);
	}
	
	//查詢全部
	public List<ExamBean> selectAll(){
		return examRes.findAll();
	}
	
	//刪除
	public void delete(String id){
		Integer examID = Integer.valueOf(id);
		examRes.deleteById(examID);
	}
	
	////////////////////考卷////////////////////考卷////////////////////考卷////////////////////考卷
	//查詢考試題目
	public List<ExamQuesBean> selectQu(String subString,String eduString){
		
		
		Integer subIdx = ExamUtil.getSubIdx(subString);
		Integer eduIdx = ExamUtil.getEduIdx(eduString);
		return examDao.selectQu(subIdx,eduIdx);
		
	}
	
	
	////////////////////考卷////////////////////考卷////////////////////考卷
	
}
