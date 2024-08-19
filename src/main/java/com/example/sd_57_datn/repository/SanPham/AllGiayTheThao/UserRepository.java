package com.example.sd_57_datn.repository.SanPham.AllGiayTheThao;

import com.example.sd_57_datn.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface UserRepository extends JpaRepository<User, UUID> {

    List<User> findByTenUserContainingOrderById(String tenUser);
    @Query("SELECT u FROM User u WHERE CAST(u.trangThai AS string) LIKE %:trangThai% ORDER BY u.id")
    List<User> findByTrangThaiContainingOrderById(@Param("trangThai") String trangThai);

//    List<User> findByTrangThaiContainingOrderById (Integer trangThai);

    //Todo code đăng nhập

    User findByEmailAndAndMatKhau(String email,String matKhau);

    //Todo code finde email

    @Query("select p from User p where p.email= ?1")
    User findByEmail(String email);


}
