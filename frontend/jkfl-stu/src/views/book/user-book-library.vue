<template>
  <!-- eslint-disable -->
  <div id="user-book-library">
    <el-container>
      <div style="width: 100%">
        <div>
          <el-row id="tool-bar" justify="space-between">
            <el-col :span="4" class="tool-bar-myFavorites"> 我的收藏 </el-col>

            <el-col :span="5">
              <el-button size="median" @click="bindPublishBookBtn">资料开源</el-button>
              <el-button size="median" @click="bindGoToMarketBtn">前往市场</el-button>
            </el-col>

            <el-col :span="15">
              <el-button size="median" style="margin-left: 15px; margin-right: 10px" @click="handleFindAllBookBtn"
                >查看全部</el-button
              >

              <el-select
                v-model="value"
                placeholder="请选择"
                style="width: 20%; margin-right: 10px"
                size="medium"
                clearable
              >
                <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value">
                </el-option>
              </el-select>

              <el-input
                v-model="input"
                placeholder="请输入内容"
                size="medium"
                style="width: 40%; margin-right: 10px"
                clearable
              ></el-input>

              <el-button size="medium" @click="handleSearchBtn">搜索</el-button>
            </el-col>
          </el-row>
        </div>

        <el-row style="text-align: center">
          <el-col class="xiOn-card-item" :span="6" v-for="(item, index) in bookList" :key="index">
            <div class="xiOn-card-wrapper">
              <el-card :body-style="{ padding: '0px' }" shadow="hover">
                <div class="xiOn-img-wrapper">
                  <img
                    src="https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png"
                    class="image"
                    @click="handleReadBtn(item.novelId, item.novelType)"
                  />
                </div>
                <div style="padding: 14px">
                  <p class="card-book-title" :title="item.title">{{ item.novelTitle }}</p>

                  <div class="card-book-infos">
                    <div class="card-book-info">
                      <span class="card-book-info-title">格式: </span>
                      <span class="card-book-info-content">{{ item.novelFormat }}</span>
                    </div>
                    <div class="card-book-info">
                      <span class="card-book-info-title">种类: </span>
                      <span class="card-book-info-content">{{ item.novelType }}</span>
                    </div>
                  </div>

                  <div class="bottom clearfix">
                    <el-button type="text" class="button" @click="handleReadBtn(item.novelId, item.novelType)"
                      >在线阅读</el-button
                    >
                    <el-button type="text" class="button">文本下载</el-button>
                  </div>
                </div>
              </el-card>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-container>

    <el-dialog title="资料开源" :visible.sync="dialogPublishVisible" width="80%">
      <div style="margin-left: 12vw; margin-bottom: 5vh">
        <el-upload action="#" list-type="picture-card" :auto-upload="false">
          <i slot="default" class="el-icon-plus"></i>
          <div slot="file" slot-scope="{ file }">
            <img class="el-upload-list__item-thumbnail" :src="file.url" alt="" />
            <span class="el-upload-list__item-actions">
              <span class="el-upload-list__item-preview" @click="handlePictureCardPreview(file)">
                <i class="el-icon-zoom-in"></i>
              </span>
              <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleDownload(file)">
                <i class="el-icon-download"></i>
              </span>
              <span v-if="!disabled" class="el-upload-list__item-delete" @click="handleRemove(file)">
                <i class="el-icon-delete"></i>
              </span>
            </span>
          </div>
        </el-upload>
      </div>

      <el-form :model="ruleForm" status-icon :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="书名" prop="title">
          <el-input type="text" v-model="ruleForm.title" autocomplete="off"></el-input>
        </el-form-item>

        <el-form-item label="种类" prop="type">
          <!--          <el-input type="password" v-model="ruleForm.checkPass" autocomplete="off"></el-input>-->
          <el-select style="width: 105px" v-model="ruleForm.selectType" placeholder="请选择类别" size="medium">
            <el-option label="全部分类" value="1"></el-option>
            <el-option label="教育" value="2"></el-option>
            <el-option label="工具书" value="3"></el-option>
            <el-option label="文学" value="4"></el-option>
            <el-option label="小说" value="5"></el-option>
            <el-option label="试卷" value="6"></el-option>
            <el-option label="其他" value="7"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="格式" prop="format">
          <el-select style="width: 105px" v-model="ruleForm.selectFormat" placeholder="请选择格式" size="medium">
            <el-option label="PDF" value="1"></el-option>
            <el-option label="TXT" value="2"></el-option>
            <el-option label="WORD" value="3"></el-option>
            <el-option label="EPUB" value="4"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">提交</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>

    <el-dialog :visible.sync="dialogVisible">
      <img width="100%" :src="dialogImageUrl" alt="" />
    </el-dialog>
  </div>
</template>

<script>
/* eslint-disable */
import { teach_port } from '../../config/constant'
import './book.less'

