<template>
<!-- eslint-disable -->
  <el-container id="gotoTop" style="display: block!important;">
    <el-container>
        <el-aside width="60px">
          <div id="side-bar" class="side-bar">
            <dl>
              <dd class="theme-0" @click="goToBook" title="书页">
<!--                <faicon icon="book" size="lg"></faicon>-->
                <i class="el-icon-s-flag" style="transform: scale(1.4)"/>
              </dd>
              <dd class="theme-0" @click="openTOC" title="目录">
                <i class="el-icon-tickets" style="transform: scale(1.4)"></i>
              </dd>
              <dd class="theme-0" @click="openConfig" title="设置">
                <i class="el-icon-setting" style="transform: scale(1.4)"></i>
              </dd>
              <dd class="theme-0" @click="gotoTop" title="返回">
                <i class="el-icon-top" style="transform: scale(1.4)"></i>
              </dd>
            </dl>
          </div>
        </el-aside>

        <el-main id="reader-main" >

          <el-container>
            <el-header height="50px" class="reader-header theme-0 gotoTop">
              <el-row class>
                <el-col :span="4" class="reader-prev">
                  <a @click="readPrev">
                    <faicon icon="arrow-left"></faicon>
                    <span>上一章</span>
                  </a>
                </el-col>
                <el-col :span="16" class="reader-book-title">{{bookTitle}}</el-col>
                <el-col :offset="0" :span="2">
<!--                  <el-button type="ghost" @click="handleExitBtn()">退出阅读</el-button>-->
                  <el-link type="info" @click="handleExitBtn">退出阅读</el-link>
                </el-col>
                <el-col  :span="2" class="reader-next">
                  <a @click="readNext">
                    <span>下一章</span>
                    <faicon icon="arrow-right"></faicon>
                  </a>
                </el-col>
              </el-row>
            </el-header>
            <el-main class="reader-main content-box theme-0">
              <el-row>
                <el-col :span="24" class="reader-chapter-title">{{book.title}}</el-col>
              </el-row>
              <el-row class>
                <el-col :span="24" class="reader-content-pane">
                  <p class="reader-content-line" v-for="(ln,i) in book.content" :key="i">{{ln}}</p>
                </el-col>
              </el-row>
            </el-main>
          </el-container>
        </el-main>

        <el-dialog title="章节目录" :visible.sync="tocDialogVisible" width="50%" center >
          <dl class="toc-list">
            <dd
              @click="goByOrder(item.id);tocDialogVisible=false;"
              v-for="item in chapters"
              :key="item.id"
            >
              <span>{{item.title}}</span>
            </dd>
          </dl>
        </el-dialog>

        <el-dialog title="页面设置" :visible.sync="configDialogVisible" width="50%" center>
          <config @config-done="handleConfig"></config>
        </el-dialog>

    </el-container>

  </el-container>

</template>

<script>
/* eslint-disable */
import Config from './config/config'
// import {doCompact} from '../../utils/array';
import './book.less';
import { teach_port } from '../../config/constant'

