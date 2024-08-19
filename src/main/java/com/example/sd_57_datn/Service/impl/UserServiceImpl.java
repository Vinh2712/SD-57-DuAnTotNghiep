package com.example.sd_57_datn.service.impl;


import com.example.sd_57_datn.model.User;

import java.util.UUID;

public interface UserServiceImpl {

    User findByEmail(String email);

    void update(UUID id, User update);


}
