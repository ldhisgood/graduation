package com.qykh.core.action;

import java.io.File;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qykh.core.domain.TKnowledge;
import com.qykh.core.service.IKnowledgeService;
import com.qykh.core.util.Constant;
import com.qykh.frame.page.PageTion;
  
 

@RequestMapping("/knowledge")
@Controller
public class KnowledgeAction {
	@Autowired
	private IKnowledgeService service;

	@RequestMapping("/list.do")
	@ResponseBody
	public Map<String, Object> List(int page, int rows) {
		PageTion data = service.listByPage(page, rows, null);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", data.getNum());
		map.put("rows", data.getList());
		return map;
	}
	
	@RequestMapping("/save.do")
	@ResponseBody
	public void save(TKnowledge bean) {
		service.save(bean);
	}
	@RequestMapping("/save1.do")
	@ResponseBody
	public String save1(TKnowledge bean) throws ParseException {
		TKnowledge bean1=service.save1(bean);
		return "knowledge/list";
	}
	@RequestMapping("/del.do")
	@ResponseBody
	public void delete(int id) {
		service.delete(service.queryById(id));
	}

	@RequestMapping("/update.do")
	@ResponseBody
	public void update(TKnowledge bean){
		TKnowledge temp = service.queryById(bean.getId());
		temp.setFilename(bean.getFilename());
		temp.setClassify(bean.getClassify());
		service.update(temp);
	}
	@RequestMapping("/GoEdit.do")
	public String edit(Model model,int id){
		TKnowledge temp = service.queryById(id);
		model.addAttribute("bean",temp);
		return "knowledge/edit";
	}
	
	@RequestMapping("/GoDetail.do")
	public String detail(Model model,int id){
		TKnowledge temp = service.queryById(id);
		model.addAttribute("bean",temp);
		return "knowledge/detail";
	}
	
	@RequestMapping("/GoSave.do")
	public String goSave(Model model){
		return "knowledge/save";
	}
	@RequestMapping("/Go.do")
	public String show(Model model){
		return "knowledge/list";
	}
	@RequestMapping("/GoSearch.do")
	@ResponseBody
	public List<TKnowledge> goSearch(Model model,String filename){
		List<TKnowledge> list = service.search(filename);
		//model.addAttribute("bean", list);
		return list;
	}
	/*@RequestMapping("/uploadPic.do")
	public void uploadPic(HttpServletRequest request, 
			@RequestParam("imagedefault[]") MultipartFile[] files,
			PrintWriter out, String lastRealPath[],Integer num) throws IOException{
		String path=request.getServletContext().getRealPath("/upload");
		//String path = UploadUtil.readProp("upload_file_path");
		MultipartFile mf = files[num-1];
		byte[] mfs = mf.getBytes();
		//定义上传后的文件名字
		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		for(int i = 0; i < 3; i++){
			fileName = fileName + random.nextInt(10);
		}
		//判断是不是第一次上传
		if(null!=lastRealPath && StringUtils.isNotBlank(lastRealPath[num-1])){
			File file = new File(lastRealPath[num-1]);
			file.delete();
		}
		//获得后缀名
		String oriFileName = mf.getOriginalFilename();
		String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
		//要上传文件的绝对路径
		String realPath = path+Constant.SYMBOL+fileName + suffix;
		//相对 
		String relativePath = path+Constant.SYMBOL+fileName + suffix;
		//String hostIp = UploadUtil.readProp("upload_host");
		//String relativePath = hostIp + "/upload/"+fileName + suffix;
		mf.transferTo( new File(realPath));
		//使用json对象把绝对路径和相对路径写回去
		JSONObject jo = new JSONObject();
		jo.accumulate("realPath", realPath);
		jo.accumulate("relativePath", "upload"+Constant.SYMBOL+fileName+suffix);
		//jo.accumulate("relativePath", relativePath);
		//{"realPath":"http://...", "relativePath":"/upload/.."}
		String result = jo.toString();
		out.write(result);
	}*/
	
