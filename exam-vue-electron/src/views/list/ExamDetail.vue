<template>
  <!-- eslint-disable -->
  <a-layout>
    <a-layout-header class="header" style="color: #fff; user-select: none; position: relative">
      <!--   v-if="examDetail.exam" 是为了防止 异步请求时页面渲染的时候还没有拿到这个值而报错， 下面多处这个判断都是这个道理 -->
      <span style="font-size: 25px; margin-left: 0px" v-if="examDetail.exam">
        <!--        <a-avatar slot="avatar" size="large" shape="circle" :src="examDetail.exam.examAvatar | imgSrcFilter"/>-->
        {{ examDetail.exam.examSource }}
        <span style="font-size: 15px">{{ examDetail.exam.examDescription }} </span>
      </span>
      <div id="monitor">
        <Monitor />
      </div>
      <span style="float: right">
        <span style="margin-right: 60px; font-size: 20px" v-if="examDetail.exam"
          >考试限时：{{ examDetail.exam.examTotalTime }}分钟 {{ remainingTimeStr }}</span
        >
        <a-button type="danger" ghost style="margin-right: 60px" @click="finishExam()" :loading="handInButtonLoading"
          >交卷</a-button
        >
        <a-avatar class="avatar" size="small" :src="avatar()" />
        <span style="margin-left: 12px">{{ nickname() }}</span>
      </span>
    </a-layout-header>
    <a-layout>
      <a-layout-sider
        width="220"
        :style="{ background: '#444', overflow: 'auto', height: '95vh', position: 'fixed', left: 0 }"
      >
        <a-menu
          mode="inline"
          :open-keys="openKeys"
          @openChange="onOpenChange"
          :defaultSelectedKeys="['1']"
          :defaultOpenKeys="['question_radio']"
          :style="{ height: '100%', borderRight: 0 }"
        >
          <a-sub-menu key="question_radio">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="check-circle" theme="twoTone" />单选题(每题{{ currentQuestion.sqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in examDetail.radioIds"
              :key="item"
              @click="getQuestionDetail(item, 1)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_check">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="check-square" theme="twoTone" />多选题(每题{{ currentQuestion.mqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in examDetail.checkIds"
              :key="item"
              @click="getQuestionDetail(item, 2)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_judge">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="like" theme="twoTone" />判断题(每题{{ currentQuestion.jqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in examDetail.judgeIds"
              :key="item"
              @click="getQuestionDetail(item, 3)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="answersMap.get(item)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_input">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="eye" theme="twoTone" />填空题(每题{{ currentQuestion.iqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in subDetail"
              :key="index"
              v-if="item.type === '填空题'"
              @click="getSubDetail(item)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="subMap.get(item.id)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_short_answer">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="eye" theme="twoTone" />简答题(每题{{ currentQuestion.saqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in subDetail"
              :key="index"
              v-if="item.type === '简答题'"
              @click="getSubDetail(item)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="subMap.get(item.id)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
          <a-sub-menu key="question_program">
            <span slot="title" v-if="examDetail.exam" style="user-select: none"
              ><a-icon type="eye" theme="twoTone" />程序题(每题{{ currentQuestion.pqScore }}分)</span
            >
            <a-menu-item
              v-for="(item, index) in subDetail"
              :key="index"
              v-if="item.type === '程序题'"
              @click="getSubDetail(item)"
              style="user-select: none"
            >
              <a-icon type="eye" theme="twoTone" twoToneColor="#52c41a" v-if="subMap.get(item.id)" />
              题目{{ index + 1 }}
            </a-menu-item>
          </a-sub-menu>
        </a-menu>
      </a-layout-sider>
      <a-layout :style="{ marginLeft: '230px' }">
        <a-layout-content id="questionContent" :style="{ margin: '24px 16px 0', height: '84vh', overflow: 'initial' }">
          <HighlighterBar
            :visible="highlighterBarDetail.visible"
            :enable="highlighterBarDetail.enable"
            @changeVisible="changeHighlighterBarVisible"
            @changeEnable="changeHighlighterBarEnable"
            @changeHighlighterStyle="changeHighlighterStyle"
          />
          <div :style="{ padding: '24px', background: '#fff', height: '84vh' }">
            <span v-show="currentQuestion === ''" style="font-size: 30px; font-family: Consolas; user-select: none"
              >欢迎参加考试，请点击左侧题目编号开始答题</span
            >
            <strong style="user-select: none">{{ currentQuestion.type }} </strong>
            <p v-html="currentQuestion.name"></p>
            <!-- 单选题和判断题 -->
            <!-- key不重复只需要在一个for循环中保证即可 -->
            <a-radio-group
              @change="onRadioChange"
              v-model="radioValue"
              v-if="currentQuestion.type === '单选题' || currentQuestion.type === '判断题'"
              style="user-select: none"
            >
              <a-radio
                v-for="option in currentQuestion.options"
                :key="option.questionOptionId"
                :style="optionStyle"
                :value="option.questionOptionId"
              >
                {{ option.questionOptionContent }}
              </a-radio>
            </a-radio-group>

            <!-- 多选题 -->
            <a-checkbox-group @change="onCheckChange" v-model="checkValues" v-if="currentQuestion.type === '多选题'">
              <a-checkbox
                v-for="option in currentQuestion.options"
                :key="option.questionOptionId"
                :style="optionStyle"
                :value="option.questionOptionId"
              >
                {{ option.questionOptionContent }}
              </a-checkbox>
            </a-checkbox-group>

            <!-- 填空和简答和程序题 -->
            <div
              v-if="
                currentQuestion.type === '填空题' ||
                currentQuestion.type === '简答题' ||
                currentQuestion.type === '程序题'
              "
            >
              <a-textarea placeholder="请输入答案" @change="OnInputChange" v-model="inputValue" />
              <!-- <a-button type="primary" @click="saveAnswer()">保存</a-button>-->
            </div>
          </div>
        </a-layout-content>
        <a-layout-footer :style="{ textAlign: 'center' }">
          <div class="copyright" style="user-select: none">
            Copyright
            <a-icon type="copyright" /> 2022 <span>jkfl</span>
          </div>
        </a-layout-footer>
      </a-layout>
    </a-layout>

    <!-- 开启笔记工具框的按钮 -->
    <HighlighterButton
      :highlighterBarIsVisible="highlighterBarDetail.visible"
      @changeHighlighterBarVisible="changeHighlighterBarVisible"
    />

    <!-- 考试工具开启按钮组 -->
    <ExamTools />
  </a-layout>
</template>

<script>
/* eslint-disable */
import { getExamDetail, getQuestionDetail, finishExam, getSubDetail, finishSub } from '../../api/exam'
import UserMenu from '../../components/tools/UserMenu'
import { mapGetters } from 'vuex'
// 高亮
import Highlighter from 'web-highlighter'
import HighlighterBar from '../highlighter/HighlighterBar'
import HighlighterButton from '../highlighter/HighlighterButton'
// 监考
import Monitor from '../monitor/Monitor'
// 考试工具
import ExamTools from '../examTools/ExamTools'

export default {
  name: 'ExamDetail',
  components: {
    UserMenu,
    HighlighterBar,
    HighlighterButton,
    Monitor,
    ExamTools,
  },
  data() {
    return {
      // 考试详情对象
      examDetail: {},
      // 剩余时间记录
      remainingTime: { hour: 0, minute: 0, second: 0 },
      // 交卷按钮loading (防止重复点击
      handInButtonLoading: false,
      // 高亮对象
      highlighter: new Highlighter({
        exceptSelectors: ['.ant-message span', '#examTools p'], // 主要防止 antd 的 message 提醒的文本被选中
      }),
      // 抽屉工具箱对象
      highlighterBarDetail: {
        visible: false,
        enable: false,
      },
      // 主观题详情对象
      subDetail: {},
      subMap: {},
      openKeys: ['question_radio'],
      rootSubmenuKeys: [
        'question_radio',
        'question_check',
        'question_judge',
        'question_input',
        'question_short_answer',
        'question_program',
      ],
      // 用户做过的问题都放到这个数组中，键为问题id, 值为currentQuestion(其属性answers属性用于存放答案选项地id或ids),，用于存放用户勾选的答案
      answersMap: {},
      // 当前用户的问题
      currentQuestion: '',
      // 单选或判断题的绑定值，用于从answersMap中初始化做题状态
      radioValue: '',
      // 多选题的绑定值，用于从answersMap中初始化做题状态
      checkValues: [],
      inputValue: '',
      optionStyle: {
        display: 'block',
        height: '30px',
        lineHeight: '30px',
        marginLeft: '0px',
      },
      onblurTime: 0,
      isFinished: false,
    }
  },
  mounted() {
    this.subMap = new Map()
    this.answersMap = new Map()
    const that = this
    // 从后端获取考试的详细信息，渲染到考试详情里
    getExamDetail(this.$route.params.id).then((res) => {
      if (res.code === 0) {
        // 赋值考试对象
        console.log(res)
        that.examDetail = res.data
        console.log('@examDetail', this.examDetail)
        this.initRemainingTime(this.examDetail.exam.examTotalTime)
        console.log('remainingTime@', that.remainingTime)
        that.initExam()  // 若考试界面失焦两次则自动交卷
        return res.data
      } else {
        this.$notification.error({
          message: '获取考试详情失败',
          description: res.msg,
        })
      }
    })
    getSubDetail(this.$route.params.id).then((res) => {
      if (res.code === 0) {
        // 赋值考试对象
        console.log(res)
        that.subDetail = res.data
        return res.data
      } else {
        this.$notification.error({
          message: '获取主观题详情失败',
          description: res.msg,
        })
      }
    })
    // 开倒计时定时器
    this.remainingTimer = setInterval(() => {
      this.remainingTime.second--
    }, 1000)
    // 运行文本高亮
    // this.highlighter = new Highlighter({
    //   // exceptSelectors: []
    // })
    // getRemoteData().then(s => highlighter.fromStore(s.startMeta, s.endMeta, s.id, s.text))
    // highlighter.on(Highlighter.event.CREATE, ({sources}) => save(sources))

    // 开启摄像头
  },
  methods: {
    initExam() {
      const that = this
      window.onblur = function () {
        that.onblurTime++
        if (!that.isFinished) {
          if (that.onblurTime === 3) {
            that.$notification.success({
              message: '你已交卷！',
            })
            that.finishExam()
          } else {
            that.$notification.error({
              message: '考试期间不能离开此页面哦~这一次只是提醒，下次离开就会直接交卷了哦！',
            })
          }
        }
      }
    },
    // 从全局变量中获取用户昵称和头像,
    ...mapGetters(['nickname', 'avatar']),
    getQuestionDetail(questionId, questionType) {
      // 问题切换时从后端拿到问题详情，渲染到前端content中
      const that = this
      // 清空问题绑定的值
      this.radioValue = ''
      this.checkValues = []
      getQuestionDetail(questionId, questionType).then((res) => {
        if (res.code === 0) {
          // 赋值当前考试对象
          that.currentQuestion = res.data
          // 查看用户是不是已经做过这道题又切换回来的，answersMap中查找，能找到这个题目id对应的值数组不为空说明用户做过这道题
          if (that.answersMap.get(that.currentQuestion.id)) {
            // 说明之前做过这道题了
            if (that.currentQuestion.type === '单选题' || that.currentQuestion.type === '判断题') {
              that.radioValue = that.answersMap.get(that.currentQuestion.id)[0]
            } else if (that.currentQuestion.type === '多选题') {
              // 数组是引用类型，因此需要进行拷贝，千万不要直接赋值
              Object.assign(that.checkValues, that.answersMap.get(that.currentQuestion.id))
            }
          }
          return res.data
        } else {
          this.$notification.error({
            message: '获取问题详情失败',
            description: res.msg,
          })
        }
      })
    },
    getSubDetail(sub) {
      const that = this
      that.inputValue = ''
      that.currentQuestion = sub
      // 查看用户是不是已经做过这道题又切换回来的，answersMap中查找，能找到这个题目id对应的值数组不为空说明用户做过这道题
      if (that.subMap.get(that.currentQuestion.id)) {
        that.inputValue = that.subMap.get(that.currentQuestion.id).answer
      }
      console.log(that.currentQuestion)
    },
    saveAnswer() {
      this.currentQuestion.answer = this.inputValue
      this.subMap.set(this.currentQuestion.id, this.currentQuestion)
      console.log(this.subMap)
    },
    OnInputChange(e) {
      this.currentQuestion.answer = this.inputValue
      this.subMap.set(this.currentQuestion.id, this.currentQuestion)
    },
    onOpenChange(openKeys) {
      const latestOpenKey = openKeys.find((key) => this.openKeys.indexOf(key) === -1)
      if (this.rootSubmenuKeys.indexOf(latestOpenKey) === -1) {
        this.openKeys = openKeys
      } else {
        this.openKeys = latestOpenKey ? [latestOpenKey] : []
      }
    },
    /**
     * 单选题勾选是触发的变化事件
     * @param e
     */
    onRadioChange(e) {
      const userOptions = []
      userOptions.push(e.target.value)
      // 更新做题者选择的答案
      this.answersMap.set(this.currentQuestion.id, userOptions)
    },
    /**
     * 多选题触发的变化事件
     * @param checkedValues
     */
    onCheckChange(checkedValues) {
      // 更新做题者选择的答案
      this.answersMap.set(this.currentQuestion.id, checkedValues)
    },
    _strMapToObj(strMap) {
      const obj = Object.create(null)
      for (const [k, v] of strMap) {
        obj[k] = v
      }
      return obj
    },
    /**
     *map转换为json
     */
    _mapToJson(map) {
      return JSON.stringify(this._strMapToObj(map))
    },
    /**
     * 结束考试并交卷
     */
    finishExam() {
      this.handInButtonLoading = true
      // Todo:向后端提交作答信息数组answersMap
      finishExam(this.$route.params.id, this._mapToJson(this.answersMap)).then((res) => {
        if (res.code === 0) {
          finishSub(res.data.examRecordId, this._mapToJson(this.subMap)).then((res) => {
            if (res.code === 0) {
              this.$notification.success({
                message: '考卷提交成功！',
                description: res.msg,
              })
              this.isFinished = true
              // 清除定时器
              clearInterval(this.remainingTimer)
              this.$router.push('/list/exam-record-list')
              return res.data
            } else {
              this.handInButtonLoading = false
              this.onblurTime = 0
              this.$notification.error({
                message: '交卷失败！',
                description: res.msg,
              })
            }
          })
          this.$notification.success({
            message: '考卷提交成功！',
            description: res.msg,
          })
          return res.data
        } else {
          this.onblurTime = 0
          this.$notification.error({
            message: '交卷失败！',
            description: res.msg,
          })
        }
      })
    },
    initRemainingTime(totalMinute) {
      this.remainingTime.hour = Math.floor(totalMinute / 60)
      this.remainingTime.minute = totalMinute % 60
    },

    /**
     * 高亮工具箱
     */
    // showHighlighterBar(isVisible) {
    //   this.highlighterBarDetail.visible = isVisible
    // },
    // closeHighlighterBar() {
    //   this.highlighterBarDetail.visible = false
    // },
    changeHighlighterBarVisible(value) {
      this.highlighterBarDetail.visible = value
    },
    changeHighlighterBarEnable() {
      this.highlighterBarDetail.enable = !this.highlighterBarDetail.enable
    },
    changeHighlighterStyle(className) {
      this.highlighter.painter.options.className = className
    },
  },
  computed: {
    // remainingTime: { minute: 0, second: 0 }
    remainingTimeStr() {
      const paddingZero = (num) => (num >= 10 ? num : `0${num}`)

      const { hour, minute, second } = this.remainingTime
      return `${paddingZero(hour)}:${paddingZero(minute)}:${paddingZero(second)}`
    },
  },
  watch: {
    remainingTime: {
      handler(newVal, oldVal) {
        const { hour, minute, second } = newVal

        if (hour == 0 && minute == 0 && second == 0) {
          return this.finishExam()
        }

        if (second < 0) {
          newVal.second = 59
          newVal.minute--
        }
        if (minute < 0) {
          newVal.minute = 59
          newVal.hour--
        }
        if (hour < 0) {
          newVal.hour = 23
        }
      },
      deep: true,
    },
    highlighterBarDetail: {
      handler(newVal, oldVal) {
        if (!this.highlighter) return

        if (newVal.enable) {
          this.highlighter.run()
        } else {
          this.highlighter.stop()
        }
      },
      deep: true,
      immediate: true,
    },
  },
  beforeRouteLeave(to, from, next) {
    this.highlighterBarDetail.enable = false
    next()
  },
  beforeDestroy() {
    clearInterval(this.remainingTimer)
  },
}
</script>

<style>
/* 引入高亮样式 */
@import '../highlighter/highlighterStyles.less';

#monitor {
  height: inherit;
  width: 100px;
  position: absolute;
  z-index: 99;
  top: 0px;
  left: 50%;
  transform: translate(-50%, 0);
}
</style>
