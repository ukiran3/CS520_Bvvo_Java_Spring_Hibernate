package Bvvo.web.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import Bvvo.model.Review;
import Bvvo.model.User;
import Bvvo.model.dao.UserDao;

@Controller
@SessionAttributes("user")
public class UserController {

	@Autowired
	UserDao userDao;
	
	@RequestMapping("/users/ViewUsers.html")
	public String viewUsers( ModelMap models )
	{
		models.put( "users", userDao.getUsers() );
		return "users/ViewUsers";
	}

	@RequestMapping(value = "/users/UserSignUp.html", method = RequestMethod.GET)
	public String addUser( @RequestParam String type, ModelMap models, HttpSession session  )
	{
		models.put( "user", new User() );
		session.setAttribute("userType", type);
		return "users/UserSignUp";
	}

	@RequestMapping(value = "/users/UserSignUp.html", method = RequestMethod.POST)
	public String addUser( @ModelAttribute User user)
	{
			userDao.saveUser( user );
			return "redirect:ViewUsers.html";
	}
	
	@RequestMapping(value = "/users/login.html", method = RequestMethod.GET)
	public String login( ModelMap models)
	{
		models.put( "userForLogin", new User() );
		return "users/login";
	}

	@RequestMapping(value = "/users/login.html", method = RequestMethod.POST)
	public String login( @RequestParam String email, String password, HttpSession session)
	{
		
		User user = userDao.getUserByUnameNPassword(email, password);
		if(user != null)
		{
			if(user.getUser_type().equals("user"))
			{
				session.setAttribute("userName", email);
				session.setAttribute("u_type", "user");
				return "redirect:search.html";
			}
			else
			{
				session.setAttribute("userName", email);
				session.setAttribute("u_type", "lawyer");
				return "redirect:ViewUsers.html";
			}
		}
		else
		{
			return "redirect:login.html";
		}
		
				//return "redirect:ViewUsers.html";
	}
	
	@RequestMapping(value = "/users/logout.html")
	public String logout( HttpSession session)
	{
		session.invalidate();
		return "redirect:search.html";
	}

	@RequestMapping(value = "/users/LawyerProf.html")
	public String LawyerProf( ModelMap models, HttpServletRequest request, @RequestParam Integer lawyerId)
	{
		User lawyer = userDao.getUserById(lawyerId);
		List<Review> reviews = userDao.getReviewsByLawyerId(lawyerId);
		
		models.put( "lawyerProf", lawyer );
		models.put("reviewsById", reviews);
		return "users/LawyerProf";
	}
	
	@RequestMapping(value = "/users/WriteReview.html", method = RequestMethod.GET)
	public String WriteReview( @RequestParam Integer id, ModelMap models , HttpSession session)
	{
		models.put( "WriteRev", new Review());
		models.put("date", new Date());
		models.put("Rev_User", userDao.getUserByUname(String.valueOf(session.getAttribute("userName"))).getId());
		models.put("Rev_Lawyer", id);
		return "users/WriteReview";
	}

	@RequestMapping(value = "/users/WriteReview.html", method = RequestMethod.POST)
	public String WriteReview( @ModelAttribute Review review, @RequestParam Integer id)
	{
		User lawyer = userDao.getUserById(id);
		userDao.saveReview(review);
		return "redirect:LawyerProf.html?lawyerId="+lawyer.getId()+"";
	}
	@RequestMapping(value = "/users/search.html", method = RequestMethod.GET)
	public String search( ModelMap models )
	{
		models.put( "userForSearch", new User() );
		return "users/search";
	}

	@RequestMapping(value = "/users/search.html", method = RequestMethod.POST)
	public String search( @RequestParam String email, String city, String areaOfExpertise, HttpSession session, ModelMap models)
	{
		List<User> lawyers = userDao.getLawyers();
		List<User> resultLawyers = new ArrayList<User>();
		if(lawyers != null)
		{
			for(int i = 0; i < lawyers.size(); i++)
			{
				User lawyer = lawyers.get(i);
				if(lawyer.getfName().toLowerCase().contains(email.toLowerCase()) || lawyer.getlName().toLowerCase().contains(email.toLowerCase()))
				{
					resultLawyers.add(lawyer);
					lawyers.remove(lawyer);
				}
				else
				{
						if(lawyer.getCity().toLowerCase().contains(city.toLowerCase()) || lawyer.getState().toLowerCase().contains(city.toLowerCase()) || (String.valueOf(lawyer.getZip()).toLowerCase().contains(city.toLowerCase())))
						{
							resultLawyers.add(lawyer);
							lawyers.remove(lawyer);
						}
						else
						{
							if(lawyer.getAreaOfExpertise().toLowerCase().equals(areaOfExpertise.toLowerCase()))
							{
								resultLawyers.add(lawyer);
								lawyers.remove(lawyer);
							}
						}
				}
			}
			models.put("usersFromSearch", resultLawyers);
			return "users/SearchResults";
		}
		else
		{
			return "redirect:search.html";
		}
		//return "redirect:ViewUsers.html";
	}

}
