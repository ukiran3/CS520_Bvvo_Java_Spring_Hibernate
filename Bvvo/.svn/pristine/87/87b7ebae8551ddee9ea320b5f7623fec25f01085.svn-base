package Bvvo.web.controller;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import Bvvo.model.Review;
import Bvvo.model.User;
import Bvvo.model.dao.UserDao;
import Bvvo.security.SecurityUtils;
import Bvvo.web.validator.UserValidator;

@Controller
@SessionAttributes("user")
public class UserController 
{

	@Autowired
	UserDao userDao;
	
	@Autowired
	UserValidator userValidator;
	 
	 @Autowired
	 JavaMailSenderImpl mailSender;
	
	@RequestMapping("/users/compose.html")
    public String compose()
    {
        return "email/compose";
    }
	
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
	public String addUser( @ModelAttribute User user ,@RequestParam(value="fileUp", required=false) MultipartFile file, @RequestParam String type, BindingResult bindingResult) throws IOException
	{			
			//System.out.println(file.getOriginalFilename());
		
			//try {
				//FileInputStream file = new FileInputStream(uploadedFile.getOriginalFilame());
				//BinaryStream bs = new BinaryStream(file, uploadedFile.getSize());
			/*if( !uploadedFile.isEmpty() )
			{
			File file = new File(uploadedFile.getOriginalFilename());
			try {
				uploadedFile.transferTo(file);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
				user.setFile(file);
			}
			//} catch (FileNotFoundException e) {
				
				//e.printStackTrace();
			//} 
		
			Session session2 = sessionFactory.getCurrentSession();
			LobHelper lob = session2.getLobHelper();
			Blob blob = lob.createBlob(file.getInputStream(), file.getSize());
			user.setFile(blob);  
		
			//Images image = new Images();
			
			//userDao.saveImage(image, file);
			//userDao.saveUser( user );
			File file = new File("hello.png");
			upFile.transferTo(file);
			BufferedImage image = ImageIO.read(file);
		      ByteArrayOutputStream baos = new ByteArrayOutputStream();
		      ImageIO.write(image, "png", baos);
		     byte[] res=baos.toByteArray();
		      byte[] encodedImage = Base64.encode(baos.toByteArray());
		      byte[] last = scale(res, 400, 400);
		      byte[] encodedImage2 = Base64.encode(last);
			System.out.println(upFile.getBytes());
			System.out.println(encodedImage.toString());
			user.setFile(encodedImage2); */
		
		userValidator.validate( user, bindingResult );
        if( bindingResult.hasErrors() ) return "users/UserSignUp";

		
		if(type.equals("lawyer"))
		{	
			if(!file.isEmpty())
			{
				byte[] bytes = file.getBytes();
				byte[] smallImg = scale(bytes, 66, 88);
				byte[] largeImg = scale(bytes, 112, 149);
				user.setSmallImg(smallImg);
				user.setLargeImg(largeImg);
			}
		}
		else
		{
				
		}
		
			userDao.saveUser( user );
			return "redirect:search.html";
	}

	@RequestMapping(value = "/users/edit.html", method = RequestMethod.GET)
	public String editUser( ModelMap models, HttpSession session  )
	{
		User userU = null;
		if(userDao.getUserByUname(SecurityUtils.getUsername()).size() > 0)
		{
			userU = userDao.getUserByUname(SecurityUtils.getUsername()).get(0);
		}
		models.put( "user",  userU);
		session.setAttribute("userType", userU.getUser_type());
		return "users/edit";
	}

	@RequestMapping(value = "/users/edit.html", method = RequestMethod.POST)
	public String editUser( @ModelAttribute User user ,@RequestParam(value="fileUp", required=false) MultipartFile file, @RequestParam String user_type, BindingResult bindingResult, SessionStatus sessionStatus) throws IOException
	{			
		userValidator.validate( user, bindingResult );
        if( bindingResult.hasErrors() ) return "users/edit.html";
		
		if(user_type.equals("lawyer"))
		{	
			if(!file.isEmpty())
			{
				byte[] bytes = file.getBytes();
				byte[] smallImg = scale(bytes, 66, 88);
				byte[] largeImg = scale(bytes, 112, 149);
				user.setSmallImg(smallImg);
				user.setLargeImg(largeImg);
			}
		}
		else
		{
			
		}
			userDao.saveUser( user );
			//sessionStatus.setComplete();
			return "redirect:search.html";
	}
	
	/*
	@RequestMapping(value = "/users/login.html", method = RequestMethod.GET)
	public String login( ModelMap models)
	{
		models.put( "userForLogin", new User() );
		return "users/login";
	}

	@RequestMapping(value = "/users/login.html", method = RequestMethod.POST)
	public String login( @RequestParam String email, String password, HttpSession session)
	{
		List<User> users = userDao.getUserByUnameNPassword(email, password);
		User user = null;
		if(users.size() > 0)
		{
			user = users.get(0);
			if(user != null)
			{
					session.setAttribute("userName", email);
					session.setAttribute("u_type", user.getUser_type());
					return "redirect:search.html";
			}
			else
			{
				return "redirect:login.html";
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
	} */

