package com.qykh.frame.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;


public class FileUpDown {
	/**
	 * 下载返回输出流
	 * @param fileName
	 * @param response
	 * @return
	 */
	public OutputStream down(String fileName,HttpServletResponse response){
		OutputStream out = null;
		try {
			out = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		}
		 response.reset();  
		 response.setHeader("Content-Disposition", "attachment; filename="+DateUtil.sysDate()+fileName);  
		 response.setContentType("application/octet-stream; charset=utf-8");  
		 return out;
	}
	/**
	 * 指定文件进行了下载
	 * @param file 指定的文件
	 * @param response	
	 * @param downFileName	下的文件名称
	 */
	public void downFile(File file ,HttpServletResponse response,String downFileName){
		OutputStream out = down(downFileName, response);
		try {
			InputStream in  = new  FileInputStream(file);
			int len = 0;
			byte[] buf = new byte[1024*1024];
			while((len=in.read(buf))!=-1){
				out.write(buf,0,len);
			}
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}	
