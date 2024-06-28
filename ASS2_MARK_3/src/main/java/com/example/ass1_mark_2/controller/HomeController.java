package com.example.ass1_mark_2.controller;

import com.example.ass1_mark_2.controller.base.BaseController;
import com.example.ass1_mark_2.entity.account.Account;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController extends BaseController {
    @GetMapping(value = {"/home-index"})
    public String getIndexHome(ModelMap model){
        model.addAttribute("form",null);
        model.addAttribute("listCTSP",qlctsp.getAllProductAndQuantity());
        model.addAttribute("listS",qls.findAll());
        addAccout(model);
        return "homePage/Home";
    }
    @GetMapping(value = {"/"})
    public String getIndex(ModelMap model){
        model.addAttribute("form",null);
        model.addAttribute("listCTSP",qlctsp.getAllProductAndQuantity());
        model.addAttribute("listS",qls.findAll());
        addAccout(model);
        return "redirect:/home-index";
    }
    @GetMapping(value = "/logout")
    public String getLogout(ModelMap model){
        Account.getAccount().setPassWord(null);
        Account.getAccount().setSdt(null);
        return "redirect:/";
    }
    @GetMapping("/loginNV")
    public String getFormLogin() {
        return "homePage/LoginForm";
    }
}
