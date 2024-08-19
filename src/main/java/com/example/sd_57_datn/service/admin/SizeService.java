package com.example.sd_57_datn.service.admin;



import com.example.sd_57_datn.model.GiayTheThao;
import com.example.sd_57_datn.model.Size;
import com.example.sd_57_datn.repository.SanPham.AllGiayTheThao.SizeRepository;
import com.example.sd_57_datn.service.GiayTheThao.GiayTheThaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class SizeService {

    @Autowired
    private SizeRepository sizeRepository;
    @Autowired
    private GiayTheThaoService gttService;


    public List<Size> getAll() {
        return sizeRepository.findAll();
    }

    public Size getOne(UUID id) {
        return sizeRepository.findById(id).orElse(null);
    }

    public void save(Size size) {
        this.sizeRepository.save(size);
    }

    public void delete(UUID id) {
        this.sizeRepository.deleteById(id);
    }

    public List<Size> getAllByIdGtt(UUID idGtt) {
        GiayTheThao gtt = gttService.getOne(idGtt);
        return sizeRepository.getSizeByGtt(gtt);
    }

}
