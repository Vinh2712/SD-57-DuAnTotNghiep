package com.example.sd_57_datn.Service.impl;



import com.example.sd_57_datn.Model.User;

import java.util.UUID;

public interface UserServiceImpl {

    User findByEmail(String email);

    void update(UUID id, User update);


}
