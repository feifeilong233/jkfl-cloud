<template>
  <div id="ExamRecordList">
    <a-card style="margin-top: 24px" :bordered="false" title="参加过的考试">
      <div slot="extra">
        <a-input-search style="margin-left: 16px; width: 272px" />
      </div>
      <a-list size="large">
        <a-list-item :key="index" v-for="(item, index) in examInfo">
          <a-list-item-meta :description="item.exam.examDescription">
            <!--            <a-avatar slot="avatar" size="large" shape="square" :src="item.exam.examAvatar | imgSrcFilter"/>-->
            <a slot="title">{{ item.exam.examSource }}</a>
          </a-list-item-meta>
          <div slot="actions">
            <div><a @click="viewExamRecordDetail(item.examRecord)">查看考试详情</a></div>
            <div><a @click="downloadAnswerPdf(item.examId)">下载试卷pdf</a></div>
          </div>
          <div class="list-content" style="justify-self: center; width: 36em">
            <div class="list-content-item" style="width: 10%">
              <span>昵称</span>
              <p>{{ item.user.userNickname }}</p>
            </div>
            <div class="list-content-item" style="width: 40%">
              <span>开始时间</span>
              <p>{{ item.examRecord.examJoinDate }}</p>
            </div>
            <div class="list-content-item" id="score-record" style="width: 40%">
              <div class="score-record-item">
                <span class="score-record-item-title">客观题分数</span>
                <span>{{ item.examRecord.examSubScore === -1 ? '待批阅' : item.examRecord.examJoinScore }}</span>
              </div>
              <div class="score-record-item">
                <span class="score-record-item-title">主观题分数</span>
                <span>{{ item.examRecord.examSubScore === -1 ? '待批阅' : item.examRecord.examSubScore }}</span>
              </div>
              <div class="score-record-item">
                <span class="score-record-item-title">总分</span>
                <span>{{
                  item.examRecord.examSubScore === -1
                    ? '待批阅'
                    : item.examRecord.examJoinScore + item.examRecord.examSubScore
                }}</span>
              </div>
            </div>
            <!-- <div class="list-content-item list-content-choice">
              <div><a @click="viewExamRecordDetail(item.examRecord)">查看考试详情</a></div>
              <div><a>下载pdf</a></div>
            </div> -->
          </div>
        </a-list-item>
      </a-list>
    </a-card>
  </div>
</template>

<script>
import HeadInfo from '../../components/tools/HeadInfo'
import { getExamRecordList, getExamPaper } from '../../api/exam'
import { axios } from '../../utils/request'
import download from 'downloadjs'

export default {
  // 考试记录列表，记录考生参加过地所有考试和考试成绩
  name: 'ExamRecordList',
  components: {
    HeadInfo,
  },
  data() {
    return {
      examInfo: {},
    }
  },
  methods: {
    /**
     * 根据考试记录的id拿到本次考试的详情并查看
     * @param record 考试详情的记录
     */
    viewExamRecordDetail(record) {
      // 直接跳到参加考试的页面，查看所有题目的详细情况
      const routeUrl = this.$router.resolve({
        path: `/exam/record/${record.examId}/${record.examRecordId}`,
      })
      // 和点击考试卡片效果一样，跳转到考试页面，里面有所有题目的情况，相当于就是详情了
      window.open(routeUrl.href, '_blank')
    },
    downloadAnswerPdf(examId) {
      getExamPaper(examId)
        .then((res) => {
          console.log(res.data);

          axios({
            method: 'POST',
            url: 'http://127.0.0.1:7919/api/getanswerpdf',
            data: {
              data: JSON.stringify(res.data)
            },
            responseType: 'blob',
          })
            .then((res) => {
              // console.log(res)
              download(new Blob([res]), 'test.pdf', 'application/pdf')
            })
            .catch((err) => console.log(err))
        })
        .catch((err) => console.log(err))
    },
  },
  mounted() {
    // 从后端数据获取考试列表，适配前端卡片
    getExamRecordList()
      .then((res) => {
        if (res.code === 0) {
          this.examInfo = res.data
          console.log(res.data)
        } else {
          this.$notification.error({
            message: '获取考试记录失败',
            description: res.msg,
          })
        }
      })
      .catch((err) => {
        // 失败就弹出警告消息
        this.$notification.error({
          message: '获取考试记录失败',
          description: err.message,
        })
      })
  },
}
</script>

<style lang="less" scoped>
#ExamRecordList {
  font-size: 16px;
}

.ant-avatar-lg {
  width: 16em;
  height: 16em;
  line-height: 16em;
}

.list-content {
  width: 30em;
  display: flex;
  justify-content: space-between;

  .list-content-item {
    color: rgba(0, 0, 0, 0.45);
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;

    span {
      line-height: 20px;
    }

    p {
      margin-top: 4px;
      margin-bottom: 0;
      line-height: 22px;
    }

    .score-record-item-title {
      display: inline-block;
      width: 6em;
    }

    &.list-content-info {
      justify-content: center;
    }
  }
}
</style>
