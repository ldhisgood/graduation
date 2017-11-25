package com.qykh.frame.util;

import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class ExcelUtil {
	/**
	 * 将一个List<Object>的集合写入到excel中返回excel对象。
	 * @param <T>
	 * @param title 题头，在excel加入每个字段名，如  姓名   年龄
	 * @param list	目标集合
	 * @param convert	将一个Object对象，转化成一个你想写入到文本中的数组(回调函数）
	 * @return
	 */
	public static <T> HSSFWorkbook toExcel(String [] title,List<T> list,IConvert<T> convert){
		HSSFWorkbook book = new HSSFWorkbook();
		HSSFSheet sheet = book.createSheet();
		HSSFRow row = sheet.createRow(0);
		for(int i=0;i<title.length;i++){
			HSSFCell tempCell = row.createCell(i);
			tempCell.setCellValue(title[i]);
		}
		for(int i=1;i<list.size();i++){
			T obj = list.get(i);
			String[] pars = convert.par(obj);
			HSSFRow tempRow = sheet.createRow(i);
			for(int j=0;j<pars.length;j++){
				HSSFCell cell = tempRow.createCell(j);
				cell.setCellValue(pars[j]);
			}
		}
		return book;
	}
	
	public interface IConvert<T>{
		public String[] par(T obj);
	}
	
}
