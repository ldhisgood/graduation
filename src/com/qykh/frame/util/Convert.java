package com.qykh.frame.util;

import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;


/**
 * 
 * @author Administrator
 *	本类实现了，实体对象，变化成map ；以及map对象变成对象
 */
public class Convert {
	/**
	 * 把bean变成Map集合空的舍去
	 * 
	 * @param obj
	 * @return
	 */
	public static Map<String, Object> BeantoMapNotNull(Object obj) {
		return BeantoMap(obj, 1);
	}

	/**
	 * 把bean变成map集合
	 * 
	 * @param obj
	 * @return
	 */
	public static Map<String, Object> BeantoMap(Object obj) {
		return BeantoMap(obj, 2);
	}
	/**
	 * 把一个map变成一个bean文件
	 * @param map
	 * @param clazz
	 * @return
	 */
	public static Object mapToBean(Map<?, ?> map, Class<?> clazz) {
		Object obj = null;
		try {
			obj = clazz.newInstance();
			Method[] methods = clazz.getMethods();
			for (Method m : methods) {
				String methodName = m.getName();
				if (methodName.length() <= 3 ) {
					continue;
				}
				if (methodName.startsWith("set")) {
					String filed = methodName.substring(3, 4).toLowerCase()
							+ methodName.substring(4);
					m.invoke(obj, map.get(filed));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	private static Map<String, Object> BeantoMap(Object obj, int flag) {

		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Class<?> clazz = obj.getClass();
			Method[] methods = clazz.getMethods();
			for (Method m : methods) {
				String methodName = m.getName();
				if (methodName.length() <= 3 || methodName.equals("getClass")) {
					continue;
				}
				if (methodName.startsWith("get")) {
					Object invoke = m.invoke(obj);
					if (flag == 1) {
						if (isNative(invoke))
							continue;
					}
					String filed = methodName.substring(3, 4).toLowerCase()
							+ methodName.substring(4);
					map.put(filed, invoke);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	private static boolean isNative(Object obj) {
		if (obj == null)
			return true;
		return false;
	}

}