	//保存图片
	@RequestMapping("/uploadPic.do")
	public void uploadimg(@RequestParam("logoimg") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getSession().getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				//String relativePath = path + Constant.SYMBOL + imgname;
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				//jo.accumulate("relativePath", relativePath);
				out.write(jo.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
	@RequestMapping("/uploadPic1.do")
	public void uploadimg1(@RequestParam("logoimg1") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				//String relativePath = path + Constant.SYMBOL + imgname;
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				//jo.accumulate("relativePath", relativePath);
				out.write(jo.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
	@RequestMapping("/uploadPic2.do")
	public void uploadimg2(@RequestParam("logoimg2") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				String relativePath = path + Constant.SYMBOL + imgname;
				System.out.println(relativePath);
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				//jo.accumulate("relativePath",  relativePath);
				out.write(jo.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
	/*@RequestMapping("/uploadForFck.do")
	public void uploadForFck(HttpServletRequest request,PrintWriter out,
					HttpServletResponse resp,Integer CKEditorFuncNum) throws IOException{
		//String relativepath=request.getServletContext().getRealPath("/upload");
		//String path = UploadUtil.readProp("upload_file_path");
		String path=request.getServletContext().getRealPath("/upload");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) request;
		//从表单获取文件
		Iterator<String> iter = mr.getFileNames();
		String inputName = iter.next();
		//获取文件
		MultipartFile mf = mr.getFile(inputName);
		byte[] mfs = mf.getBytes();
		//定义上传后的文件名字
		String fileName = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		Random random = new Random();
		for(int i = 0; i < 3; i++){
			fileName = fileName + random.nextInt(10);
		}
		//获得后缀名
		String oriFileName = mf.getOriginalFilename();
		String suffix = oriFileName.substring(oriFileName.lastIndexOf("."));
		//要上传文件的绝对路径
		String realPath = path+Constant.SYMBOL+fileName + suffix;
		String relativePath = path+Constant.SYMBOL+fileName + suffix;
		//String hostIp = UploadUtil.readProp("upload_host");
		//String relativePath = hostIp + "/upload/"+fileName + suffix;
		//UploadResponse ur = new UploadResponse(UploadResponse.EN_OK, realPath);
		try { 
			//保存图片 
			mf.transferTo( new File(realPath));
			//返回数据 
			StringBuffer sb = new StringBuffer();
			sb.append("<script type=\"text/javascript\">");
			sb.append("window.parent.CKEDITOR.tools.callFunction("+CKEditorFuncNum+",'"+relativePath+"' , '上传成功!');");
			sb.append("</script>"); 
			resp.getWriter().write(sb.toString()); 
		}catch (IOException e) {
			 e.printStackTrace(); 
		} 
	}*/
	
	//编辑图片
	@RequestMapping("/uploadPic11.do")
	public void uploadimg11(@RequestParam("logoimg11") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response,Integer id) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				//String relativePath = path + Constant.SYMBOL + imgname;
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				
				//jo.accumulate("relativePath", relativePath);
				out.write(jo.toString());
				TKnowledge temp = service.queryById(id);
				temp.setImgs("upload"+Constant.SYMBOL+imgname);
				service.update(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
	@RequestMapping("/uploadPic22.do")
	public void uploadimg22(@RequestParam("logoimg22") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response,Integer id) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				//String relativePath = path + Constant.SYMBOL + imgname;
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				//jo.accumulate("relativePath", relativePath);
				out.write(jo.toString());
				TKnowledge temp = service.queryById(id);
				temp.setExt1("upload"+Constant.SYMBOL+imgname);
				service.update(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
	@RequestMapping("/uploadPic33.do")
	public void uploadimg33(@RequestParam("logoimg33") MultipartFile file,
			PrintWriter out, HttpServletRequest request,
			HttpServletResponse response,Integer id) {
		try {
			String imgname = file.getOriginalFilename();
			String path = request.getServletContext().getRealPath("/upload");
			//String path = "/usr/local/upload"; //本地绝对路径
			//String path = UploadUtil.readProp("upload_file_path");
			if (file.isEmpty() == false) {
				String realPath = path + Constant.SYMBOL + imgname;
				//String hostIp = UploadUtil.readProp("upload_host");
				//String relativePath = hostIp + "/upload" + Constant.SYMBOL + imgname;
				//String relativePath = path + Constant.SYMBOL + imgname;
				File directory = new File(path+Constant.SYMBOL);
				if(!directory.exists() && !directory.isDirectory()){
					directory.mkdirs();
				}
				if(!directory.exists()){
					return ;
				}
				file.transferTo(new File(realPath));

				// 使用json对象把绝对路径和相对路径写回去
				JSONObject jo = new JSONObject();
				jo.accumulate("realPath", realPath);
				jo.accumulate("relativePath", "upload"+Constant.SYMBOL+imgname);
				//jo.accumulate("relativePath", relativePath);
				out.write(jo.toString());
				TKnowledge temp = service.queryById(id);
				temp.setExt2("upload"+Constant.SYMBOL+imgname);
				service.update(temp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			//log.error(e.toString());

			request.setAttribute("error", e.getClass());
			request.setAttribute("reason", e.getMessage());
			StackTraceElement[] arr = e.getStackTrace();
			request.setAttribute("stackTraceElements", arr);
		}
	}
}
