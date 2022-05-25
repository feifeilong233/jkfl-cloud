package xion.boot.online.controller;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import xion.boot.online.config.shiro.JwtUtil;
import xion.boot.online.controller.form.SearchMeetingListByPageForm;
import xion.boot.online.service.Impl.MeetingServiceImpl;
import xion.boot.online.utils.R;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequestMapping("/meeting")
public class MeetingController {

    @Autowired
    private JwtUtil jwtUtil;

    @Autowired
    private MeetingServiceImpl meetingService;

    @PostMapping("/searchMeetingListByPage")
    @ApiOperation("查询会议列表分页数据")
    public R searchMeetingListByPage(@Valid @RequestBody SearchMeetingListByPageForm form,
                                     @RequestHeader("token") String token){
        int userId=jwtUtil.getUserId(token);
        //System.out.println(userId);
        int page=form.getPage();
        int length=form.getLength();
        long start= (long) (page - 1) *length;
        HashMap map=new HashMap<>();
        map.put("userId",userId);
        map.put("start",start);
        map.put("length",length);
        ArrayList list=meetingService.searchMeetingListByPage(map);
        return R.ok().put("result",list);
    }

}
