package com.example.ass1_mark_2.controller;

import com.example.ass1_mark_2.controller.base.BaseController;
import com.example.ass1_mark_2.entity.account.Account;
import com.example.ass1_mark_2.entity.model.HDCT;
import com.example.ass1_mark_2.entity.model.HoaDon;
import com.example.ass1_mark_2.entity.model.KhachHang;
import com.example.ass1_mark_2.entity.sumMoney.TotalAmount;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.math.BigDecimal;
import java.util.ArrayList;

@Controller
@RequestMapping("/hoa-don")
public class HoaDonController extends BaseController {
    private Integer pageHD = 0;
    private Integer pageHDCT = 0;
    private Integer idHD;
    @GetMapping("/list")
    public String getForm(ModelMap model) {
        String check = this.addAccout(model);
//        if(check != null){
//            return check;
//        }
        this.addAtribute(model);
        Integer pageMax = (int) Math.ceil((double) this.qlhd.getALLHDByTTHT().size() / 2);
        model.addAttribute("pageMax",pageMax);
        model.addAttribute("form","../banHang/HoaDon.jsp");
        return "homePage/Home";
    }
    @ModelAttribute("listHD")
    public Page<HoaDon> getListHD() {
        return qlhd.getHDByTTHT(pageHD,2);
    }
    @GetMapping("/trang/{page}")
    public String getPage(@PathVariable("page") Integer page,ModelMap model){
        String check = this.addAccout(model);
//        if(check != null){
//            return check;
//        }
        pageHD = page - 1;
        return "forward:/hoa-don/list";
    }
    @GetMapping("/detail/{id}")
    public String getDetail(@PathVariable("id") Integer id, ModelMap model){
        String check = this.addAccout(model);
//        if(check != null){
//            return check;
//        }
        pageHDCT = 0;
        idHD = id;
        this.addAtribute(model);
        Integer pageMax = (int) Math.ceil((double) this.qlhdct.getHDCTByIdHD(id).size()/2);
        model.addAttribute("pageMaxHDCT",pageMax);
        model.addAttribute("hdct",qlhdct.getHDCTByIdHD_Page(id,pageHDCT,2).getContent());
        return "forward:/hoa-don/list";
    }
    @GetMapping("/page-hdct/{page}")
    public String getPageHDCT(@PathVariable("page") Integer page,ModelMap modelMap){
        String check = this.addAccout(modelMap);
//        if(check != null){
//            return check;
//        }
        this.addAtribute(modelMap);
        pageHDCT = page - 1;
        return "forward:/hoa-don/detail/" + idHD;
    }

    public void addAtribute(ModelMap model){

        ArrayList<TotalAmount> listTien = new ArrayList<>();

        listTien = qlhdct.getTien();
        for(HoaDon hdDon : this.qlhd.findAll()){
            int id = hdDon.getId();
            boolean found = false;
            for (TotalAmount tt : listTien) {
                if (tt.getId() == id) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                listTien.add(new TotalAmount(id, new BigDecimal(0.00)));
            }
        }

        model.addAttribute("listTien",listTien);
    }

}
