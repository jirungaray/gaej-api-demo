package ar.com.gdg;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SendMailServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);

		String msgBody = "...";

		try {
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress("mensajes@gaej-api-demo.appspotmail.com",
					"Servicio de mensajes"));
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(
					req.getParameter("recipient"), "Sr. Usuario"));
			msg.setSubject(req.getParameter("title"));
			msg.setText(req.getParameter("message"));
			Transport.send(msg);

		} catch (Exception e) {
		}
		req.setAttribute("sent", true);
		req.getRequestDispatcher("/mail.jsp").forward(req, resp);
	}

}
