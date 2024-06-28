package com.example.ass1_mark_2.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractAuthenticationFilterConfigurer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class LoginSecurity {
    @Autowired
    UserDetailsService userDetailsService;
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception{
//        return httpSecurity
//                .csrf(AbstractHttpConfigurer::disable)
//                .authorizeHttpRequests(registry -> {
//                    registry.requestMatchers(
//                            "/hoa-don/**"
//                            ).permitAll();
////                    registry.requestMatchers(
////                            "/BanHang/**",
////                            "/ChucVu/**",
////                            "/CTSP/**",
////                            "/DanhMuc/**",
////                            "/hoa-don/**",
////                            "/KhachHang/**",
////                            "/MauSac/**",
////                            "/NhanVien/**",
////                            "/SanPham/**",
////                            "/Size/**"
////                            )
////                            .hasRole("Admin");
//                    registry.requestMatchers("/BanHang/**").hasRole("NhanVien");
//                    registry.anyRequest().authenticated();
//                })
//                .formLogin(httpSecurityFormLoginConfigurer -> {
//                    httpSecurityFormLoginConfigurer.loginPage("/login").permitAll();
//                })
//                .build();
//    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                .csrf(AbstractHttpConfigurer::disable)
                .authorizeHttpRequests(registry -> {
                    registry.requestMatchers("/","/loginNV","/WEB-INF/**").permitAll();
                    registry.requestMatchers(
                            "/BanHang/**"
                    ).hasAnyRole("staff","admin");
                    registry.requestMatchers(
                            "/hoa-don/**",
                            "/ChucVu/**",
                            "/CTSP/**",
                            "/DanhMuc/**",
                            "/KhachHang/**",
                            "/MauSac/**",
                            "/NhanVien/**",
                            "/SanPham/**",
                            "/Size/**"
                    ).hasRole("admin");

                    registry.anyRequest().authenticated();
                })
                .formLogin(AbstractAuthenticationFilterConfigurer::permitAll)
//                .formLogin(httpSecurityFormLoginConfigurer -> {
//                    httpSecurityFormLoginConfigurer.loginPage("/loginNV").permitAll();
//                })
                .build();
    }
    @Bean
    public UserDetailsService userDetailsService() {
        return userDetailsService;
    }

    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(userDetailsService());
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
