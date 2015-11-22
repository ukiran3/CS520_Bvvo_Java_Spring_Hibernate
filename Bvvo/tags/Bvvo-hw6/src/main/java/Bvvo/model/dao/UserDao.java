package Bvvo.model.dao;

import java.util.List;
import Bvvo.model.Review;
import Bvvo.model.User;

public interface UserDao 
{
	User getUserById( Integer id );

	List<User> getUsers();
	
	Review getReviewById(Integer id);
	
	User saveUser( User user );
	
	List<User> getUserByUnameNPassword(String uname, String pwd);
	
	List<User> getUserByUname(String uname);
	
	List<User> getLawyers();
	
	Review saveReview(Review review);
	
	List<Review> getReviewsByLawyerId(Integer lawyerId);
}
