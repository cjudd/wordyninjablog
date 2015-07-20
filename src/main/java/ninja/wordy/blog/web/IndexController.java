package ninja.wordy.blog.web;

import ninja.wordy.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

    @Autowired
    PostRepository postRepository;

    @RequestMapping({"", "/", "/index"})
    public ModelAndView index () {
        ModelAndView mav = new ModelAndView("index");

        mav.addObject("posts", postRepository.findAll());

        return mav;
    }

}


