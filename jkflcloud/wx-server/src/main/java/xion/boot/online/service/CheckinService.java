package xion.boot.online.service;

import java.util.ArrayList;
import java.util.HashMap;

public interface CheckinService {

    public abstract String validCanCheckIn(int userId, String date);

    public abstract void checkin(HashMap map);

    public abstract void createFaceModel(int userId, String path);

    public abstract HashMap searchTodayCheckin(int userId);

    public abstract long searchCheckinDays(int userId);

    public abstract ArrayList<HashMap> searchWeekCheckin(HashMap param);

    public abstract ArrayList<HashMap> searchMonthCheckin(HashMap param);

}
