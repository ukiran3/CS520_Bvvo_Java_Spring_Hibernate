package Bvvo.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import Bvvo.model.Review;
import Bvvo.model.User;
import Bvvo.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public User getUserById( Integer id )
	{
		return entityManager.find( User.class, id );
	}

	@Override
	public List<User> getUsers()
	{
		return entityManager.createQuery("from User", User.class ).getResultList();
	}
	
	@Override
	public List<User> getUserByUnameNPassword(String uname, String pwd)
	{
		return entityManager.createQuery("from User where username=:uname and password=:pwd", User.class ).setParameter("uname", uname).setParameter("pwd", pwd).getResultList();
	}
	
	/*@Override
	@Transactional
	public User saveUser( User user, MultipartFile file )
	{
		
		
		return entityManager.merge( user );
	}
	
	@Override
	@Transactional
	public Images saveImage(Images image, MultipartFile file) 
	{
		Session se = (Session)entityManager.getDelegate();
		try {
			Blob blob = se.getLobHelper().createBlob(file.getInputStream(), file.getSize());
			image.setFile(blob);
			image.setName(file.getOriginalFilename());
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return entityManager.merge( image );
	}
*/
	
	@Override
	@Transactional
	public User saveUser(User user) 
	{
		//System.out.println(user.getFile().toString());
		return entityManager.merge( user );
	}

	@Override
	public List<User> getLawyers() 
	{
		return entityManager.createQuery("from User where user_type='ROLE_LAWYER'", User.class ).getResultList();
	}

    @Override
    @Transactional
	public Review saveReview(Review review) 
	{
		return entityManager.merge( review );
	}

	@Override
	public List<Review> getReviewsByLawyerId(Integer lawyer) 
	{
		return entityManager.createQuery("from Review where lawyer.id=:law", Review.class ).setParameter("law", lawyer).getResultList();
	}

	@Override
	public List<User> getUserByUname(String uname) 
	{
		return entityManager.createQuery("from User where username=:uname", User.class ).setParameter("uname", uname).getResultList();
	}

	@Override
	public Review getReviewById(Integer id) 
	{
		return entityManager.find( Review.class, id );
	}

}