export default {
  name: 'UserBookLibrary',
  data() {
    let validateTitle = (rule, value, callback) => {
      if (value === '') {
        callback(new Error('请输入书名'))
      } else {
        callback()
      }
    }
    return {
      bookList: [
        {
          novelId: 'sdad',
          novelCover: '',
          novelTitle: 'SpringBoot从入门到入土',
          novelType: 'PDF',
          novelFormat: '',
          author: 'xiye',
        },
        {
          id: 'sds',
          title: 'SpringCloud从入门到入土',
          type: 'PDF',
          author: 'xiye',
        },
        {
          id: 'oni',
          title: 'JavaScript从入门到放弃',
          type: 'EPUB',
          author: 'xiye',
        },
        {
          id: 'oap',
          title: 'TypeScript从入门到放弃',
          type: 'PDF',
          author: 'xiye',
        },
        {
          id: 'xxz',
          title: 'Kali Linux从入门到入狱',
          type: 'TXT',
          author: 'xiye',
        },
        {
          id: 'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye',
        },
      ],
      options: [
        {
          value: 'TXT',
          label: 'TXT',
        },
        {
          value: 'PDF',
          label: 'PDF',
        },
        {
          value: 'WORD',
          label: 'WORD',
        },
        {
          value: 'EPUB',
          label: 'EPUB',
        },
      ],
      value: '', //书籍种类选择
      input: '', //搜索框文本
      dialogPublishVisible: false,

      ruleForm: {
        title: '',
        selectType: '1',
        selectFormat: '1',
      },
      rules: {
        title: [{ validator: validateTitle, trigger: 'blur' }],
      },
      dialogImageUrl: '',
      dialogVisible: false,
      disabled: false,
    }
  },
  beforeCreate: function () {
    const userId = '79392778a90d4639a297dbd0bae0f779'
    this.axios.post(teach_port + `/teach/getNovelListWithUId?userId=${userId}`).then((response) => {
      this.bookList = response.data
    })
  },
  methods: {
    handleReadBtn(id, type) {
      console.log(id, type)

      this.$router.push(`/book/book-read/${id}/${type}`)
    },
    handleSearchBtn() {
      console.log(
        `Send Axios Message, 通过id和种类打开图书进行阅读 , with book-type==>${
          this.value === '' ? 0 : this.value
        }, book-input==>${this.input === '' ? 0 : this.input}`
      )

      //发送axios请求
      const userId = '79392778a90d4639a297dbd0bae0f779'
      this.axios
        .post(
          teach_port +
            `/teach/getListWithFT?userId=${userId}&format=${this.value === '' ? 'TXT' : this.value}&input=${this.input}`
        )
        .then((response) => {
          this.bookList = response.data
        })
    },
    handleFindAllBookBtn() {
      //console.log('Send Axios Message, 查询所有图书列表 , Find All Book.')
      //发送axios请求
      const userId = '79392778a90d4639a297dbd0bae0f779'
      this.axios.post(teach_port + `/teach/getNovelListWithUId?userId=${userId}`).then((response) => {
        this.bookList = response.data
      })
    },
    bindGoToMarketBtn() {
      this.$router.push('/book/book-market')
    },
    bindPublishBookBtn() {
      this.dialogPublishVisible = true
    },
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          console.log(`Send Axios Message, 发送表单数据给后端插入书籍 , with form-data==>${this.ruleForm}`)

          //axios
        } else {
          console.log('error submit!!')
          return false
        }
      })
    },
    resetForm(formName) {
      this.$refs[formName].resetFields()
    },
    handleRemove(file) {
      console.log(file)
    },
    handlePictureCardPreview(file) {
      this.dialogImageUrl = file.url
      this.dialogVisible = true
    },
    handleDownload(file) {
      console.log(file)
    },
  },
}
</script>

<style lang="less" scoped>
/* eslint-disable */
#user-book-library {
  font-size: 16px;
}

#tool-bar {
  height: 3em;
  line-height: 2em;
  .el-col {
    display: flex;
    justify-content: space-around;
    align-items: center;

    * {
      margin: 0!important;
    }
  }
  .tool-bar-myFavorites {
    justify-content: unset;
  }
}

.card-book-infos {
  display: flex;
  justify-content: space-around;
  align-items: center;

  .card-book-info {
    text-align: center;
    line-height: 1.5em;
    color: #888;
    .card-book-info-title {
      font-size: 0.75em;
    }
    .card-book-info-content {
      font-size: 0.8em;
      // text-decoration: underline;
      // font-weight: bold;
    }
  }
}

.card-book-title {
  font-size: 1em;
  font-weight: bolder;
  word-break: keep-all;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  margin-bottom: 5px;
}

.xiOn-card-item {
  padding: 30px;
}

.image {
  width: 100%;
  display: block;
}

.el-container {
  padding: 20px !important;
}
.el-row {
  margin-bottom: 20px;
}
.el-row:last-child {
  margin-bottom: 0;
}
.el-col {
  border-radius: 6px;
}
</style>
