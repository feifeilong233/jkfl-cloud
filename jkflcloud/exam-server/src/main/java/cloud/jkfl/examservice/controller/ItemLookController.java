package cloud.jkfl.examservice.controller;


import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.PaperLook;
import cloud.jkfl.examservice.service.impl.PaperLookServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/item_look")
public class ItemLookController {


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private PaperLookServiceImpl paperLookService;


    @ApiModelProperty(value = "得到试卷预览列表")
    @PostMapping("/paperList")
    public R getPaperList(@RequestHeader("Authorization") String token){

        boolean token1 = tokenFeignClient.token(token, 2);
        if (!token1)
            return R.error().message("登录信息失效！");

        List<PaperLook> list = paperLookService.list(null);

        return R.ok().data("data",list);
    }


}
