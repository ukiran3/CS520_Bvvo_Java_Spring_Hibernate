package Bvvo.model.dao;

import java.util.List;

import Bvvo.model.Review;
import Bvvo.model.User;

public interface UserDao 
{
	User getUserById( Integer id );

	List<User> getUsers();

	User saveUser( User user );
	
	User getUserByUnameNPassword(String uname, String pwd);
	
	User getUserByUname(String uname);
	
	List<User> getLawyers();
	
	Review saveReview(Review review);
	
	List<Review> getReviewsByLawyerId(Integer lawyerId);
}
