package xion.boot.online.controller;

import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.json.JSONUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import xion.boot.online.config.shiro.JwtUtil;
import xion.boot.online.controller.form.LoginForm;
import xion.boot.online.controller.form.RegisterForm;
import xion.boot.online.controller.form.SearchMembersForm;
import xion.boot.online.controller.form.SearchUserGroupByDeptForm;
import xion.boot.online.exception.EmosException;
import xion.boot.online.service.Impl.UserServiceImpl;
import xion.boot.online.utils.R;

import javax.validation.Valid;
import java.util.*;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/user")
@Api("微信小程序用户模块Web接口")
public class UserController {


    @Autowired
    private UserServiceImpl userService;


    @Autowired
    private JwtUtil jwtUtil;


    @Autowired
    private RedisTemplate redisTemplate;


    @Value("${emos.jwt.cache-expire}")
    private int cacheExpire;


    @PostMapping("/register")
    @ApiOperation("注册用户")
    public R register(@Valid @RequestBody RegisterForm registerForm){
        int userId = userService.registerUser(
                registerForm.getRegisterCode(),
                registerForm.getCode(),
                registerForm.getNickname(),
                registerForm.getPhoto());

        String token = jwtUtil.createToken(userId);
        Set<String> paramSet = userService.searchUserPermissions(userId);
        saveCacheToken(token, userId);
        return R.ok("用户注册成功").put("token", token).put("permission", paramSet);
    }


    @PostMapping("/login")
    @ApiOperation("登陆")
    public R login(@Valid @RequestBody LoginForm loginform){
        int id = userService.login(loginform.getCode());
        String token = jwtUtil.createToken(id);
        saveCacheToken(token, id);
        Set<String> permsSet = userService.searchUserPermissions(id);
        return R.ok("登陆成功").put("token", token).put("permissions", permsSet);
    }


    @PostMapping("/searchUserGroupByDept")
    @ApiOperation("查询员工列表，按照部分分组排列")
    @RequiresPermissions(value={"ROOT","EMPLOYEE:SELECT"},logical = Logical.OR)
    public R searchUserGroupByDept(@Valid @RequestBody SearchUserGroupByDeptForm form){
        ArrayList<HashMap> list = userService.searchUserGroupByDept(form.getKeyword());
        return R.ok().put("result", list);

    }


    @PostMapping("/searchMembers")
    @ApiOperation("查询成员")
    @RequiresPermissions(value={"ROOT","MEETING:INSERT","MEETING:UPDATE"},logical = Logical.OR)
    public R searchMembers(@Valid @RequestBody SearchMembersForm form){
        if (!JSONUtil.isJsonArray(form.getNumber())){
            throw new EmosException("members不是JSON数组");
        }
        List param = JSONUtil.parseArray(form.getNumber()).toList(Integer.class);
        ArrayList list = userService.searchMembers(param);
        return R.ok().put("result", list);
    }


    @GetMapping("/searchUserSummary")
    @ApiOperation("查询用户摘要信息")
    public R searchUserSummary(@RequestHeader("token") String token){
        int userId=jwtUtil.getUserId(token);
        HashMap map=userService.searchUserSummary(userId);
        return R.ok().put("result",map);
    }



    private void saveCacheToken(String token, int userId){
        redisTemplate.opsForValue().set(token, userId+"", cacheExpire, TimeUnit.DAYS);
    }


}
