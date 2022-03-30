package cloud.jkfl.examservice.fegin;

import cloud.jkfl.examservice.pojo.vo.ReadVo;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@FeignClient("user-service")
public interface TokenFeignClient {

    @RequestMapping(value = "/usr/token", method = RequestMethod.GET)
    public boolean token(@RequestParam("token") String token,@RequestParam("type") Integer type);

    @RequestMapping(value = "/tea/token", method = RequestMethod.GET)
    public String teacherWithToken(@RequestParam("token") String token);


    @RequestMapping(value = "/class/feignClass",method = RequestMethod.GET)
    public Map<Long,String> feignClass();

    @RequestMapping(value = "/class/feginClassWithTea",method = RequestMethod.GET)
    public Map<Long, String> feginClassWithTea(@RequestParam("id") Long id);

    @RequestMapping(value = "/tea/tokenForId",method = RequestMethod.GET)
    public Long TokenForId(@RequestParam("token") String token);

    @RequestMapping(value = "/stu/returnVoWithIds", method = RequestMethod.GET)
    public List<ReadVo> ReturnVoWithIds(@RequestParam Map<String, String> ids);


    @RequestMapping(value = "/stu/returnIdWithPid", method = RequestMethod.GET)
    public String ReturnIdWithPid(@RequestParam("pid") String _pid);


    @RequestMapping(value = "/stu/returnNicknameWithId", method = RequestMethod.GET)
    public String ReturnNicknameWithId(@RequestParam("id") String id);
}
