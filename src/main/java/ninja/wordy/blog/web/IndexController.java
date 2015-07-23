package ninja.wordy.blog.web;

import ninja.wordy.blog.model.Post;
import ninja.wordy.blog.model.User;
import ninja.wordy.blog.repository.PostRepository;
import ninja.wordy.blog.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class IndexController {

    @Autowired
    PostRepository postRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @RequestMapping({"", "/", "/index", "/results"})
    public ModelAndView index(@RequestParam(required = false) String searchTerm) {
        ModelAndView mav = new ModelAndView("index");

        List<Post> posts = null;
        if(searchTerm != null) {
            System.out.println("search term " + searchTerm);
            posts = search(searchTerm);
        } else {
            Pageable pageable = new PageRequest(0, 10);
            posts = postRepository.findMostRecentPosts(pageable);
        }
        mav.addObject("posts", posts);

        return mav;
    }

    @RequestMapping({"/login"})
    public ModelAndView login(
            @RequestParam(required = false) String error,
            @RequestParam(required = false) String logout) {
        ModelAndView mav = new ModelAndView("login");

        if(error != null) {
            mav.addObject("error", "Invalid login attempt!");
        }

        if(logout != null) {
            mav.addObject("msg", "You've been logged out successfully.");
        }

        return mav;
    }

    @RequestMapping(value={"/search"}, method = POST)
    public String searchPost(@RequestParam(required = false) String searchTerm) {
        return "redirect:/results?searchTerm=" + searchTerm;
    }

    @RequestMapping(value="/signup", method = GET)
    public ModelAndView signup(User user) {
        ModelAndView mav = new ModelAndView("signup");

        return mav;
    }

    @RequestMapping(value="/signup", method = POST)
    public String signupPost(@ModelAttribute("user")@Valid User user, final BindingResult result, final RedirectAttributes redirectAttrs) {
        if(result.hasErrors()) {
            return "signup";
        } else {
            redirectAttrs.addFlashAttribute("message", "User successfully added...");
            user.setPassword(passwordEncoder.encodePassword(user.getPassword(), ""));
            userRepository.save(user);
        }
        redirectAttrs.addFlashAttribute(user);

        return "redirect:/";
    }

    private List<Post> search(String searchTerm) {
        return jdbcTemplate.query("select * from post where title like '%" + searchTerm + "%'", new BeanPropertyRowMapper<>(Post.class));
    }

}


