package com.example.sd_57_datn.service.admin;



import com.example.sd_57_datn.model.Form;
import com.example.sd_57_datn.repository.SanPham.AllGiayTheThao.FormRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
public class FormService {
    @Autowired
    private FormRepository formRepository;

    public List<Form> getAll() {
        return formRepository.findAll();
    }

    public Form getOne(UUID id) {
        return formRepository.findById(id).orElse(null);
    }

    public void save(Form form) {
        this.formRepository.save(form);
    }

    public void delete(UUID id) {
        this.formRepository.deleteById(id);
    }

    public List<Form> searchByTen(String tenForm) {
        return formRepository.findByTenFormContainingOrderById(tenForm);
    }

}
