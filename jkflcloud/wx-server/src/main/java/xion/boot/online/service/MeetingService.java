package xion.boot.online.service;

import xion.boot.online.pojo.TbMeeting;

import java.util.ArrayList;
import java.util.HashMap;

public interface MeetingService {

    public abstract void insertMeeting(TbMeeting entity);

    public abstract ArrayList<HashMap> searchMeetingListByPage(HashMap param);

}
