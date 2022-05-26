package xion.boot.online.dao;

import org.apache.ibatis.annotations.Mapper;
import xion.boot.online.pojo.TbMeeting;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface TbMeetingDao {

    public abstract int insertMeeting(TbMeeting tbMeeting);

    public abstract ArrayList<HashMap> searchMyMeetingListByPage(HashMap param);
}