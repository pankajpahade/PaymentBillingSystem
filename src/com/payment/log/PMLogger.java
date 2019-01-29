package com.payment.log;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

/**
 * 
 * @author arvind
 * created on 29-01-2019
 */
public class PMLogger {

	static Logger log = null;
	static {
		log  = Logger.getLogger(PMLogger.class);
		PropertyConfigurator.configure(PMLogger.class.getClassLoader().getResourceAsStream("log4.properties"));
	}
	
	/**
	 * It is use to log the exception with exception object
	 * @param msg
	 * @param t
	 */
	public static void appendException(Object msg, Throwable t) {
		log.warn(msg, t);
	}
	
	/**
	 * It is use to log the exception without exception object
	 * @param msg
	 */
	public static void appenException(Object msg) {
		log.warn(msg);
	}
}
