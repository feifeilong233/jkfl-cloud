package xion.boot.online.controller;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.web.bind.annotation.*;
import xion.boot.online.controller.form.TestSayHelloForm;
import xion.boot.online.utils.R;

import javax.validation.Valid;

@RestController
@RequestMapping("/test")
@Api("测试Web接口")
public class TestController {

    @PostMapping("/sayHello")
    @ApiOperation("基本测试 - 1")
    @RequiresPermissions(value = {"ROOT"})
    public R sayHello(@Valid @RequestBody TestSayHelloForm form){
        return R.ok().put("message", "Hello, " + form.getName());
    }

    @PostMapping("/addUser")
    @ApiOperation("添加用户")
    @RequiresPermissions(value = {"ROOT","B"},logical = Logical.OR)
    public R addUser(){
        return R.ok("用户添加成功");
    }

}
