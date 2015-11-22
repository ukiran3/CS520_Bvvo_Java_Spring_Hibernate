package Bvvo.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import Bvvo.model.Review;
import Bvvo.model.User;
import Bvvo.model.dao.UserDao;
import Bvvo.security.SecurityUtils;

@Controller
@SessionAttributes("review")
public class ReviewController 
{
	@Autowired
	UserDao userDao;
	
	@Autowired
	JavaMailSenderImpl mailSender;
	
	@RequestMapping(value = "/users/editReview.html", method = RequestMethod.GET)
	public String editReview( ModelMap models, HttpServletRequest request, @RequestParam Integer lawyerId, Integer revId , HttpServletResponse response)
	{
		User lawyer = userDao.getUserById(lawyerId);
		Review review = userDao.getReviewById(revId);
		List<Review> reviews = userDao.getReviewsByLawyerId(lawyerId);
	    	double know = 0;
	    	double serv = 0;
	    	double over = 0;
	    	int revs = 0;
	    	
	    	for(Review rev : reviews)
	    	{
	    			know += rev.getKnowledge();
	    			serv += rev.getService();
	    			over += rev.getOverall();
	    			revs++;
	    	}
	    	
	    	if(revs > 0)
	    	{
	    		models.put("know", Double.valueOf(String.format("%.3g%n", know / revs)));
	    		models.put("serv", Double.valueOf(String.format("%.3g%n", serv / revs)));
	    		models.put("over", Double.valueOf(String.format("%.3g%n", over / revs)));
	    	}
	    	boolean bool = true, boolRev = true;
	    	int i = 0;
	      	for(Review rev : reviews)
	    	{
	    			if(rev.getUser().getUsername().equals(SecurityUtils.getUsername()))
	    			{
	    				i++;
	    			}
	    	}
	      	if(i > 0) bool = false;
	    	models.put("bool", bool);
	    	
	    	if(review.getUser().getUsername().equals(SecurityUtils.getUsername()))
	    	{
	    		boolRev = false;
	    		models.put("review", review);
	    		models.put("boolRev", boolRev);
	    		models.put("date", new Date());
	    		models.put("Rev_User", userDao.getUserByUname(SecurityUtils.getUsername()).get(0).getId());
	    		models.put("Rev_Lawyer", lawyerId);
	    	}
	    	
		models.put( "lawyerProf", lawyer );
		models.put("reviewsById", reviews);
		return "users/editReview";
	}
	
	@RequestMapping(value = "/users/editReview.html", method = RequestMethod.POST)
	public String editReview2( @ModelAttribute Review review, ModelMap models, HttpServletRequest request, @RequestParam Integer lawyerId, Integer revId , HttpServletResponse response)
	{
		userDao.saveReview(review);
		return "redirect:LawyerProf.html?lawyerId="+lawyerId;
	}
	
	@RequestMapping(value = "/users/WriteReview.html", method = RequestMethod.GET)
	public String WriteReview( @RequestParam Integer id, ModelMap models , HttpSession session)
	{
		User user = null;
		
		String username = SecurityUtils.getUsername();
		if(userDao.getUserByUname(username).size() > 0)
		{
			user = userDao.getUserByUname(username).get(0);
		}
		models.put( "review", new Review());
		models.put("date", new Date());
		models.put("Rev_User", user.getId());
		models.put("Rev_Lawyer", id);
		return "users/WriteReview";
	}

	@RequestMapping(value = "/users/WriteReview.html", method = RequestMethod.POST)
	public String WriteReview( @ModelAttribute Review review, @RequestParam Integer id, BindingResult bindingResult, HttpSession session) throws MessagingException
	{
		//SimpleMailMessage message = new SimpleMailMessage();
		User lawyer = userDao.getUserById(id);
		review.setEnabled(true);
		userDao.saveReview(review);
		User user = null; 
				if(userDao.getUserByUname(SecurityUtils.getUsername()).size() > 0)
				{
					user = userDao.getUserByUname(SecurityUtils.getUsername()).get(0);
				}
		MimeMessage mime = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mime, true);

		//Session session = Session.getInstance(props)
        //MimeMessage mime = new MimeMessage(session);
		
		//helper.setFrom( "kiran.uday3@gmail.com" );
        //helper.setTo( lawyer.getEmail() );
		
		helper.setFrom("reviews@Bvvo.net");
		//helper.setTo(lawyer.getUsername());
		helper.setTo("ubodi@localhost.localdomain");
		
        helper.setSubject( "You Have Received a New Review on BVVO" );
        
        SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm a MM/dd/yyyy");

        Date date = new Date();

        String fmtDate = dateFormat.format(date);
        
        helper.setText( "<html><body>"+user.getlName() +" "+ user.getfName()+" wrote a review of you at "+fmtDate+". You can check out the review at <a href='http://localhost:8080/Bvvo/users/LawyerProf.html?lawyerId="+id+"'>http://localhost:8080/Bvvo/users/LawyerProf.html?lawyerId="+id+"</a></body></html>" , true);

        mailSender.send( mime );

		return "redirect:LawyerProf.html?lawyerId="+lawyer.getId()+"";
	}

	@RequestMapping(value = "/users/deleteRev.html")
	public String deleteReview( @RequestParam Integer lid, Integer revId )
	{
		Review review = userDao.getReviewByIdForDelete(revId);
		review.setEnabled(false);
		userDao.saveReview(review);
		return "redirect:LawyerProf.html?lawyerId="+lid;
	}

	    @RequestMapping(value = "/users/ReviewFts.html", method = RequestMethod.POST)
	    public String textSearch( @RequestParam String text, ModelMap models)
	    {
	    	models.put("result", userDao.getReviewsFts(text) );
			return "users/ResultFts";
	    }
	
}
