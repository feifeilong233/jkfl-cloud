package xion.boot.online.service.Impl;

import cn.hutool.core.date.DateField;
import cn.hutool.core.date.DateTime;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpResponse;
import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import cn.hutool.json.JSONUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import xion.boot.online.dao.TbMeetingDao;
import xion.boot.online.dao.TbUserDao;
import xion.boot.online.entity.MessageEntity;
import xion.boot.online.entity.MessageRefEntity;
import xion.boot.online.exception.EmosException;
import xion.boot.online.pojo.TbMeeting;
import xion.boot.online.repository.MessageDao;
import xion.boot.online.repository.MessageRefDao;
import xion.boot.online.service.MessageService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
@Slf4j
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageDao messageDao;

    @Autowired
    private MessageRefDao messageRefDao;

    @Override
    public String insertMessage(MessageEntity entity) {
        String id=messageDao.insert(entity);
        return id;
    }

    @Override
    public List<HashMap> searchMessageByPage(int userId, long start, int length) {
        List<HashMap> list=messageDao.searchMessageByPage(userId,start,length);
        return list;
    }

    @Override
    public HashMap searchMessageById(String id) {
        HashMap map=messageDao.searchMessageById(id);
        return map;
    }

    @Override
    public String insertRef(MessageRefEntity entity) {
        String id=messageRefDao.insert(entity);
        return id;
    }

    @Override
    public long searchUnreadCount(int userId) {
        long count=messageRefDao.searchUnreadCount(userId);
        return count;
    }

    @Override
    public long searchLastCount(int userId) {
        long count=messageRefDao.searchLastCount(userId);
        return count;
    }

    @Override
    public long updateUnreadMessage(String id) {
        long rows=messageRefDao.updateUnreadMessage(id);
        return rows;
    }

    @Override
    public long deleteMessageRefById(String id) {
        long rows=messageRefDao.deleteMessageRefById(id);
        return rows;
    }

    @Override
    public long deleteUserMessageRef(int userId) {
        long rows=messageRefDao.deleteUserMessageRef(userId);
        return rows;
    }
}
