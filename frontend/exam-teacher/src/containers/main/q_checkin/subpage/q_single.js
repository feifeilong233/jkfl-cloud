//单选题
import React, {useRef} from 'react';
import ReactDOM from 'react-dom'
import "../index.css";

import {Form, Input, Select, Icon, Radio, Row, Col, Button, Upload, message, Modal, notification} from 'antd';
import * as XLSX from 'xlsx';
const FormItem = Form.Item;
const Option = Select.Option;
const { TextArea } = Input;
const RadioGroup = Radio.Group;

import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {getJwtToken} from "../../../../lib/utils";
import {examport} from "../../../../constants/webport";

let localCounter = 4;
class QSingle extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      fileList : [],
      rightAnswer : '',
      answerA:'',
      answerB:'',
      answerC:'',
      answerD:'',
      analysis:'无解析',
    }

  }

  bindAnalysis(e){
    this.setState({
      analysis: e.target.value
    })
  }

  bindSelectPoint(e){
    //console.log('subject',e)
    this.setState({
      subject:e
    })
  }

  //提交
  handleSubmit(e){
    e.preventDefault();

    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        if(this.state.rightAnswer === '') {
          Modal.warning({
            content: '请选择正确答案',
            okText : '确定'
          });
          return;
        }
        let choice = [];
        for(let variable in values) {
          if (/^option/.test(variable)) {
            choice.push(values[variable]);
          }
        }

       /* console.log('A',this.state.answerA)*/

        axios.post('http://localhost:8013/select/selectQuestion',{
          sqQuestion: this.state.question,
          sqAnswerA: this.state.answerA,
          sqAnswerB: this.state.answerB,
          sqAnswerC: this.state.answerC,
          sqAnswerD: this.state.answerD,
          sqAnswer: this.state.rightAnswer,
          sqScore: 2,
          sqLevel: this.props.level,
          sqSubject: this.state.subject,
          sqAnalysis: this.state.analysis,
        },{
          headers:{
            "Authorization":getJwtToken()
          }
        }).then(response=>{
          const {message} = response.data;
          if(message==='Success'){
            notification['success']({
              message: '添加成功',
              description: '单选题添加成功',
            })
          }

          if (message==='Fail'){
            notification['error']({
              message: '添加失败',
              description: '单选题添加失败',
            })
          }
        })


      }
    });
  }

  //点击答案
  clickWhichAnswer(option){
    this.setState({rightAnswer : option})
    // console.log(this.state.rightAnswer)
  }

  //增加选项
  addOption(){
    const { form } = this.props;
    const keys = form.getFieldValue('keys');
    let nextOptionCode = 'A'.charCodeAt(0);
    if(keys.length > 0) {
      let lastOptionCode = keys[keys.length - 1].option.charCodeAt(0);
      nextOptionCode = lastOptionCode+1;
    }
    keys.push({
      option : String.fromCharCode(nextOptionCode),
      key : ++localCounter
    });
    // this.setState({answerOptions : this.state.answerOptions})
    form.setFieldsValue({
      keys: keys,
    });
  }

  //删除选项
  deleteOption(key,i){

    const { form } = this.props;
    let keys = form.getFieldValue('keys');
    if(i === keys.length-1) {
      //删除的是最后一个
      this.setState({rightAnswer : ''})
    }
    keys = keys.filter(item => item.option !== key)
    for(let j = i;j<keys.length;j++) {
      keys[j].option = String.fromCharCode(keys[j].option.charCodeAt(0)-1);
    }
    form.setFieldsValue({
      keys: keys,
    });
  }

  bindTextArea(e){
    this.setState({
      question: e.target.value
    })
  }

  //选项输入框改变
  optionInputChange(i,e){
    //console.log(i)
    switch (i){
      case 0:
        this.setState({answerA: e.target.value});
        break;
      case 1:
        this.setState({answerB: e.target.value});
        break;
      case 2:
        this.setState({answerC: e.target.value});
        break;
      case 3:
        this.setState({answerD: e.target.value});
        break;
      default:
        break;
    }
  }


  bindDownloadClick (){
    //console.log("download");

    const aoa = [
      ['知识点', '题干', '选项A', '选项B', '选项C', '选项D', '答案', '解析'],
    ]

    const ws = XLSX.utils.aoa_to_sheet(aoa);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb,ws,'Sheet1');
    XLSX.writeFile(wb,'单选题模板.xlsx');



  }

  onImportExcel(file){
    // 获取上传的文件对象
    const { files } = file.target;
    // 通过FileReader对象读取文件
    const fileReader = new FileReader();
    fileReader.onload = event => {
      try {
        const { result } = event.target;
        // 以二进制流方式读取得到整份excel表格对象
        const workbook = XLSX.read(result, { type: 'binary' });
        // 存储获取到的数据
        let data = [];
        let up = [];//待上传的数据,需要对data进行变换
        // 遍历每张工作表进行读取（这里默认只读取第一张表）
        for (const sheet in workbook.Sheets) {
          // esline-disable-next-line
          if (workbook.Sheets.hasOwnProperty(sheet)) {
            // 利用 sheet_to_json 方法将 excel 转成 json 数据
            data = data.concat(XLSX.utils.sheet_to_json(workbook.Sheets[sheet]));
            data.map((_item,_index)=> {
              let temp = {};
              temp['sqSubject'] = _item['知识点'];
              temp['sqQuestion'] = _item['题干'];
              temp['sqAnswerA'] = _item['选项A'];
              temp['sqAnswerB'] = _item['选项B'];
              temp['sqAnswerC'] = _item['选项C'];
              temp['sqAnswerD'] = _item['选项D'];
              temp['sqAnswer'] = _item['答案'];
              temp['sqAnalysis'] = _item['解析']===''?'无解析':_item['解析'];
              up.push(temp);
            })
            // break; // 如果只取第一张表，就取消注释这行
          }
        }
        // 最终获取到并且格式化后的 json 数据
        console.log(up);
        axios.post(examport+'/select/addlist',{
          list: up
        },{
          headers:{
            "Authorization":getJwtToken(),
            "contentType":'application/json',
          }
        }).then(response=>{
          const {message} = response.data;

          if(message==='Info'){
            notification['info']({
              message: '认证失败',
              description: '登陆信息丢失，请重新登陆',
            })
          }

          if(message==='Success'){
            notification['success']({
              message: '添加成功',
              description: '批量添加成功',
            })
          }

          if (message==='Fail'){
            notification['error']({
              message: '添加失败',
              description: '批量添加失败',
            })
          }
        })

      } catch (e) {
        // 这里可以抛出文件类型错误不正确的相关提示
        message.error('文件类型不正确！');
      }
    };
    // 以二进制方式打开文件
    fileReader.readAsBinaryString(files[0]);
  }

  render(){
    //验证
    const { getFieldDecorator,getFieldValue } = this.props.form;
    getFieldDecorator('keys', { initialValue: [{
      option : 'A',
      key : 0
    },{
      option : 'B',
      key : 1
    },{
      option : 'C',
      key : 2
    },{
      option : 'D',
      key : 3
    }] });
    //表单项布局
    const formItemLayout = {
      labelCol: {
        xs: { span: 24 },
        sm: { span: 3 },
      },
      wrapperCol: {
        xs: { span: 24 },
        sm: { span: 20 },
      },
    };

    //答案列表
    const keys = getFieldValue('keys');
    const answerList = keys.map((item, i) => {
      return (
        <Row key = {item.key}>
          <Col span={21}>
            <FormItem
              {...formItemLayout}
              label={'选项'+item.option}
            >
              {getFieldDecorator('option'+item.option)(
                  <Input addonAfter={<Radio checked={this.state.rightAnswer === item.option}
                                            onClick={this.clickWhichAnswer.bind(this,item.option)}>正确答案</Radio>}
                         onChange={this.optionInputChange.bind(this,i)}
                  />
              )}
            </FormItem>
          </Col>
          <Col span={2} offset={1}>
            <Button onClick={this.deleteOption.bind(this,item.option,i)}><Icon type="delete"></Icon></Button>
          </Col>
        </Row>
      )
    })


    //知识点列表
    let knowledgePoint = [];
    this.props.knowledgePoint.forEach((item,index)=>{
      knowledgePoint.push(
        <Option key={index} value={item.pointName}>{item.pointName}</Option>
      )
    })

    const upload_props = {
      name: 'file',
      accept:'.xlsx, .xls',
    };

    return(
      <div>
        <div style={{display:'flex', width: '20vw'}}>
          <Button type="primary" size='default' onClick={this.bindDownloadClick.bind(this)}>
            下载模板
          </Button>

          <input className='xion-exam-input' type='file' accept='.xlsx, .xls' onChange={this.onImportExcel.bind(this)}/>
        </div>

        <Form onSubmit={this.handleSubmit.bind(this)}>
          <FormItem
            {...formItemLayout}
            label="知识点"
          >
            {getFieldDecorator('knowledgePoint', {
              rules: [{ required: true, message: '知识点不能为空！'}],
            })(
              <Select onSelect={this.bindSelectPoint.bind(this)} style={{ width: 120 }}>
                {knowledgePoint}
              </Select>
            )}

          </FormItem>
          <FormItem
            {...formItemLayout}
            label="题干"
          >
            {getFieldDecorator('tigan', {
              rules: [{ required: true, message: '题干不能为空！' }],
            })(
              <Row>
                <Col span={24}>
                  <TextArea onChange={this.bindTextArea.bind(this)} rows={4} />
                </Col>
              </Row>
            )}

          </FormItem>
          {answerList}
          <FormItem
              {...formItemLayout}
              label="解析"
          >
            <Row>
              <Col span={24}>
                <TextArea onChange={this.bindAnalysis.bind(this)} rows={4} />
              </Col>
            </Row>
          </FormItem>
          <FormItem
          >
            <Row>
              <Col sm={3} xs={0}>
              </Col>
              <Col sm={20} xs={24}>
                <Row>
                  <Col sm={4} xs={4} offset={13}>
                    <Button type="primary" className="f-r" onClick={this.addOption.bind(this)}>新增选项</Button>
                  </Col>
                  <Col sm={4} xs={4}>
                    <Button type="primary" htmlType="submit" className="f-r">保存</Button>
                  </Col>
                </Row>
              </Col>
            </Row>
          </FormItem>
        </Form>
      </div>
    )
  }

}

export default Form.create()(QSingle);
