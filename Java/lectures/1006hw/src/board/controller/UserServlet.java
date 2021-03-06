package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import board.dto.UserDto;
import board.service.UserService;
import board.service.UserServiceImpl;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/register")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmail");
		String userPassword = request.getParameter("userPassword");

		UserDto userDto = new UserDto();
		userDto.setUserName(userName);
		userDto.setUserEmail(userEmail);
		userDto.setUserPassword(userPassword);

		UserService userService = new UserServiceImpl();

		int ret = userService.userRegister(userDto);

		Gson gson = new Gson();

		JsonObject jsonObject = new JsonObject();

		if (ret == 1)
			jsonObject.addProperty("result", "success");
		else
			jsonObject.addProperty("result", "fail");

		String jsonStr = gson.toJson(jsonObject);
		response.getWriter().write(jsonStr);
	}
}
