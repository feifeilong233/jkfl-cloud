package cloud.jkfl.rbac.service.Impl;

import cloud.jkfl.rbac.mapper.SysAcademyMapper;
import cloud.jkfl.rbac.mapper.SysSchoolMapper;
import cloud.jkfl.rbac.pojo.Academy;
import cloud.jkfl.rbac.pojo.School;
import cloud.jkfl.rbac.pojo.vo.SysOptChildVO;
import cloud.jkfl.rbac.pojo.vo.SysOptVO;
import cloud.jkfl.rbac.service.SysOptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SysOptServiceImpl implements SysOptService {

    @Autowired
    private SysSchoolMapper sysSchoolMapper;

    @Autowired
    private SysAcademyMapper sysAcademyMapper;


    @Override
    public List<SysOptVO> getSysOptList() {

        List<SysOptVO> sysOptVOS = new ArrayList<>();

        List<School> schools = sysSchoolMapper.selectList(null);
        List<Academy> academies = sysAcademyMapper.selectList(null);

        for (School i: schools){
            SysOptVO vo = new SysOptVO();
            vo.setId(i.getSchoolId());
            vo.setTitle(i.getSchoolTitle());
            vo.setCreateTime(i.getCreateTime());
            vo.setUpdateTime(i.getUpdateTime());
            vo.setPid(i.getSchoolPid());
            vo.setKey(i.getSchoolKey());

            List<SysOptChildVO> childVOList = new ArrayList<>();
            for (Academy j: academies){
                if (j.getAcademySchoolId().equals(i.getSchoolId())){
                    SysOptChildVO child = new SysOptChildVO();
                    child.setId(j.getAcademyId());
                    child.setTitle(j.getAcademyTitle());
                    child.setCreateTime(j.getCreateTime());
                    child.setUpdateTime(j.getUpdateTime());
                    child.setPid(j.getAcademyPid());
                    child.setKey(j.getAcademyKey());
                    childVOList.add(child);
                }
            }
            vo.setChildren(childVOList);

            sysOptVOS.add(vo);
        }

        return sysOptVOS;
    }
}
