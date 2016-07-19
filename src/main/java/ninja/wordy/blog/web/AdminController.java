package ninja.wordy.blog.web;

import ninja.wordy.blog.model.User;
import ninja.wordy.blog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping({"/admin"})
public class AdminController {

    @Autowired
    UserRepository userRepository;

    @RequestMapping({"", "/", "/index", "/results"})
    public ModelAndView index(@RequestParam(required = false) String searchTerm) {
        ModelAndView mav = new ModelAndView("users");

        Iterable<User> users = userRepository.findAll();
        mav.addObject("users", users);

        return mav;
    }

}
