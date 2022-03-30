package cloud.jkfl.examservice.controller;

import cloud.jkfl.common.utils.R;
import cloud.jkfl.examservice.fegin.TokenFeignClient;
import cloud.jkfl.examservice.pojo.PaperLook;
import cloud.jkfl.examservice.pojo.PaperManage;
import cloud.jkfl.examservice.pojo.vo.*;
import cloud.jkfl.examservice.service.InputQuestionService;
import cloud.jkfl.examservice.service.JudgeQuestionService;
import cloud.jkfl.examservice.service.PaperManageService;
import cloud.jkfl.examservice.service.SelectQuestionService;
import cloud.jkfl.examservice.service.impl.MultipleQuestionServiceImpl;
import cloud.jkfl.examservice.service.impl.PaperLookServiceImpl;
import cloud.jkfl.examservice.service.impl.ProgramQuestionServiceImpl;
import cloud.jkfl.examservice.service.impl.ShortAnswerQuestionServiceImpl;
import io.swagger.annotations.ApiModelProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

import static cloud.jkfl.examservice.constant.PaperConstant.paper_id;

/**
 * 组卷
 */
@CrossOrigin
@RestController
@RequestMapping("/item")
public class ItemController {


    @Autowired
    private SelectQuestionService selectQuestionService;


    @Autowired
    private InputQuestionService inputQuestionService;


    @Autowired
    private JudgeQuestionService judgeQuestionService;


    @Autowired
    private PaperManageService paperManageService;


    @Autowired
    private MultipleQuestionServiceImpl multipleQuestionService;


    @Autowired
    private ShortAnswerQuestionServiceImpl shortAnswerQuestionService;


    @Autowired
    private ProgramQuestionServiceImpl programQuestionService;


    @Autowired
    private TokenFeignClient tokenFeignClient;


    @Autowired
    private PaperLookServiceImpl paperLookService;


