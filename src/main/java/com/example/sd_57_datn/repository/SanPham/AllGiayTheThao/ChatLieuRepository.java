package com.example.sd_57_datn.repository.SanPham.AllGiayTheThao;

import com.example.sd_57_datn.model.ChatLieu;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface ChatLieuRepository extends JpaRepository<ChatLieu, UUID> {

    List<ChatLieu> findByTenChatLieuContainingOrderById(String tenChatLieu);

}
