package web.security.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import web.security.service.UserDetailsServiceImpl;


@EnableWebSecurity
@ComponentScan("web.service")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public LoginSuccessHandler loginSuccessHandler() {
        return new LoginSuccessHandler();
    }

    //@Bean
    //public FailureAuthenticationHandler failureAuthenticationHandler() {
    //    return new FailureAuthenticationHandler();
    //}

    @Bean
    public LogoutSuccessHandlerImpl logoutSuccessHandler() {
        return new LogoutSuccessHandlerImpl();
    }


    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/admin/**").hasRole("admin")
                .antMatchers("/user/**").hasAnyRole("user", "admin")
                .and()
                .authorizeRequests().antMatchers("/login**").permitAll()
                .and()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/loginAction")
                .successHandler(loginSuccessHandler())
                .permitAll()
                //.failureHandler(failureAuthenticationHandler())
                //.permitAll()
                .and()
                .logout().logoutSuccessHandler(logoutSuccessHandler()).permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/accessDenied");
    }
}
