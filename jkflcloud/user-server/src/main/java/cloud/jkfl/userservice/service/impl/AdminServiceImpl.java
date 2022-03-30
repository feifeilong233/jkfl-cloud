package cloud.jkfl.userservice.service.impl;

import cloud.jkfl.userservice.mapper.AdminMapper;
import cloud.jkfl.userservice.pojo.Admin;
import cloud.jkfl.userservice.service.AdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements AdminService {
}
