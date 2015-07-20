package ninja.wordy.blog.web;

import ninja.wordy.blog.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping({"/manage"})
public class ManageController {

    @Autowired
    PostRepository postRepository;

    @RequestMapping({"", "/", "/index"})
    public ModelAndView index () {

        return new ModelAndView("manage/manage");
    }

}