export default {
  name: 'UserBookRead',
  components: {
    Config
  },
  data(){
    return{
      bid: "",
      cid: "",
      order: "",
      bookTitle: "白发魔女传",
      chapterTitle: '引言',
      chapters: [
        {
          title:'引言',
          id:'sadasdsadasdas'
        },
        {
          title:'用户须知'
        },
        {
          title:'教育系统使用手册'
        },
        {
          title:'考试系统使用手册'
        },
        {
          title:'教师平台使用手册'
        },
        {
          title:'管理端使用手册'
        },
        {
          title:'开发者日志'
        },
        {
          title:'更多'
        }],
      content: ['sssssdasdsad\tsasdasasdasd\nsjsabduawx\n','ixn1939129120','阿巴阿巴阿巴阿巴阿巴'],
      link: "",
      chapter: {},
      tocDialogVisible: false,
      configDialogVisible: false,
      theme: 'theme-0',

      book:{
        content:[],
        title:'下一代教考分离解决方案使用手册',
        id:''
      }
    }
  },
  beforeCreate: function () {
    //console.log(this.$route.params.id)
    const {id} = this.$route.params;//这个id是novel_id
    const userId = '79392778a90d4639a297dbd0bae0f779'
    this.axios.post(teach_port+`/teach/getContentWithChapterId?userId=${userId}&id=${id}`)
    .then(response=>{
      console.log(response)
      this.book = response
    })

    this.axios.post(teach_port+`/teach/getAllChapter/${id}`)
    .then(response=>{
      this.chapters = response.chapter
    })
  },
  methods:{
    handleExitBtn(){
      this.$router.push('/book')
    },
    getTOC() {
      let summaryUrl = `/api/btoc/?view=summary&book=${this.bid}`;
      let self = this;
      /*this.$axios.get(summaryUrl).then(res => {
        let url = `/api/btoc/${res.data[0]._id}?view=chapters&channel=mweb`;
        self.$axios.get(url).then(r => {
          self.bookTitle = r.data.bookName;
          for (let item of r.data.chapters) {
            if (self.cid == item.id && self.order == item.order) {
              self.link = item.link;
              self.getContent();
            }
            var ch = {};
            ch.order = item.order;
            ch.title = item.title;
            ch.id = item.id;
            ch.link = item.link;
            ch.isVip = item.isVip;
            self.chapters.push(ch);
            self.chapter = item;
          }
          self.$emit("first-chapter", self.chapters[0]);
        });
      });*/
    },
    getContent() {
      let lnk = this.link;
      let url = "/content/chapter/" + escape(lnk);
      let self = this;
      /*this.$axios.get(url).then(res => {
        let ch = res.data.chapter;
        if (!ch.isVip) {
          self.content = ch.cpContent.split("\n");
          self.chapterTitle = ch.title;
          self.order = ch.order;
        } else {
          self.content = ch.body.split("\n");
          self.chapterTitle = ch.title;
          self.order = ch.order;
        }
      });*/
    },
    readPrev() {
      let ord = parseInt(this.order) - 1;
      if (ord < 1) ord = 1;
      this.goByOrder(ord);
    },
    readNext() {
      let ord = parseInt(this.order) + 1;
      if (ord > this.chapters.length) ord = this.chapters.length;
      this.goByOrder(ord);
    },
    readByOrder(ord) {
      let item = this.chapters[ord - 1];
      this.link = item.link;
      this.cid = item.id;
      this.order = item.order;
      this.getContent();
    },
    goByOrder(ord) {
      //console.log("查询章节id:", ord);
      const userId = '79392778a90d4639a297dbd0bae0f779'
      const {id} = this.$route.params;
      this.axios.post(teach_port + `/teach/userJumpToNewChapter?ord=${ord}&userId=${userId}&novel_id=${id}`)
        .then(response=>{

          this.book = response
          document.body.scrollTop=0;
          document.documentElement.scrollTop=0;
        })

    },
    goToBook() {
      this.$router.push({
        path: "/book/" + this.bid + "/"
      });
    },
    openTOC() {
      this.tocDialogVisible = true;
    },
    openConfig() {
      this.configDialogVisible = true;
    },
    handleConfig(configRes) {
      if (configRes.save) {
        console.log(configRes.configs)
        let cfg = configRes.configs
        if (this.theme != cfg.theme) {
          this.changeTheme(this.theme, cfg.theme)
          this.theme = cfg.theme
        }
      } else {
        console.log("config cancelled")
      }
      this.configDialogVisible = false
    },
    changeTheme(from, to) {
      var eles = document.getElementsByClassName(from);
      while (eles.length) {
        var classNames = eles[0].className;
        eles[0].className = classNames.replace(from, to);
      }
    },
    handleScroll() {
      var scrollHeight = document.scrollingElement.scrollTop;
      var el = document.getElementById("side-bar");
      if (scrollHeight < 100) {
        el.style.top = 80 - scrollHeight + "px";
      } else {
        el.style.top = "-20px";
      }
    },
    gotoTop(){
      document.body.scrollTop=0;
      document.documentElement.scrollTop=0;
    }
  }
}
</script>

<style scoped>
/* eslint-disable */


</style>