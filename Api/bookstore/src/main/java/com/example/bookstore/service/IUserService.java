package com.example.bookstore.service;

import com.example.bookstore.dto.CartDetailDto;
import com.example.bookstore.model.AppUser;
import com.example.bookstore.model.Cart;
import freemarker.template.TemplateException;

import javax.mail.MessagingException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Optional;

public interface IUserService {

    AppUser findByName(String name);

    String existsByUserName(String username) throws MessagingException, UnsupportedEncodingException;

    void saveNewPassword(String password, String name);


    List<AppUser> findAll();


    void save(AppUser appUser);


    Optional<AppUser> findById(Integer id);

    void edit(AppUser appUser);

    void deleteUser(int id);

    Boolean existsUsername(String username);

    Boolean existsEmail(String email);

    void sendMail(Cart cart, List<CartDetailDto> cartDetailDtoList) throws MessagingException, IOException, TemplateException;
}
