package com.trainee.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.apache.log4j.Logger;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.trainee.bean.DailyWorkBean;
import com.trainee.bean.EvaluationCsBean;
import com.trainee.entity.DailyWork;
import com.trainee.entity.ProgressWork;
import com.trainee.entity.Suggestion;
import com.trainee.entity.TraineeStudentCompany;
import com.trainee.main.MainMethod;
import com.trainee.service.MainService;
import com.trainee.service.SuggestionService;

@Controller
@RequestMapping("/report")
public class ReportController {
	
	private static final Logger logger = Logger.getLogger(ReportController.class);
   	
	@Autowired
	MainService mainService;
	
	@Autowired
	SuggestionService suggestionService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(
	            dateFormat, false));
	}
	
	@RequestMapping(value = "/dailyWork.htm",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody void reportDailyWork(
			HttpServletRequest request, HttpServletResponse response
			,@RequestParam("id")Integer idStdComp
			,@RequestParam("startOfWeek")Date startOfWeek
			,@RequestParam("endOfWeek")Date endOfWeek) {
		try {
			logger.info("report dailyWork");
			//=======================================================get TcStdComp and DailyWork

			TraineeStudentCompany traineeStudentCompany = mainService.get(TraineeStudentCompany.class, idStdComp);
			DetachedCriteria criteria = DetachedCriteria.forClass(DailyWork.class)
					.createAlias("trainee_student_company", "traineeStudentCompany")
					.add(Restrictions.eq("traineeStudentCompany.tcStucompID", idStdComp))
					.add(Restrictions.between("dateDaily", startOfWeek, endOfWeek));
			List<DailyWork> dailyWorks = mainService.findByCriteria(criteria);
			
			String name = traineeStudentCompany.getStudent().getNameStu()+"  "
					+ traineeStudentCompany.getStudent().getLastnameStu();
			String code = traineeStudentCompany.getStudent().getIdStudent();

			List<DailyWorkBean> dailyWorkBeans = new ArrayList<>();
			for(DailyWork dailyWork : dailyWorks){
				dailyWorkBeans.add(new DailyWorkBean(MainMethod.FormatDateTH(dailyWork.getDateDaily())
						,dailyWork.getDetailDaily()));
			}
			//=========================================get Suggestion Teacher and Supervisor
			DetachedCriteria criteria2 = DetachedCriteria.forClass(Suggestion.class)
					.createAlias("trainee_student_company", "traineeStdComp")
					.add(Restrictions.eq("traineeStdComp.tcStucompID", idStdComp))
					.add(Restrictions.eq("firstDateOfWeak",startOfWeek))
					.add(Restrictions.eq("lastDateOfWeak",endOfWeek));
			List<Suggestion> suggestions = mainService.findByCriteria(criteria2);
			String SuggestionTeach = "-";
			String SuggestionSuper = "-";
			for(Suggestion suggestion : suggestions){
				if(suggestion.getTypeUSer().equals("Teacher")){
					SuggestionTeach = suggestion.getDetailSug();
				}else if(suggestion.getTypeUSer().equals("Supervisor")){
					SuggestionSuper = suggestion.getDetailSug();
				}
			}
			
			String jrxmlFile = "D:/clinic_web/report/daily_work.jrxml";
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=\"report_daily_work.pdf\"");
			InputStream input  = new FileInputStream(new File(jrxmlFile));

			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("studentName", name);
			parameters.put("studentCode", code);
			parameters.put("SuggestionTeach", SuggestionTeach);
			parameters.put("SuggestionSuper", SuggestionSuper);
			
			JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(dailyWorkBeans);

			JasperReport jasperReport = JasperCompileManager.compileReport(input);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);
			
			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	
	@RequestMapping(value = "/reportEvaluation.htm",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody void reportEvaluation(
			HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("reportEvaluation");
			EvaluationCsBean evaluationBean = (EvaluationCsBean) request.getSession().getAttribute("evaluationbeanSS");
			List<Map<String,String>> listMap = evaluationBean.getListMap();
			Double sumAllX = 0.0;
			Double count = 0.0;
			for(Map<String,String> map : listMap){
				count = count+1;
				sumAllX = sumAllX + Double.parseDouble(map.get("sumX"));
			}
			DecimalFormat df2 = new DecimalFormat(".##");
			Double mean = sumAllX/count;
			df2.format(mean);
			
			String jrxmlFile = "D:/clinic_web/report/evaluation_cs.jrxml";
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=\"report_evaluation_cs.pdf\"");
			InputStream input  = new FileInputStream(new File(jrxmlFile));

			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("meanSum", mean.toString());
			
			JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(listMap);

			JasperReport jasperReport = JasperCompileManager.compileReport(input);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, beanColDataSource);
			
			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/reportProgress.htm",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody void reportProgress(HttpServletRequest request, HttpServletResponse response) {
		try {
			logger.info("report Progresswork");
			List<ProgressWork> progressWorks = (List<ProgressWork>) request.getSession().getAttribute("progressWorkSS");

			String name = progressWorks.get(0).getTrainee_student_company().getStudent().getNameStu();
			String lastName = progressWorks.get(0).getTrainee_student_company().getStudent().getLastnameStu();
			List<Map<String, String>> listmap = new ArrayList<Map<String,String>>();
			for(ProgressWork pw : progressWorks){
				Map<String,String> map = new HashMap<String, String>();
				DetachedCriteria criteria = DetachedCriteria.forClass(Suggestion.class)
						.add(Restrictions.eq("typeWorkId", pw.getIdProgress().toString()));
				List<Suggestion> suggestions = mainService.findByCriteria(criteria);
				if(suggestions.size() < 1){
					map.put("sugTeach", "-");
					map.put("sugComp", "-");
				}else if(suggestions.size() == 1){
					for(Suggestion s:suggestions){
						if(s.getTypeUSer().equals("Teacher")){
							map.put("sugTeach", s.getDetailSug());
							map.put("sugComp", "-");
						}else if(s.getTypeUSer().equals("Supervisor")){
							map.put("sugComp", s.getDetailSug());
							map.put("sugTeach", "-");
						}
					}
				}else{
					for(Suggestion s:suggestions){
						if(s.getTypeUSer().equals("Teacher")){
							map.put("sugTeach", s.getDetailSug());
						}else if(s.getTypeUSer().equals("Supervisor")){
							map.put("sugComp", s.getDetailSug());
						}
					}
				}
				
				map.put("noProgress", pw.getProgressDate().getNoProgress());
				map.put("dateStart", MainMethod.FormatDateTH(pw.getProgressDate().getDateStart()));
				map.put("dateEnd", MainMethod.FormatDateTH(pw.getProgressDate().getDateEnd()));
				map.put("detailProgress", pw.getDetailProgress());
				
				listmap.add(map);
			}
			String jrxmlFile = "D:/clinic_web/report/progress_work.jrxml";
			response.setContentType("application/pdf");
			response.setHeader("Content-Disposition", "attachment; filename=\"report_progress_work.pdf\"");
			InputStream input  = new FileInputStream(new File(jrxmlFile));

			Map<String, Object> parameters = new HashMap<String, Object>();
			parameters.put("name",name );
			parameters.put("lastName",lastName );

			JRBeanCollectionDataSource beanColDataSource = new JRBeanCollectionDataSource(listmap);
			
			JasperReport jasperReport = JasperCompileManager.compileReport(input);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,beanColDataSource);
			
			JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
			
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	
}
