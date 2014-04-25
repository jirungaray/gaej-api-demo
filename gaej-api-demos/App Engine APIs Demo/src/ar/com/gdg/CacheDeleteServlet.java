package ar.com.gdg;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.memcache.MemcacheService;
import com.google.appengine.api.memcache.MemcacheServiceFactory;

public class CacheDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		MemcacheService cache = MemcacheServiceFactory.getMemcacheService();

		List<String> authors = (List<String>) cache.get("authors");

		String author = req.getParameter("author");
		authors.remove(author);
		cache.put("authors", authors);
		cache.delete(author);

		req.getRequestDispatcher("/cache.jsp").forward(req, resp);
	}

}
