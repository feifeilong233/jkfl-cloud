exam-server服务

考试管理服务，具体对应教师端的各类操作，支持教师端的增删查改，
考试的发布，试题录入，监考批卷等功能。

src/main.java.cloud/jkfl/examservice

    constant保存常用变量：
     - PaperConstant 保存试卷的Id

    controller层为试图控制层：
     - AnswerController 答案控制层
     - CheckinController 知识点控制层
     - ExamManageController 考试管理控制层
     - InputQuestionController 填空题控制层
     - ItemController 试题控制层，6类题型的上层封装
     - ItemLookController 试题预览控制层，Item的上层封装层，提供了Item的预览功能
     - JudgeQuestionController 判断题控制层
     - MultipleQuestionController 多选题控制层
     - PaperManageController 试卷控制层
     - ProgramQuestionController 编程题控制层
     - ReadController 阅卷控制层
     - ScoreController 得分控制层
     - SelectQuestionController 选择控制层
     - ShortAnswerController 简答题控制层
     - SubjectController 学科控制层

    feign层是openfeign调用层，在这里调用其余微服务的函数：
     - TokenFeignClient 调用user-server中的函数，实现token认证、用户基本信息查询等功能

    mapper是具体的数据库映射层：
     - AnswerMapper 答案映射
     - CheckinMapper 知识点映射
     - ExamManageMapper 考试管理映射
     - ExamRecordMapper 考卷映射
     - InputQuestionMapper 填空题映射
     - JudgeQuestionMapper 判断题映射
     - MultipleQuestionMapper 多选题映射
     - PaperLookMapper 试卷预览映射
     - PaperManageMapper 试卷管理映射
     - ProgramQuestionMapper 程序题映射
     - ScoreMapper 得分映射
     - SelectQuestionMapper 选择题映射
     - ShortAnswerQuestionMapper 简答题映射

    pojo层是对应数据库的具体实体类；
     - Checkin 知识点，对应checkin
     - ExamManage 考试管理，对应exam_manage
     - ExamRecord 考卷管理，对应exam_record
     - InputQuestion 填空题，对应input_question
     - JudgeQuestion 判断题，对应judge_question
     - MultipleQuestion 多选题，对应multiple_question
     - PaperLook 试卷预览，对应paper_look
     - PaperManage 试卷管理，对应paper_manage
     - ProgramQuestion 程序管理，对应program_question
     - Score 得分，对应score
     - SelectQuestion 选择，对应select_question
     - ShortAnswerQuestion 简答，对应short_answer_question

    pojo中vo层是查询数据库的具体封装：
     - AnswerQuery 答案查询
     - ExamVo 考试查询
     - InputQuestionVo 填空查询
     - InputVo 填空查询，喝InputQuestionVo进行区分，查询不同的业务
     - ItemManualQuery 手动输入试题查询
     - ItemQuery 自动录入试题查询
     - JudgeQuestionVo 判断题查询
     - JudgeVo 其余业务判断题查询
     - MultipleQuestionVo 多选题查询
     - MultipleVo 多选题查询
     - ProgramQuestionVo 程序题查询
     - ProgramVo 程序题查询
     - ReadVo 阅卷查询
     - ScoreVo 得分查询
     - SelectQuestionVo 选择题查询
     - SelectVo 选择题查询
     - ShortAnswerQuestionVo 简答题查询
     - ShortAnswerVo 简答题查询

    service和其包下impl包中分别存放具体逻辑业务的接口和实现函数，
    由于service和impl包中函数一一对应，这里只介绍impl中的实现函数：
     - AnswerServiceImpl 答案业务
     - CheckinServiceImpl 知识点业务
     - ExamManageServiceImpl 考试管理业务
     - ExamRecordServiceImpl 阅卷业务
     - InputQuestionServiceImpl 填空题业务
     - JudgeQuestionServiceImpl 判断题业务
     - MultipleQuestionServiceImpl 多选题业务
     - PaperLookServiceImpl 试卷预览业务
     - PaperManageServiceImpl 试卷管理业务
     - ProgramQuestionServiceImpl 程序题业务
     - ScoreServiceImpl 得分业务
     - SelectQuestionServiceImpl 选择题业务
     - ShortAnswerQuestionServiceImpl 简答题业务

    主文件夹下ExamServiceApplication为启动类

/src/main/resources下application.yaml为配置类