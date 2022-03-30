package cloud.jkfl.userservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.userservice.pojo.Admin;
import cloud.jkfl.userservice.service.AdminService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("admin")
public class AdminController {


    @Autowired
    private AdminService adminService;


    @ApiModelProperty(value = "查询全部")
    @GetMapping("list")
    public R findAll(){
        List<Admin> list = adminService.list(null);
        return R.ok().data("list",list);
    }


    @ApiModelProperty(value = "根据Id查找admin")
    @GetMapping("getById/{id}")
    public R getAdminById(@PathVariable("id") Long id){
        Admin byId = adminService.getById(id);
        return R.ok().data("adminWithId",byId);
    }


    @ApiModelProperty(value = "根据Id删除Admin")
    @DeleteMapping("del/{id}")
    public R delAdminById(@PathVariable("id") Long id){
        boolean b = adminService.removeById(id);
        if (b)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "修改Admin")
    @PostMapping("update")
    public R updateAdmin(@RequestBody Admin admin){
        boolean b = adminService.updateById(admin);
        if (b)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "添加admin")
    @PostMapping("add")
    public R add(@RequestBody Admin admin){
        boolean save = adminService.save(admin);
        if (save)
            return R.ok();
        else
            return R.error();
    }


    @ApiModelProperty(value = "分页查询admin")
    @PostMapping("getByPage/{current}/{limit}")
    public R getAdminByPage(@PathVariable("current") Long current,
                            @PathVariable("limit") Long limit){
        Page<Admin> page = new Page<>(current, limit);
        adminService.page(page, null);
        List<Admin> records = page.getRecords();
        long total = page.getTotal();
        return R.ok().data("list",records).data("total",total);

    }

}
