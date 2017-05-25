package group13.service;

import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;

import group13.dao.PostRepository;
import group13.model.Post;

@Service
@Transactional
public class PostService {
	private final PostRepository postRepository;

	public PostService(PostRepository postRepository) {
		this.postRepository = postRepository;
	}
	
	public List<Post> findAll(){
		List<Post> lstPost = new ArrayList<Post>();
		for(Post post : postRepository.findAll()){
			lstPost.add(post);
		}
		return lstPost;
	}
	
	public Post findPost(int id){
		return postRepository.findOne(id);
	}
	
	public void save(Post post){
		postRepository.save(post);
	}
	
	public void delete(int id){
		postRepository.delete(id);
	}
}
