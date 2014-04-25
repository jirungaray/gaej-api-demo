package ar.com.gdg;

import java.io.IOException;
import java.util.Date;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.memcache.MemcacheServiceFactory;

public class CronServlet extends HttpServlet {
	private final Logger logger = Logger.getAnonymousLogger();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemcacheServiceFactory.getMemcacheService().put("report", "son las "+new Date()+" .... y todo esta sereno!");
	}

}
