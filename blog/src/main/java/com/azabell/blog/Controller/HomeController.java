import org.springframework.stereotype.HomeController;
import org.springframework.web.bind.annoation.GetMapping;

@HomeController
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "home";
    }
}
