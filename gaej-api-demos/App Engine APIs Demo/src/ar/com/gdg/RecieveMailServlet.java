package ar.com.gdg;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

public class RecieveMailServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	
				String author=null;
		String  body=null;
		try {
			Properties props = new Properties();
			Session session = Session.getDefaultInstance(props, null);
			MimeMessage message = new MimeMessage(session, req.getInputStream());

			
			author = ((InternetAddress)message.getFrom()[0]).getAddress();
			body = ((Multipart)message.getContent()).getBodyPart(0).getContent().toString();

		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();

		List<String> authors;
		if (cache.get("authors") == null) {
			authors = new LinkedList();
		} else {
			authors = (List<String>) cache.get("authors");
		}

		authors.add(author);
		cache.put("authors", authors);
		cache.put(author, body);

	}

}
