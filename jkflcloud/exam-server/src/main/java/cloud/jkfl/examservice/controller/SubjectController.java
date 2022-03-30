package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;


@CrossOrigin
@RestController
@RequestMapping("/exam")
public class SubjectController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @PostMapping("/subject_info")
    public R SubjectInfo(@RequestHeader("Authorization") String token){

        boolean token1 = tokenFeignClient.token(token, 2);

        if (token1){

            List<Map<String,Object>> list = new LinkedList<>();
            Map<String,Object> map = new HashMap<>();
            map.put("subjectid",1);
            map.put("subjectname","java");
            list.add(map);
            Map<String,Object> map1 = new HashMap<>();
            map1.put("subjectid",2);
            map1.put("subjectname","前端");
            list.add(map1);

            return R.ok().data("data",list);
        }else
            return R.ok().data("token",token1);
    }


}
