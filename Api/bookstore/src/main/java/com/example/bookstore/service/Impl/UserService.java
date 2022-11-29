package com.example.bookstore.service.Impl;

import com.example.bookstore.dto.CartDetailDto;
import com.example.bookstore.model.AppUser;
import com.example.bookstore.model.Cart;
import com.example.bookstore.model.CartDetail;
import com.example.bookstore.repository.CartDetailRepository;
import com.example.bookstore.repository.UserRepository;
import com.example.bookstore.service.IUserService;
import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class UserService implements IUserService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    Configuration configuration;
    @Autowired
    CartDetailRepository cartDetailRepository;

    @Autowired
    private JavaMailSender javaMailSender;

    @Override
    public AppUser findByName(String name) {
        return userRepository.findAppUserByName(name);
    }

    @Override
    public String existsByUserName(String username) throws MessagingException, UnsupportedEncodingException {
        String user = userRepository.existsByUserName(username);
        AppUser appUser = userRepository.findAppUserByName(username);
        if (user != null) {
            sendVerificationEmailForResetPassWord(username, appUser.getEmail());
        }
        return user;
    }

    @Override
    public void saveNewPassword(String password, String name) {
        userRepository.saveNewPassword(password, name);
    }


    public void sendVerificationEmailForResetPassWord(String userName, String email) throws MessagingException, UnsupportedEncodingException {
        String subject = "Hãy xác thực email của bạn";
        String mailContent = "";
        String confirmUrl = "http://localhost:4200/verify-reset-password/" + userName;


        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
        helper.setFrom("tiendat30111999@gmail.com", "CODE GYM");
        helper.setTo(email);
        helper.setSubject(subject);
        mailContent = "<p sytle='color:red;'>Xin chào " + userName + " ,<p>" + "<p> Nhấn vào link sau để xác thực email của bạn:</p>" +
                "<h3><a href='" + confirmUrl + "'>Link Xác thực( nhấn vào đây)!</a></h3>" +
                "<p>CODE GYM</p>";
        helper.setText(mailContent, true);
        javaMailSender.send(message);
    }


    @Override
    public List<AppUser> findAll() {
        return userRepository.findAll();
    }

    public String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }

    @Override
    public void save(AppUser appUser) {
        if (findByName(appUser.getUsername()) != null) {
            return;
        }
        appUser.setPassword(encrytePassword(appUser.getPassword()));
        userRepository.save(appUser);
    }

    @Override
    public Optional<AppUser> findById(Integer id) {
        return userRepository.findById(id);
    }

    @Override
    public void edit(AppUser appUser) {
        userRepository.edit(appUser.getUsername(), appUser.getPassword(), appUser.getEmail(), appUser.getId());
    }

    @Override
    public void deleteUser(int id) {
        userRepository.deleteUser(id);
    }

    @Override
    public Boolean existsUsername(String username) {
        return username.equals(userRepository.existsUsername(username));
    }

    @Override
    public Boolean existsEmail(String email) {
        return email.equals(userRepository.existsEmail(email));
    }

    @Override
    public void sendMail(Cart cart, List<CartDetailDto> cartDetailDtoList) throws MessagingException, IOException, TemplateException {
        String subject = "Thông Tin Thanh Toán";
        String mailContent = "";
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, "UTF-8");
        helper.setFrom("tiendat30111999@gmail.com", "Book Store");
        helper.setTo(cart.getCustomer().getEmail());
        helper.setSubject(subject);

        DecimalFormat decimalFormat = new DecimalFormat("###,###,###.##");
        int sum = 0;
        int index = 1;
        for (CartDetail cartDetail : cartDetailRepository.findCartDetail(cart.getId())) {
            float discounts = (cartDetail.getBook().getDiscount().getPercent());
            sum += (cartDetail.getBook().getPrice() * cartDetail.getQuantity()) * (1 - (discounts / 100));
            index++;
            StringWriter stringWriter = new StringWriter();
            Map<String, Object> model = new HashMap<>();
            model.put("user", cart.getCustomer());
            model.put("sum", sum);
            model.put("cartDetail", cartDetailRepository.findCartDetail(cart.getId()));
            configuration.getTemplate("email.ftlh").process(model, stringWriter);
            helper.setText(stringWriter.getBuffer().toString(), true);
            javaMailSender.send(message);
        }
    }
}