    /**
     * 类型 1=选择 2=填空 3=判断 4=多选 5=简答 6=程序
     *
     * @param itemQuery
     * @return
     */
    @ApiModelProperty(value = "组卷")
    @PostMapping("/create")
    public R createExam(@RequestHeader("Authorization")String token,
                        @RequestBody ItemQuery itemQuery){
        //System.out.println(itemQuery);


        String name = tokenFeignClient.teacherWithToken(token);
        if (name.equals("None"))
            return R.error().message("登录信息失效");


        //试卷id
        //Long paperId = itemQuery.getPaperId();
        Long paperId = paper_id;
        /**
         * 先插入paper_look，
         * 如果如果paperLook插入失败，则组卷失败，
         * 如果paperLook插入成功但是底下失败，则可以在列表中显示paperId，届时错误组卷可以手动删除，
         * 如果paperLook在组卷之后，发生错误则会导致组卷成功，但是在数据库中无法取出来。
         */
        String title = itemQuery.getTitle();
        Integer total = itemQuery.getTotal();
        Integer time = Integer.parseInt(itemQuery.getTime());
        PaperLook paperLook = new PaperLook();
        paperLook.setPaperId(paper_id);
        paperLook.setPaperLookTitle(title);
        paperLook.setPaperLookTime(time);
        paperLook.setPaperLookScore(total);
        paperLook.setPaperTeacherName(name);
        boolean save1 = paperLookService.save(paperLook);
        if (!save1)
            return R.ok().message("创建试卷失败！");


        //System.out.println(itemQuery);
        List<SelectVo> selectQuestionList = itemQuery.getSelectList();
        List<InputVo> inputQuestionList = itemQuery.getInputList();
        List<JudgeVo> judgeQuestionList = itemQuery.getJudgeList();
        List<MultipleVo> multipleQuestionList = itemQuery.getMultipleList();
        List<ShortAnswerVo> shortAnswerQuestionList = itemQuery.getShortAnswerList();
        List<ProgramVo> programQuestionList = itemQuery.getProgramList();


        //选择组卷
        for (SelectVo item : selectQuestionList){
            List<Long> selectList = selectQuestionService.findBySubject(item.getSqSubject(), item.getSqNumber());
            if (selectList == null)
                return R.error().message("选择题库获取失败");
            for(Long number: selectList){
                PaperManage paperManage = new PaperManage(paperId, 1, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("选择题组卷保存失败");
            }
        }


        //填空组卷
        for (InputVo item : inputQuestionList){
            List<Long> inputList = inputQuestionService.findBySubject(item.getIqSubject(), item.getIqNumber());
            if (inputList==null)
                return R.error().message("填空题库获取失败");
            for (Long number : inputList){
                PaperManage paperManage = new PaperManage(paperId, 4, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("填空题组卷失败");
            }
        }


        //判断组卷
        for (JudgeVo item : judgeQuestionList){
            List<Long> judgeList = judgeQuestionService.findBySubject(item.getJqSubject(), item.getJqNumber());
            if (judgeList==null)
                return R.error().message("判断题库获取失败");
            for (Long number : judgeList){
                PaperManage paperManage = new PaperManage(paperId, 3, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("判断题组卷失败");
            }
        }


        //多选组卷
        for (MultipleVo item : multipleQuestionList){
            List<Long> multipleList = multipleQuestionService.findBySubject(item.getMqSubject(), item.getMqNumber());
            if (multipleList == null)
                return R.error().message("多选题库获取失败");
            for (Long number : multipleList){
                PaperManage paperManage = new PaperManage(paperId, 2, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("多选题组卷失败");
            }
        }


        //简答组卷
        for (ShortAnswerVo item : shortAnswerQuestionList){
            List<Long> shortAnswerList = shortAnswerQuestionService.findBySubject(item.getSaqSubject(), item.getSaqNumber());
            if (shortAnswerList == null)
                return R.error().message("简答题库获取失败");
            for (Long number : shortAnswerList){
                PaperManage paperManage = new PaperManage(paperId, 5, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("简答题组卷失败");
            }
        }


        //程序组卷
        for (ProgramVo item : programQuestionList){
            List<Long> programList = programQuestionService.findBySubject(item.getPgSubject(),item.getPqNumber());
            if (programList == null)
                return R.error().message("程序题库获取失败");
            for (Long number : programList){
                PaperManage paperManage = new PaperManage(paperId, 6, number);
                boolean save = paperManageService.save(paperManage);
                if (!save)
                    return R.error().message("程序题组卷失败");
            }
        }
        paper_id += 1;

        return R.ok().message("组卷成功 !!!");
    }


    @ApiModelProperty(value = "手动组卷")
    @PostMapping("/manual")
    public R createExamManual(@RequestHeader("Authorization")String token,
                              @RequestBody ItemManualQuery itemManualQuery){

        String name = tokenFeignClient.teacherWithToken(token);
        if (name.equals("None"))
            return R.ok().message("Info");

        Long paperId = paper_id;

        String title = itemManualQuery.getTitle();
        Integer total = itemManualQuery.getTotal();
        Integer time = Integer.parseInt(itemManualQuery.getTime());

        PaperLook paperLook = new PaperLook();
        paperLook.setPaperId(paper_id);
        paperLook.setPaperLookTitle(title);
        paperLook.setPaperLookTime(time);
        paperLook.setPaperLookScore(total);
        paperLook.setPaperTeacherName(name);
        boolean save1 = paperLookService.save(paperLook);
        if (!save1)
            return R.ok().message("Fail");


        List<Long> sqIdList = itemManualQuery.getSqList();
        List<Long> mqIdList = itemManualQuery.getMqList();
        List<Long> jqIdList = itemManualQuery.getJqList();
        List<Long> iqIdList = itemManualQuery.getIqList();
        List<Long> saqIdList = itemManualQuery.getSaqList();
        List<Long> pqIdList = itemManualQuery.getPqList();

        //单选题
        for (Long item : sqIdList){
            PaperManage paperManage = new PaperManage(paperId, 1, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }

        for (Long item : mqIdList){
            PaperManage paperManage = new PaperManage(paperId, 2, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }

        for (Long item : jqIdList){
            PaperManage paperManage = new PaperManage(paperId, 3, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }

        for (Long item : iqIdList){
            PaperManage paperManage = new PaperManage(paperId, 4, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }

        for (Long item : saqIdList){
            PaperManage paperManage = new PaperManage(paperId, 5, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }

        for (Long item : pqIdList){
            PaperManage paperManage = new PaperManage(paperId, 6, item);
            boolean save = paperManageService.save(paperManage);
            if (!save)
                return R.ok().message("Fail");
        }
        paper_id += 1;

        return R.ok().message("Success");

    }

}
