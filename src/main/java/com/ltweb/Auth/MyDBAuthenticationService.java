package com.ltweb.Auth;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import com.ltweb.Service.customers.customersService;
import com.ltweb.Entity.customers;

@Service
public class MyDBAuthenticationService implements UserDetailsService {

    @Autowired
    private customersService customersService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        customers customers = customersService.getCustomersByUsername(username);

        if (customers == null) {
            throw new UsernameNotFoundException("User " + username + " was not found in the database");
        }
        
        // [USER,ADMIN,..]
        List<String> roles= customersService.getUserRoles(username);
        
        List<GrantedAuthority> grantList= new ArrayList<GrantedAuthority>();
        if(roles!= null)  {
            for(String role: roles)  {
                // ROLE_USER, ROLE_ADMIN,..
                GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + role);
                grantList.add(authority);
            }
        }        
        
        UserDetails userDetails = (UserDetails) new User(customers.getUsername(), //
                customers.getPassword(),grantList);

        return userDetails;
    }
    
}