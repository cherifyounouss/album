package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/albums/add","/albums/edit","/albums/delete"})
public class AlbumHandling extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private static final String ADD_ALBUM_FORM = "/WEB-INF/albums/add.jsp";

	private static final String EDIT_ALBUM_FORM = "/WEB-INF/albums/edit.jsp";

	private static final String LIST_ALBUM= "/WEB-INF/albums/list.jsp";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String path = request.getServletPath();
		
		switch (path) {
		
			case "/albums":
			
				getServletContext().getRequestDispatcher(LIST_ALBUM).forward(request, response);
				
				break;

			case "/albums/add":
		
				getServletContext().getRequestDispatcher(ADD_ALBUM_FORM).forward(request, response);
				
				break;
			
			case "/albums/edit":

				getServletContext().getRequestDispatcher(EDIT_ALBUM_FORM).forward(request, response);
				
				break;
				
			case "/albums/delete":
				
				break;
		default:
			break;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
