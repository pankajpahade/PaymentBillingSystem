package com.payment.action;

import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.payment.db.DBConnection;
import com.payment.db.UtilDao;
import com.payment.form.ForgetPasswordForm;

/**
 * @author pankaj 
 * created on 04-02-2019
 */
public class ForgetPasswordAction extends Action {

	String status = "";

	String eml = null;
	DBConnection conn = null;
	UtilDao utilDao = null;

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ForgetPasswordForm formBean = (ForgetPasswordForm) form;
		
		String enro = formBean.getEnrollment();
        
		utilDao = new UtilDao();
		ResultSet resultSet = utilDao.checkEnrollment(enro);

		while (resultSet.next()) {
			eml = resultSet.getString("email");
		}
		if (eml != null) {
			
			this.sendMail(eml);
			
			status = "success";
		} else {
			status = null;
		}
		return mapping.findForward(status);
	}

	public void sendMail(String to) {
		String from = "wcsdemo12@gmail.com";
		String host = "10.114.37.63";
		String password = "demo#18wcs";

		Properties properties = new Properties();

		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, password);
			}
		});

		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject("Payment Billing System Reset Password Link");
			message.setText("Please click on bellow link to reset your password. \n "
					+ "http://10.114.37.63:8080/PaymentBillingSystem/resetPassword.jsp");
			
			// Send message
			Transport.send(message);
			System.out.println("message sent successfully....");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}