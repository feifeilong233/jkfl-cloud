//判断
import React from 'react';
import ReactDOM from 'react-dom'

import {Form, Input, Select, Icon, Radio, Row, Col, Button, Upload, message, Modal, notification} from 'antd';
const FormItem = Form.Item;
const Option = Select.Option;
const { TextArea } = Input;
const RadioGroup = Radio.Group;

import httpServer from '@components/httpServer.js'
import * as URL from '@components/interfaceURL.js'
import axios from "axios";
import {getJwtToken} from "../../../../lib/utils";
import * as XLSX from "xlsx";
import {examport} from "../../../../constants/webport";

class QTrueOrFalse extends React.Component {
  constructor(){
    super();
    this.state = {
      fileList : [],
      rightAnswer : '',
      localCounter : 0,
      analysis:'无解析',
    }
  }

  bindTextArea(e){
    this.setState({
      question: e.target.value
    })
  }

  bindAnalysis(e){
    this.setState({
      analysis: e.target.value
    })
  }

  bindRadioChange(e){
    //console.log('radio',e.target.value);
    if (e.target.value==='0')
      this.setState({answer:'F'})
    if (e.target.value==='1')
      this.setState({answer:'T'})
  }

  //提交
  handleSubmit(e){
    e.preventDefault();
    this.props.form.validateFieldsAndScroll((err, values) => {
      if (!err) {
        axios.post('http://localhost:8013/judge/judgeQuestion',{
          jqQuestion:this.state.question,
          jqSubject:this.state.subject,
          jqAnswer:this.state.answer,
          jqScore:2,
          jqLevel:this.props.level,
          jqAnalysis: this.state.analysis,
        },{
          headers:{
            "Authorization":getJwtToken()
          }
        }).then(response=>{
          const {message} = response.data;
          if(message==='Success'){
            notification['success']({
              message: '添加成功',
              description: '判断题添加成功',
            })
          }

          if (message==='Fail'){
            notification['error']({
              message: '添加失败',
              description: '判断题添加失败',
            })
          }
        })

      }
    });
  }

  bindSelectPoint(e){
    //console.log('subject',e)
    this.setState({
      subject:e
    })
  }

  bindDownloadClick (){
    console.log("download");

    const aoa = [
      ['知识点', '题干', '答案', '解析'],
    ]

    const ws = XLSX.utils.aoa_to_sheet(aoa);
    const wb = XLSX.utils.book_new();
    XLSX.utils.book_append_sheet(wb,ws,'Sheet1');
    XLSX.writeFile(wb,'判断题模板.xlsx');


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
              temp['jqSubject'] = _item['知识点'];
              temp['jqQuestion'] = _item['题干'];
              temp['jqAnswer'] = _item['答案'];
              temp['jqAnalysis'] = _item['解析']===''?'无解析':_item['解析'];
              up.push(temp);
            })
            // break; // 如果只取第一张表，就取消注释这行
          }
        }
        // 最终获取到并且格式化后的 json 数据
        console.log(up);
        axios.post(examport+'/judge/addlist',{
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
    const { getFieldDecorator } = this.props.form;

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


    //知识点列表
    let knowledgePoint = [];
    this.props.knowledgePoint.forEach((item,index)=>{
      knowledgePoint.push(
        <Option key={index} value={item.pointName}>{item.pointName}</Option>
      )
    })

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
            {getFieldDecorator('tigan',{
              rules: [{ required: true, message: '题干不能为空！' }],
            })(
              <Row>
                <Col span={24}>
                  <TextArea onChange={this.bindTextArea.bind(this)} rows={4} />
                </Col>
              </Row>
            )}
          </FormItem>
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
            {...formItemLayout}
            label="答案"
          >
            {getFieldDecorator('answer')(
              <RadioGroup onChange={this.bindRadioChange.bind(this)}>
                <Radio value="1">正确</Radio>
                <Radio value="0">错误</Radio>
              </RadioGroup>
            )}
          </FormItem>
          <FormItem
          >
            <Row>
              <Col sm={3} xs={0}>
              </Col>
              <Col sm={20} xs={24}>
                <Row>
                  <Col sm={4} xs={4} offset={13}>

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

export default Form.create()(QTrueOrFalse);
