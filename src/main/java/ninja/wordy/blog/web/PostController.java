package ninja.wordy.blog.web;

import ninja.wordy.blog.model.Post;
import ninja.wordy.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.sql.Timestamp;
import java.util.Date;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
@RequestMapping({"/post"})
public class PostController {

    @Autowired
    PostRepository postRepository;

    @RequestMapping(value = {"", "/", "/index", "/post"}, method = GET)
    public ModelAndView post (Post post) {

        return new ModelAndView("post/post");
    }

    @RequestMapping(value={"", "/", "/post"}, method = POST)
    public String postPost(@ModelAttribute("post")@Valid Post post, final BindingResult result, final RedirectAttributes redirectAttrs) {
        if(result.hasErrors()) {
            return "post/post";
        } else {
            post.setCreatedDate(new Timestamp(new Date().getTime()));
            postRepository.save(post);
            redirectAttrs.addFlashAttribute("message", "Post successfully added...");
        }
        redirectAttrs.addFlashAttribute(post);

        return "redirect:/";
    }


}


