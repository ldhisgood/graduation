package com.qykh.builder.util;


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
/**
 *	文件操作类
 * 
 * */
public class FileUtil {
	/**
	 * 输出文件
	 * @param path
	 * @param FileName
	 * @param content
	 */
	public static void out(String path,String FileName,StringBuilder content){
		File file = new File(path,FileName);
		FileWriter out =null;
		try {
			out  = new FileWriter(file);
			out.write(content.toString());
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			if(out!=null){
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}