	@RequestMapping(value = "/users/LawyerProf.html")
	public String LawyerProf( ModelMap models, HttpServletRequest request, @RequestParam Integer lawyerId, HttpServletResponse response)
	{
		User lawyer = userDao.getUserById(lawyerId);
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
	/*	
		response.setHeader( "Content-Disposition", "inline; filename=" );

        File file = new File( fileDir, name );
        FileInputStream in = new FileInputStream( file );
        OutputStream out = response.getOutputStream();
        byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );
        in.close(); 
		
		try {
			OutputStream out = response.getOutputStream();
		} catch (IOException e) {
			e.printStackTrace();
		} */
		
		//byte[] fileBy = scale(lawyer.getFile(), 400, 400);
	    	boolean bool = true;
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
		models.put( "lawyerProf", lawyer );
		models.put("reviewsById", reviews);
		return "users/LawyerProf";
	}
	
	
	@RequestMapping(value = "/users/getImage.html")
	public String getImage( @RequestParam Integer id, @RequestParam String type, HttpServletResponse response) throws IOException
	{
		User lawyer = userDao.getUserById(id);
		response.setHeader( "Content-Disposition", "inline; filename=hello.png"  );
		byte[] fil = null;
		
		if(type.equals("small"))
		{
			fil = lawyer.getSmallImg();
		}
		if(type.equals("large"))
		{
			fil = lawyer.getLargeImg();
		}
			 
		InputStream in = new ByteArrayInputStream(fil);
		OutputStream out = response.getOutputStream();
	        byte buffer[] = new byte[2048];
	        int bytesRead;
	        while( (bytesRead = in.read( buffer )) > 0 )
	            out.write( buffer, 0, bytesRead );
	        in.close();		
		return null;
	}

	public byte[] scale(byte[] fileData, int width, int height) 
	{
    	ByteArrayInputStream in = new ByteArrayInputStream(fileData);
    	try {
    		BufferedImage img = ImageIO.read(in);
    		if(height == 0) {
    			height = (width * img.getHeight())/ img.getWidth(); 
    		}
    		if(width == 0) {
    			width = (height * img.getWidth())/ img.getHeight();
    		}
    		Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    		BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

    		ByteArrayOutputStream buffer = new ByteArrayOutputStream();

    		ImageIO.write(imageBuff, "jpg", buffer);

    		return buffer.toByteArray();	
    	} catch (IOException e) {
    		try {
				throw new ApplicationException("IOException in scale", null);
			} catch (ApplicationException e1) {
				e1.printStackTrace();
			}
    	}
    	return null;
    }
	
	@RequestMapping(value = "/users/search.html", method = RequestMethod.GET)
	public String search( ModelMap models )
	{
		models.put( "userForSearch", new User() );
		return "users/search";
	}

	@RequestMapping(value = "/users/search.html", method = RequestMethod.POST)
	public String search( @RequestParam String username, String city, String areaOfExpertise, HttpSession session, ModelMap models)
	{
		List<User> lawyers = userDao.getLawyers();
		List<User> resultLawyers = new ArrayList<User>();
		List<User> resultLawyersAfterU = new ArrayList<User>();
		List<User> resultLawyersAfterP = new ArrayList<User>();
		if(lawyers != null)
		{
			if(username.length() > 0)
			{
			for(int i = 0; i < lawyers.size(); i++)
			{
				User lawyer = lawyers.get(i);
				if(lawyer.getfName().toLowerCase().contains(username.toLowerCase()) || lawyer.getlName().toLowerCase().contains(username.toLowerCase()))
				{
					resultLawyers.add(lawyer);
					//lawyers.remove(lawyer);
				}
			}
			}
			else
			{
				resultLawyers = lawyers;
			}
			if(city.length() > 0 && !city.contains(","))
			{
			for(int i = 0; i < resultLawyers.size(); i++)
			{
				User lawyer = resultLawyers.get(i);
				if(lawyer.getCity().toLowerCase().contains(city.toLowerCase()) || lawyer.getState().toLowerCase().contains(city.toLowerCase()) || (String.valueOf(lawyer.getZip()).toLowerCase().contains(city.toLowerCase())))
				{
					resultLawyersAfterU.add(lawyer);
					//lawyers.remove(lawyer);
				}
				
			}
			}	
			else
			{
					if(city.contains(","))
					{
						String[] ar = city.split(", ");
						
						if(ar.length == 3)
						{
							for(int i = 0; i < resultLawyers.size(); i++)
							{
								User lawyer = resultLawyers.get(i);
								if((lawyer.getCity().toLowerCase().contains(ar[0].toLowerCase()) || lawyer.getState().toLowerCase().contains(ar[1].toLowerCase()) || (String.valueOf(lawyer.getZip()).toLowerCase().contains(ar[2].toLowerCase()))))
								{
									resultLawyersAfterU.add(lawyer);
									//lawyers.remove(lawyer);
								}
							}
						}
					}
					else
					{
						resultLawyersAfterU = resultLawyers;
					}
			}
		    	
			if(!areaOfExpertise.equals("0"))
			{
			for(int i = 0; i < resultLawyersAfterU.size(); i++)
			{
				User lawyer = resultLawyersAfterU.get(i);
				if(lawyer.getAreaOfExpertise().toLowerCase().equals(areaOfExpertise.toLowerCase()))
				{
							resultLawyersAfterP.add(lawyer);
							//lawyers.remove(lawyer);
				}
			}
			}
			else
			{
				resultLawyersAfterP = resultLawyersAfterU;
			}
			models.put("usersFromSearch", resultLawyersAfterP);
			return "users/SearchResults";
		}
		else
		{
			return "redirect:search.html";
		}
		//return "redirect:ViewUsers.html";
	}
}
