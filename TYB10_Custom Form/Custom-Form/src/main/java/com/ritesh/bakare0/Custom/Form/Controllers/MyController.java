package com.ritesh.bakare0.Custom.Form.Controllers;

import com.ritesh.bakare0.Custom.Form.models.Data;
import com.ritesh.bakare0.Custom.Form.repository.DataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping("/demo")
public class MyController {

    @Autowired
    private DataRepository dataRepository;

//    @GetMapping
//    public String greet() {
//        return "Hello World ";
//    }

    @GetMapping
    public List<Data> getAllUser() {
        return dataRepository.findAll();
    }

    @PostMapping
    public Data createEntry(@RequestBody Data data) {
        return dataRepository.save(data);
    }

}
