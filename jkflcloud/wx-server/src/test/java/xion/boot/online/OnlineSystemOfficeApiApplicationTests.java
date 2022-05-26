package xion.boot.online;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.IdUtil;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import xion.boot.online.entity.MessageEntity;
import xion.boot.online.entity.MessageRefEntity;
import xion.boot.online.pojo.TbMeeting;
import xion.boot.online.service.Impl.MeetingServiceImpl;
import xion.boot.online.service.Impl.MessageServiceImpl;


import java.util.Date;

@SpringBootTest
class OnlineSystemOfficeApiApplicationTests {

    @Autowired
    private MeetingServiceImpl meetingService;

    @Autowired
    private MessageServiceImpl messageService;

    @Test
    void createMeetingData() {
        for (int i = 1;i <= 100; i++){
            TbMeeting meeting=new TbMeeting();
            meeting.setId((long)i);
            meeting.setUuid(IdUtil.simpleUUID());
            meeting.setTitle("测试会议"+i);
            meeting.setCreatorId(12L); //ROOT用户ID
            meeting.setDate(DateUtil.today());
            meeting.setPlace("线上会议室");
            meeting.setStart("08:30");
            meeting.setEnd("10:30");
            meeting.setType((short) 1);
            meeting.setMembers("[12,15,16]");
            meeting.setDesc("会议研讨Emos项目上线测试");
            meeting.setInstanceId(IdUtil.simpleUUID());
            meeting.setStatus((short)3);
            meetingService.insertMeeting(meeting);
        }
    }

    @Test
    void contextLoads() {
        for (int i = 1; i <= 100; i++) {
            MessageEntity message = new MessageEntity();
            message.setUuid(IdUtil.simpleUUID());
            message.setSenderId(0);
            message.setSenderName("系统消息");
            message.setMsg("这是第" + i + "条测试消息");
            message.setSendTime(new Date());
            String id=messageService.insertMessage(message);

            MessageRefEntity ref=new MessageRefEntity();
            ref.setMessageId(id);
            ref.setReceiverId(11); //接收人ID
            ref.setLastFlag(true);
            ref.setReadFlag(false);
            messageService.insertRef(ref);
        }
    }

}
