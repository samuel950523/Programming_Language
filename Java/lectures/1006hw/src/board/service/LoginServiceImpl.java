package board.service;

import board.dao.LoginDao;
import board.dao.LoginDaoImpl;
import board.dto.UserDto;

public class LoginServiceImpl implements LoginService {
	LoginDao loginDao = new LoginDaoImpl();

	@Override
	public UserDto login(String userEmail, String userPassword) {
		UserDto userDto = loginDao.login(userEmail);

		if (userDto != null && userDto.getUserPassword().equals(userPassword)) {
			return userDto;
		} else {
			return null;
		}
	}

}
