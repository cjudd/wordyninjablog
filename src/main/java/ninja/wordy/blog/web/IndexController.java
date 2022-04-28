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
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

import java.util.List;
import java.util.UUID;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@RestController
public class IndexController {

    @Autowired
    PostRepository postRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @GetMapping({"", "/", "/index", "/results"})
    public ModelAndView index(@RequestParam(required = false) String searchTerm) {
        ModelAndView mav = new ModelAndView("index");

        List<Post> posts = null;
        if(searchTerm != null) {
            System.out.println("search term " + searchTerm);
            posts = search(searchTerm);
        } else {
            Pageable pageable = PageRequest.of(0, 10);
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
    public ModelAndView searchPost(@RequestParam(required = false) String searchTerm) {
        return new ModelAndView("redirect:/results?searchTerm=" + searchTerm);
    }

    @RequestMapping(value="/signup", method = GET)
    public ModelAndView signup(User user) {
        ModelAndView mav = new ModelAndView("signup");
        mav.addObject("user", new User());
        return mav;
    }

    @RequestMapping(value="/signup", method = POST)
    public ModelAndView signupPost(@ModelAttribute("user")@Valid User user, final BindingResult result, final RedirectAttributes redirectAttrs) {
        if(result.hasErrors()) {
            return new ModelAndView("signup");
        } else {
            redirectAttrs.addFlashAttribute("message", "User successfully added...");
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            userRepository.save(user);
        }
        redirectAttrs.addFlashAttribute(user);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value="/uuid", method = GET)
    public ModelAndView uuid(@ModelAttribute("uuid")String uuid) {

        UUID.fromString(uuid);

        return new ModelAndView("redirect:/");
    }

    private List<Post> search(String searchTerm) {
        return jdbcTemplate.query("select * from post where title like '%" + searchTerm + "%'", new BeanPropertyRowMapper<>(Post.class));
    }

}


