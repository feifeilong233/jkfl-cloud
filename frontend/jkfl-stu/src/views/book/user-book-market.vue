<template>
<!--eslint-disable-->
  <div>
    <el-container>

      <div style="width: 100%;">
        <el-row>

          <el-col :span="6">
            资源市场
          </el-col>

          <el-col :span="12">
            <el-input placeholder="请输入内容" v-model="input" class="input-with-select">
              <el-select style="width: 105px" v-model="select" slot="prepend" placeholder="请选择" size="medium">
                <el-option label="全部分类" value="1"></el-option>
                <el-option label="教育" value="2"></el-option>
                <el-option label="工具书" value="3"></el-option>
                <el-option label="文学" value="4"></el-option>
                <el-option label="小说" value="5"></el-option>
                <el-option label="试卷" value="6"></el-option>
                <el-option label="其他" value="7"></el-option>
              </el-select>
              <el-button slot="append" icon="el-icon-search" @click="bindSearchBookInMarket"></el-button>
            </el-input>
          </el-col>

          <el-col :offset="1" :span="5">
            <el-button @click="handleMarketViewSwitch">视图切换</el-button>
            <el-button @click="handleGoToMyLibrary">我的收藏</el-button>
          </el-col>

        </el-row>

        <div v-if="this.viewSwitch">
          <el-row>
            <el-col :span="24" v-for="(item, index) in bookList" :key="index" style="margin: 3px">
              <el-card :body-style="{ padding: '0px' }" shadow="hover">
                <el-row>

                  <el-col :span="2">
                    <img :src="item.novelCover"
                         class="vertical-image"
                         @click="handleCollectBtn(item.id, item.type)"
                    >
                  </el-col>

                  <el-col :span="14">
                    <div style="margin-left: 10px">

                      <p class="card-book-title" :title="item.title">{{item.novelTitle}}</p>

                      <p class="card-book-span" style="margin-bottom: 0;margin-left: 0!important;">
                        类型
                        <span style="color: black;font-weight: normal;font-size: large">{{item.novelType}}</span>
                      </p>

                      <p class="card-book-span" style="margin-bottom: 0;margin-left: 0!important;">
                        格式
                        <span style="color: black;font-weight: normal;font-size: large">{{item.novelFormat}}</span>
                      </p>
                    </div>
                  </el-col>

                  <el-col :offset="5" :span="3">
                    <div style="display: grid; width: 100px;">
                      <el-button class="xiOn-vertical-btn" @click="handleCollectBtn(item.novelId,item.novelFormat)">加入收藏</el-button>
                      <el-button class="xiOn-vertical-btn" @click="handleMoreMsgBtn(item.novelId)">查看详细</el-button>
                    </div>
                  </el-col>

                </el-row>
              </el-card>
            </el-col>
          </el-row>
        </div>


        <div v-else>
          <el-row style="text-align: center;">
            <el-col class="xiOn-card-item"
                    :span="6"
                    v-for="(item, index) in bookList"
                    :key="index"
            >
              <div class="xiOn-card-wrapper">
                <el-card :body-style="{ padding: '0px' }" shadow="hover">
                  <div class="xiOn-img-wrapper">
                    <img :src="item.novelCover"
                         class="image"
                         @click="handleCollectBtn(item.novelId, item.novelType)"
                    >
                  </div>
                  <div style="padding: 14px;">

                    <p class="card-book-title" :title="item.novelTitle">{{item.novelTitle}}</p>

                    <span class="card-book-span">
                    类型
                    <span style="color: black;font-weight: normal;font-size: large">{{item.novelType}}</span>
                  </span>

                    <span class="card-book-span">
                    格式
                    <span style="color: black;font-weight: normal;font-size: large">{{item.novelFormat}}</span>
                  </span>

                    <div class="bottom clearfix">
                      <el-button type="text" class="button" @click="handleCollectBtn(item.novelId, item.novelType)">加入收藏</el-button>
                      <el-button type="text" class="button" @click="handleMoreMsgBtn(item.novelId)">查看详细</el-button>
                    </div>

                  </div>
                </el-card>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>


    </el-container>

    <el-dialog title="书籍详细" :visible.sync="dialogDetailVisible" width="80%">
      <el-row>
        <el-col :span="8">
          <div style="text-align: center;">
            <img :src="this.bookDetail.url" style="height: 350px"/>
          </div>
        </el-col>

        <el-col :span="16">
          <div style="margin-left: 5vw">
            <p class="xiOn-market-p">书籍编号: <span class="xiOn-market-span">{{this.bookDetail.id}}</span></p>
            <p class="xiOn-market-p">上传者: <span class="xiOn-market-span">{{this.bookDetail.author}}</span></p>
            <p class="xiOn-market-p">上传日期: <span class="xiOn-market-span">{{this.bookDetail.upload}}</span></p>
            <p class="xiOn-market-p">类别: <span class="xiOn-market-span">{{this.bookDetail.type}}</span></p>
            <p class="xiOn-market-p">格式: <span class="xiOn-market-span">{{this.bookDetail.format}}</span></p>
            <p class="xiOn-market-p">收藏量: <span class="xiOn-market-span">{{this.bookDetail.collection}}</span></p>
            <p class="xiOn-market-p">描述: <span class="xiOn-market-span">{{this.bookDetail.description}}</span></p>
            <el-button @click="handleCollectBtn(this.bookDetail.id, this.bookDetail.format)">加入收藏</el-button>
            <el-button @click="handleDownload(this.bookDetail.id)">文本下载</el-button>
          </div>
        </el-col>
      </el-row>


    </el-dialog>

  </div>

