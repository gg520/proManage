package com.test.promanage.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.xml.crypto.Data;


/**
 * 
 * class_name：TimeUtils description： 用于返回时间值以及截取时间等操作 editor：guo date：Jul
 * 27, 2017 1:50:02 PM
 * 
 * @version V1.0
 *
 */
public class TimeUtils {
	
	public static final String FORMAT_EXPORT_DATE = "yyyyMMddHHmm";	//模板导出命名

	/**
	 * 获取当前时间的英文月份
	 * @return
	 */
	public static String getMonthEnglish(){
		DateFormat df = new SimpleDateFormat("MMM",Locale.ENGLISH);
		return df.format(new Date());
	}
	/**
	 * 获取date的英文月份
	 * @param date
	 * @return
	 * @throws ParseException 
	 */
	public static String getMonthEnglish(String date){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = null;
		try {
			date1 = sdf.parse(date);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		DateFormat df = new SimpleDateFormat("MMM",Locale.ENGLISH);
		
		return df.format(date1);
		
		
	}
	
	
public static String getDay(String date){
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = null;
		try {
			date1 = sdf.parse(date);
			
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		DateFormat df = new SimpleDateFormat("dd",Locale.ENGLISH);
		
		return df.format(date1);
		
		
	}
	
	/**
	 * 
	 * @return 纯数字类型的当前时间
	 * @throws ParseException
	 */
	public static String getTime() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		return df.format(new Date());
	}

	/**
	 * 获取当前时间蠢问题类型
	 * @return 纯文字类型的时间
	 */
	public static Date getDate() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");// 设置日期格式
		try {
			return df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @param 时间类型
	 *            如：yyyy-mm-dd HH:mm:ss
	 * @return 格式化后的当前时间
	 */
	public static String getTime(String type) {
		SimpleDateFormat df = new SimpleDateFormat(type);// 设置日期格式
		return df.format(new Date());
	}

	public static Date getDate(String type) {
		SimpleDateFormat df = new SimpleDateFormat(type);// 设置日期格式
		try {
			return df.parse(df.format(new Date()));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 
	 * @Title: 日期类型的转换
	 * @Description: TODO
	 * @param @param 要转化的美式日期 如：Tue Aug 02 11:00:18 CST 2016
	 * @return 转化后的日期 如2016-08-02 11:00:18
	 * @throws
	 */
	public static String changeDate(Date date) {
		try {
			/*if (date.matches(".*[a-zA-Z]+.*") == true) {
				SimpleDateFormat sdf = new SimpleDateFormat(
						"EEE MMM dd HH:mm:ss z yyyy", Locale.US);
				Date d = sdf.parse(date);*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				return sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date.toString();
	}
	/**
	 * 
	 * @Title: 日期类型的转换(保留到日 2016-08-02）
	 * @Description: TODO
	 * @param @param 要转化的美式日期 如：Tue Aug 02 11:00:18 CST 2016
	 * @return 转化后的日期 如2016-08-02
	 * @throws
	 */
	public static String changeDate1(Date date) {
		try {
			/*if (date.matches(".*[a-zA-Z]+.*") == true) {
				SimpleDateFormat sdf = new SimpleDateFormat(
						"EEE MMM dd HH:mm:ss z yyyy", Locale.US);
				Date d = sdf.parse(date);*/
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				return sdf.format(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return date.toString();
	}
	/**
	 * 
	* @Title 获取时间差
	* @param  要比较的时间
	* @return 该时间距离今天还有多少天 负数代表该天已经过去
	* @throws
	 */
	public static long dateDiffDay(Date date){
		if(date==null){
			return -10;
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = TimeUtils.getDate();
		//System.out.println("参数："+date);
		//System.out.println("现在："+date1);
		 long l=date.getTime()-date1.getTime();
		 long day=l/(24*60*60*1000);
		return day;
	}
	
	/**
	 * 获取时间差，返回时间天数
	 * @param startDay
	 * @param endDay
	 * @return 天数
	 * @throws Exception
	 */
	public static long dateDiffDay(String startDay,String endDay)throws Exception{
		if(startDay==null||endDay==null||startDay.length()<=0||endDay.length()<=0){
			//throw new Exception("时间错误");
			return 0;
		}
		Date date1=TimeUtils.StringToDate(startDay);
		Date date2=TimeUtils.StringToDate(endDay);
		long l=date2.getTime()-date1.getTime();
		long day=l/(24*60*60*1000);
		return day;
	}
	/**
	 * 获取动态时间差，天|时|分|秒
	 * @param date
	 * @return
	 */
	public static String  dateDifference(Date date){
		if(date==null){
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = new Date();
		
		 long l=date1.getTime()-date.getTime();
		
		 long month;
		 if(l>(7*24*60*60*1000*2)){
			 return sdf.format(date);
		 }
		
		 if(l>(7*24*60*60*1000)){
			 return "1周前";
		 }
		if(l>(24*60*60*1000)){
			 long day=l/(24*60*60*1000);
			return day+"天前";
		 }else if(l>(60*60*1000)){
			 long hour=l/(60*60*1000);
			 return hour+"小时前";
		 }else if(l>(60*1000)){
			 long min=l/(60*1000);
			 return min+"分钟前";
		 }else/* if(l>1000){
			 long seconds=l/1000;
			 return seconds+"秒前";
		 }else*/{
			 return "刚刚";
		 }
		 
	}
	/**
	 * 获取动态时间差，天|时|分|秒
	 * @param date
	 * @return
	 */
	public static String  dateDifference(String str){
		if(str==null){
			return "";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(str);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		Date date1 = new Date();
		
		 long l=date1.getTime()-date.getTime();
		 
		 long month;
		 if(l>(7*24*60*60*1000*2)){
			 return str;
		 }
		 if(l>(7*24*60*60*1000)){
			 return "1周前";
		 }
		if(l>(24*60*60*1000)){
			 long day=l/(24*60*60*1000);
			return day+"天前";
		 }else if(l>(60*60*1000)){
			 long hour=l/(60*60*1000);
			 return hour+"小时前";
		 }else if(l>(60*1000)){
			 long min=l/(60*1000);
			 return min+"分钟前";
		 }else/* if(l>1000){
			 long seconds=l/1000;
			 return seconds+"秒前";
		 }else*/{
			 return "刚刚";
		 }
		 
	}
	/**
	 * 
	* @Title 获取时间差
	* @param  要比较的时间
	* @return 该时间距离今天还有多少秒 负数代表已经过去
	* @throws
	 */
	public static long dateDiffSecond(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = new Date();
		
		 long l=date.getTime()-date1.getTime();
		 long second=l/1000;
		 /*System.out.println(second);*/
		return second;
	}
	/**
	 * 当前时间距离还有多少毫秒
	* @Title 获取时间差
	* @param  要比较的时间
	* @return 该时间距离今天还有多少毫秒 负数代表已经过去
	* @throws
	 */
	public static long dateDiffMS(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = new Date();
		
		 long l=date.getTime()-date1.getTime();
		 
		return l;
	}
	/**
	 *   判断当前时间是否在指定日期之间
	 * @param 开始星期X
	 * @param 开始时间
	 * @param 结束星期X
	 * @param 结束时间
	 * @return  true|fasle
	 */
    public static boolean isTimeArea(String timeArr){
//    	System.out.println(weekStart+" "+hourStart+" "+weekEnd+" "+hourEnd);
    	Calendar cal=Calendar.getInstance();
    	cal.setTime(new Date()); 
    	int week=cal.get(Calendar.DAY_OF_WEEK)-1;
    	week = week==0 ? 7:week;
    	if (timeArr.contains(String.valueOf(week))) {
			return false;
		}
    	return true;
    }
    /**
     * 
    * @Title  字符串转化为日期类型
    * @param  日期类型
    * @return yyyy-MM-dd类型的日期
    * @throws
     */
    public static Date StringToDate(String string){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
	    Date date = new Date();
		try {
			date = sdf.parse(string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    return date;
    }
    /**
     * 
    * @Title  字符串转化为日期类型
    * @param  日期类型
    * @return 全类型的日期
    * @throws
     */
    public static Date StringToDateAll(String string){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
	    Date date = new Date();
	    if(string.length()==0){
	    	return date;
	    }
		try {
			
			date = sdf.parse(string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    return date;
    }
    /**
     *  获取N天前的日期
     * @param day  天数
     * @return 日期  yyyy-mm-dd
     */
    public static String GetDayBegin(int day){
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    Date date = new Date();
	    Calendar c = Calendar.getInstance();  
        c.setTime(date);   //设置当前日期  
        c.add(Calendar.DATE, -day); //日期减1天  
        date = c.getTime(); 
    	return sdf.format(date);
    }
    
    public static Date addDateMinute(String day, int x){   
          SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 24小时制  
          Date date = null;   
          try {   
              date = format.parse(day);   
          } catch (Exception ex) {   
              ex.printStackTrace();   
          }   
          Calendar cal = Calendar.getInstance();   
          cal.setTime(date);   
          cal.add(Calendar.MINUTE, x);// 24小时制   
          date = cal.getTime();   
          cal = null;   
          return date;   
      }  
    
    public static Date addDateSecond(Date date, int x){ 
        Calendar cal = Calendar.getInstance();   
        cal.setTime(date);   
        cal.add(Calendar.SECOND, x);// 24小时制   
        date = cal.getTime();   
        cal = null;   
        return date;   
    } 
    
    //获取当前周几
    //输出格式：星期一
    public static String getWeek(){
    	Date date=new Date();
		SimpleDateFormat dateFm=new SimpleDateFormat("EEEE");
		return dateFm.format(date);
    }
    /**
     * 设置日期的输出格式
     * @param 传入的时间
     * @return 24小时制（yyyy-MM-dd HH:mm:ss）类型的输出格式
     */
    public static Date getTime(Date date){
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		try {
			return df.parse(df.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
    	
    }
    /**
     * 获取上月的第一天日期
     * @return yyyy-MM-dd
     */
    public static String getLastMonthFirstDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	calendar.add(Calendar.MONTH, -1);
    	calendar.set(Calendar.DAY_OF_MONTH, 1);//设置为一号
    	return format.format(calendar.getTime());
    }
    /**
     * 获取上月的最后一天日期
     * @return yyyy-MM-dd
     */
    public static String getLastMonthLastDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	
    	calendar.set(Calendar.DAY_OF_MONTH, 0);//设置为一号
    	return format.format(calendar.getTime());
    }
    
    /**
     * 获取本月的第一天日期
     * @return yyyy-MM-dd
     */
    public static String getMonthFirstDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	calendar.add(Calendar.MONTH, 0);
    	calendar.set(Calendar.DAY_OF_MONTH, 1);//设置为一号
    	return format.format(calendar.getTime());
    }
    
    /**
     * 获取上周周一的日期
     * @return yyyy-MM-dd
     */
    public static String getLastWeekFirstDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	int i=0;
    	if(calendar.get(Calendar.DAY_OF_WEEK)==1){
    		i=-6;
    	}else{
    		i=2-calendar.get(Calendar.DAY_OF_WEEK);
    	}
    	calendar.add(Calendar.DAY_OF_WEEK, i-7);//i-7是距离今天的天数，负值是表示已经过去
    	
    	return format.format(calendar.getTime());
    }
    /**
     * 获取本周周一的日期
     * @return yyyy-MM-dd
     */
    public static String getWeekFirstDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	int i=0;
    	if(calendar.get(Calendar.DAY_OF_WEEK)==1){
    		i=-6;
    	}else{
    		i=2-calendar.get(Calendar.DAY_OF_WEEK);
    	}
    	calendar.add(Calendar.DAY_OF_WEEK, i);//i-7是距离今天的天数，负值是表示已经过去
    	
    	return format.format(calendar.getTime());
    }
    /**
     * 获取上周 周日的日期
     * @return yyyy-MM-dd
     */
    public static String getLastWeekLastDay(){
    	SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    	Calendar calendar=Calendar.getInstance();
    	int i=0;
    	if(calendar.get(Calendar.DAY_OF_WEEK)==1){
    		i=-6;
    	}else{
    		i=2-calendar.get(Calendar.DAY_OF_WEEK);
    	}
    	calendar.add(Calendar.DAY_OF_WEEK, i-1);//i-7是距离今天的天数，负值是表示已经过去
    	
    	return format.format(calendar.getTime());
    }
    
	public static void main(String[] args) throws ParseException {
	
		System.out.println(getMonthFirstDay());
		System.out.println(getWeekFirstDay());
	}
}
