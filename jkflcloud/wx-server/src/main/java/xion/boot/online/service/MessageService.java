package xion.boot.online.service;

import xion.boot.online.entity.MessageEntity;
import xion.boot.online.entity.MessageRefEntity;
import xion.boot.online.pojo.TbMeeting;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface MessageService {

    public abstract String insertMessage(MessageEntity entity);

    public abstract List<HashMap> searchMessageByPage(int userId, long start, int length);

    public abstract HashMap searchMessageById(String id);

    public abstract String insertRef(MessageRefEntity entity);

    public abstract long searchUnreadCount(int userId);

    public abstract long searchLastCount(int userId);

    public abstract long updateUnreadMessage(String id);

    public abstract long deleteMessageRefById(String id);

    public abstract long deleteUserMessageRef(int userId);

}