</template>

<script>
/* eslint-disable */
import './book.less'
import { teach_port } from '../../config/constant'

export default {
  name: 'UserBookMarket',
  data(){
    return{
      select:'1',
      input: '',
      viewSwitch:false,
      dialogDetailVisible: false,
      bookList: [
        {
          novelId: 'sdad',
          novelCover:'',
          novelTitle: 'SpringBoot从入门到入土',
          novelType: 'PDF',
          novelFormat:'',
          author: 'xiye'
        },
        {
          id:'sds',
          title: 'SpringCloud从入门到入土',
          type: 'PDF',
          author: 'xiye'
        },
        {
          id:'oni',
          title: 'JavaScript从入门到放弃',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'oap',
          title: 'TypeScript从入门到放弃',
          type: 'PDF',
          author: 'xiye'
        },
        {
          id:'xxz',
          title: 'Kali Linux从入门到入狱',
          type: 'TXT',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        },
        {
          id:'orz',
          title: '逆向工程从入门到入狱',
          type: 'EPUB',
          author: 'xiye'
        }
      ],
      bookDetail:{
        url:'https://shadow.elemecdn.com/app/element/hamburger.9cf7b091-55e9-11e9-a976-7f4d0b07eef6.png',
        id: 'xxxxxxxxxxx01',
        title: '一周速成Vue 3.X',
        author: '你xiye拿命在C',
        upload: '2022-3-31 0:53',
        type: 4,
        format: 'pdf',
        collection: 1203,
        description:'你xiye神通广大，敲代码敲累了拿命C怎么了？'
      }
    }
  },

  beforeCreate () {

    this.axios.post(teach_port + '/teach/getMarketNovelList')
    .then(response=>{
      this.bookList = response.data
    })

  },
  methods:{
    handleGoToMyLibrary(){
      this.$router.push('/book')
    },
    bindSearchBookInMarket(){
      console.log(`Send Axios Message, 通过书籍种类和名称进行查询 , with search-type==>${this.select} , search-input==>${this.input}`)

      //axios

    },
    handleMarketViewSwitch(){
      this.viewSwitch = !this.viewSwitch
    },
    handleCollectBtn(id,type){
      console.log(`Send Axios Message, 添加图书到我的收藏, with book-id==>${id} , book-type==>${type}`)
    },
    handleMoreMsgBtn(id){
      console.log(`Send Axios Message, 通过id查询图书的具体信息, with book-id==>${id}`)
      //axios
      //在response中打开dialogDetailVisible = true
      this.dialogDetailVisible = true;
    },
    handleDownload(id){
      console.log(`Send Axios Messgae, 通过id查询图书并下载 , with book-id==>${id}`)

      //axios

    }
  }
}
</script>

<style scoped>
/* eslint-disable */

  .xiOn-vertical-btn{
    margin: 5px;
  }

  .vertical-image{
    height: 100px;
  }

  .xiOn-market-p{
    color: #99a9bf;
    font-size: 16px;
    font-weight: lighter;
  }
  .xiOn-market-span{
    margin-left: 5px;
    color: black;
    font-size: 16px;
    font-weight: normal;
  }


  .el-container{
    padding: 20px;
  }

  .card-book-span{
    color: #99a9bf;
    font-weight: lighter;
    margin-left: 10px;
    margin-bottom: 15px;
  }

  .card-book-title{
    font-size: 20px;
    font-weight: bolder;
    word-break:keep-all;
    white-space:nowrap;
    overflow:hidden;
    text-overflow:ellipsis;
    margin-bottom: 5px;
  }

  .xiOn-card-item{
    padding: 30px;
  }

  .image {
    width: 100%;
    display: block;
  }

  .el-row {
    margin-bottom: 20px;
  }
  .el-row:last-child{
    margin-bottom: 0;
  }
  .el-col {
    border-radius: 6px;
  }


</style>