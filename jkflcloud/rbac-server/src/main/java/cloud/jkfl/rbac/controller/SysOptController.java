package cloud.jkfl.rbac.controller;

import cloud.jkfl.common.utils.LogInfoMsg;
import cloud.jkfl.common.utils.R;
import cloud.jkfl.rbac.pojo.Log;
import cloud.jkfl.rbac.pojo.vo.SysOptVO;
import cloud.jkfl.rbac.service.Impl.LogServiceImpl;
import cloud.jkfl.rbac.service.Impl.SysOptServiceImpl;
import cloud.jkfl.rbac.service.RootInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/back")
public class SysOptController {

    @Autowired
    private SysOptServiceImpl sysOptService;

    @Autowired
    private RootInfoService rootInfoService;

    @Autowired
    private LogServiceImpl logService;

    @PostMapping("getOptList")
    public R GetSysOptList(@RequestHeader("Authorization") String token){
        R rootByToken = rootInfoService.findRootByToken(token);

        Log log = new Log();
        log.setMsg(LogInfoMsg.SEARCH_SYSOPTLIST);
        logService.save(log);

        List<SysOptVO> sysOptList = sysOptService.getSysOptList();
        //System.out.println(sysOptList);

        return R.ok().data("list",sysOptList);


    }


}
