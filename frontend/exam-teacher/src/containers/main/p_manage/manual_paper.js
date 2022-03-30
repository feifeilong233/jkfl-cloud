import React, {Component} from 'react';
import axios from "axios";
import {examport} from "../../../constants/webport";
import {getJwtToken} from "../../../lib/utils";
import BreadcrumbCustom from "@components/BreadcrumbCustom";
import {Form, notification} from 'antd';
import {Row,Col,Select,Input,Table,Icon,Divider,Button,Modal,message} from 'antd'
import httpServer from "@components/httpServer";
import * as URL from "@components/interfaceURL";
const Option = Select.Option;
const Search = Input.Search;
const FormItem = Form.Item;
const confirm = Modal.confirm;

class ManualPaper extends Component {
    constructor(props){
        super(props);
        this.state = {
            type:'select',
            render:'select',
            total: 0,
            data:[],
            sqSelectedRowKeys : [], //选择的行
            mqSelectedRowKeys: [],
            jqSelectedRowKeys: [],
            iqSelectedRowKeys: [],
            saqSelectedRowKeys: [],
            pqSelectedRowKeys: [],
            sqList: [],
            mqList: [],
            jqList: [],
            iqList: [],
            saqList: [],
            pqList: [],
            modalVisible:false,
        }
    }

    componentWillMount(){
        axios.post(examport+'/select/list',{},{
            headers:{
                "Authorization":getJwtToken()
            }
        }).then(response=>{
            const {data} = response.data.data;
            console.log(data);
            data.map((item,index)=>{
                item['key'] = index;
            })

            this.setState({
                data: data
            });
        })
    }

    //搜索类型选择
    handleChange(value) {
        //console.log(`selected ${value}`);
        this.setState({
            type: value,
        });
    }

    addSelect(value){
        console.log('select',value);
    }

    //选择的某一行
    onSelectSqChange(sqSelectedRowKeys) {
        //console.log('selectedRowKeys changed: ', sqSelectedRowKeys);
        const tmp = sqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];//单条数据，这样可以不用查数据库，因为每次查询data都在改变，所以不可以查id，否则预览查不出来
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.sqList;
        let total = this.state.total;
        list.push(mum);
        //console.log('select',list)
        total+=2;

        this.setState({
            sqList: list,
            total:total,
        })
        this.setState({ sqSelectedRowKeys });
    }

    onSelectMqChange(mqSelectedRowKeys){
        //console.log('mqSelectedRowKeys changed: ', mqSelectedRowKeys);
        const tmp = mqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.mqList;
        let total = this.state.total;
        list.push(mum);
        total+=4;

        this.setState({
            mqList: list,
            total:total,
        })
        this.setState({ mqSelectedRowKeys });
    }

    onSelectJqChange(jqSelectedRowKeys){
        //console.log('jqSelectedRowKeys changed: ', jqSelectedRowKeys);
        const tmp = jqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.jqList;
        let total = this.state.total;
        list.push(mum);
        total+=2;

        this.setState({
            jqList: list,
            total: total,
        })
        this.setState({ jqSelectedRowKeys });
    }

    onSelectIqChange(iqSelectedRowKeys){
        //console.log('iqSelectedRowKeys changed: ', iqSelectedRowKeys);
        const tmp = iqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.iqList;
        let total = this.state.total;
        list.push(mum);
        total+=3;

        this.setState({
            iqList: list,
            total:total,
        })
        this.setState({ iqSelectedRowKeys });
    }

    onSelectSaqChange(saqSelectedRowKeys){
        //console.log('saqSelectedRowKeys changed: ', saqSelectedRowKeys);
        const tmp = saqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.saqList;
        let total = this.state.total;
        list.push(mum);
        total+=10;

        this.setState({
            saqList: list,
            total:total,
        })
        this.setState({ saqSelectedRowKeys });
    }

    onSelectPqChange(pqSelectedRowKeys){
        //console.log('pqSelectedRowKeys changed: ', pqSelectedRowKeys);
        const tmp = pqSelectedRowKeys;
        const mum = this.state.data[tmp[tmp.length-1]];
        //console.log(this.state.data[tmp[tmp.length-1]])
        const list = this.state.pqList;
        let total = this.state.total;
        list.push(mum);
        total+=10;

        this.setState({
            pqList: list,
            total:total,
        })
        this.setState({ pqSelectedRowKeys });
    }


    //预览
    setModalVisible(modalVisible){
        this.setState({ modalVisible });
    }

    bindSubmitBtn(){
        const {sqList, mqList, jqList, iqList, saqList, pqList ,total} = this.state;

        //const total = sqList.length*2+mqList.length*4+jqList*2+iqList.length*3+saqList.length*10+pqList.length*10;

        const s=[],m=[],j=[],i=[],sa=[],p=[];
        sqList.map((item,_)=>{
            s.push(item.sqId);
        })
        mqList.map((item,_)=>{
            m.push(item.mqId);
        })
        jqList.map((item,_)=>{
            j.push(item.jqId);
        })
        iqList.map((item,_)=>{
            i.push(item.iqId);
        })
        saqList.map((item,_)=>{
            sa.push(item.saqId);
        })
        pqList.map((item,_)=>{
            p.push(item.pqId);
        })

        const sendList = {
            sqList: s,
            mqList: m,
            jqList: j,
            iqList: i,
            saqList: sa,
            pqList: p,
            total: this.state.total,
            title: this.state.title,
            time: this.state.time,
        }

        if (total===0){
            Modal.confirm({
                    title: '警告',
                    content: '您还没有选择题目！',
                    okText: '确认',
                    cancelText: '取消',
                });
        }else{
            Modal.confirm({
                title: '提示',
                content: '这套试卷的总分是'+total+"分,你确定提交吗？",
                okText: '确认',
                cancelText: '取消',
                onOk: ()=>{
                    //用户点击确认
                    //console.log(sendList)
                    this.sendManualExam(sendList);
                },
            });
        }
    }

    sendManualExam(sendList){
        axios.post(examport+'/item/manual',{
            sqList: sendList.sqList,
            mqList: sendList.mqList,
            jqList: sendList.jqList,
            iqList: sendList.iqList,
            saqList: sendList.saqList,
            pqList: sendList.pqList,
            total: sendList.total,
            title: sendList.title,
            time: sendList.time,
        },{
            headers:{
                "Authorization":getJwtToken()
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
                    message: '组卷成功',
                    description: '手动组卷成功',
                })
            }

            if (message==='Fail'){
                notification['error']({
                    message: '组卷失败',
                    description: '手动组卷失败',
                })
            }

        })
    }


    //选择科目
    subjectChange(e){
        this.setState({
            title: e.target.value,
        });
    }

    //选择等级
    gradeChange(value){
        this.gradeId = value;
    }

    bindExamTimeChange(e){
        this.setState({
            time: e.target.value
        })
    }




    render(){

        const {render,data} = this.state;

        const formItemLayoutTop = {
            labelCol: {
                sm: { span: 24 },
                md: { span: 6 }
            },
            wrapperCol: {
                sm: { span: 24 },
                md: { span: 18 }
            },
        }

        //行选择
        const sqRowSelection = {
            selectedRowKeys : this.state.sqSelectedRowKeys,
            onChange: this.onSelectSqChange.bind(this),
        };

        const mqRowSelection = {
            selectedRowKeys : this.state.mqSelectedRowKeys,
            onChange: this.onSelectMqChange.bind(this),
        };

        const jqRowSelection = {
            selectedRowKeys : this.state.jqSelectedRowKeys,
            onChange: this.onSelectJqChange.bind(this),
        };

        const iqRowSelection = {
            selectedRowKeys : this.state.iqSelectedRowKeys,
            onChange: this.onSelectIqChange.bind(this),
        };

        const saqRowSelection = {
            selectedRowKeys : this.state.saqSelectedRowKeys,
            onChange: this.onSelectSaqChange.bind(this),
        };

        const pqRowSelection = {
            selectedRowKeys : this.state.pqSelectedRowKeys,
            onChange: this.onSelectPqChange.bind(this),
        };


        return(
            <div>
                <BreadcrumbCustom pathList={['题库管理','试题管理']}></BreadcrumbCustom>
                <div className="score-search-content">
                    <Row>
                        <Col span={24}>
                            <Search
                                className="f-r"
                                placeholder="请输入关键字"
                                onSearch={value => {
                                    //console.log(value);
                                    axios.post(examport+'/exam/getDataList?type='+this.state.type+'&value='+value,{},{
                                        headers:{
                                            "Authorization":getJwtToken()
                                        }
                                    }).then(response=>{
                                        const {data} = response.data.data;
                                        //console.log(data);
                                        data.map((item,index)=>{
                                            item['key']=index;
                                        })
                                        this.setState({
                                            data: data,
                                            render: this.state.type,
                                            sqSelectedRowKeys : [], //选择的行
                                            mqSelectedRowKeys: [],
                                            jqSelectedRowKeys: [],
                                            iqSelectedRowKeys: [],
                                            saqSelectedRowKeys: [],
                                            pqSelectedRowKeys: [],
                                        });
                                    })
                                }}
                                enterButton
                                style={{ width: 200 }}
                            />
                            <Select className="f-r m-r-20" defaultValue="select" style={{ width: 120 }} onChange={this.handleChange.bind(this)}>
                                <Option value="select">单选</Option>
                                <Option value="multiple">多选</Option>
                                <Option value="judge">判断</Option>
                                <Option value="input">填空</Option>
                                <Option value="shortAnswer">简答</Option>
                                <Option value="program">程序</Option>
                            </Select>
                        </Col>
                    </Row>
                    <Row>
                        <Col span={24}>
                            <Button className='f-r' style={{marginTop:'10px'}} onClick={this.setModalVisible.bind(this,true)}>预览</Button>

                            <Button className='f-r m-r-20' style={{marginTop:'10px'}} onClick={this.bindSubmitBtn.bind(this)}>提交</Button>
                        </Col>
                    </Row>
                    <Row>


                        <Form>
                            <Col span={8}>
                                <FormItem
                                    label="科目"
                                    {...formItemLayoutTop}
                                >
                                    <Input style={{width: 240}} onChange={this.subjectChange.bind(this)}/>
                                </FormItem>
                            </Col>
                            <Col span={8}>
                                <FormItem
                                    label="难度"
                                    {...formItemLayoutTop}
                                >
                                    <Select style={{ width: 120 }} onChange={this.gradeChange.bind(this)}>
                                        <Option value="1">初级</Option>
                                        <Option value="2">中级</Option>
                                        <Option value="3">高级</Option>
                                    </Select>
                                </FormItem>
                            </Col>
                            <Col span={8}>
                                <FormItem
                                    label="时间"
                                    {...formItemLayoutTop}
                                >
                                    <Input onChange={this.bindExamTimeChange.bind(this)} style={{width:120}}/>
                                </FormItem>
                            </Col>
                        </Form>


                    </Row>
                    <div className="m-t-20">
                        {
                            (render==='select')?<Table columns={selectColumns}
                                                       dataSource={data}
                                                       rowSelection={sqRowSelection}
                            />:null
                        }
                        {
                            (render==='multiple')?<Table columns={multipleColumns}
                                                         dataSource={data}
                                                         rowSelection={mqRowSelection}
                            />:null
                        }
                        {
                            (render==='judge')?<Table columns={judgeColumns}
                                                      dataSource={data}
                                                      rowSelection={jqRowSelection}
                            />:null
                        }
                        {
                            (render==='input')?<Table columns={inputColumns}
                                                      dataSource={data}
                                                      rowSelection={iqRowSelection}
                            />:null
                        }
                        {
                            (render==='shortAnswer')?<Table columns={shortAnswerColumns}
                                                            dataSource={data}
                                                            rowSelection={saqRowSelection}
                            />:null
                        }
                        {
                            (render==='program')?<Table columns={programColumns}
                                                        dataSource={data}
                                                        rowSelection={pqRowSelection}
                            />:null
                        }
                    </div>

                    <Modal
                        title="试卷预览"
                        width={'65%'}
                        centered
                        visible={this.state.modalVisible}
                        onOk={() => this.setModalVisible(false)}
                        onCancel={() => this.setModalVisible(false)}
                    >
                        <h3>选择</h3>
                        <div>
                            {
                                this.state.sqList.length===0?<p>无</p>:this.state.sqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p >{item.sqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <h3>多选</h3>
                        <div>
                            {
                                this.state.mqList.length===0?<p>无</p>:this.state.mqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p key={index}>{item.mqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <h3>判断</h3>
                        <div>
                            {
                                this.state.jqList.length===0?<p>无</p>:this.state.jqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p key={index}>{item.jqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <h3>填空</h3>
                        <div>
                            {
                                this.state.iqList.length===0?<p>无</p>:this.state.iqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p key={index}>{item.iqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <h3>简答</h3>
                        <div>
                            {
                                this.state.saqList.length===0?<p>无</p>:this.state.saqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p key={index}>{item.saqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                        <h3>程序</h3>
                        <div>
                            {
                                this.state.pqList.length===0?<p>无</p>:this.state.pqList.map((item,index)=>{
                                    return(
                                        <div key={index} style={{display:'flex'}}>
                                            <p style={{fontWeight:'600'}}>{(index+1)+'. '}</p>
                                            <p key={index}>{item.pqQuestion}</p>
                                        </div>
                                    )
                                })
                            }
                        </div>
                    </Modal>
                </div>
            </div>
        )
    }
}

export default ManualPaper;

const selectColumns = [
    {
        title: '编号',
        dataIndex: 'sqId',
        key: 'sqId',
    },
    {
        title: '类型',
        dataIndex: 'sqSubject',
        key: 'sqSubject',
    },
    {
        title: '题目',
        dataIndex: 'sqQuestion',
        key: 'sqQuestion',
    },
]

const multipleColumns = [
    {
        title: '编号',
        dataIndex: 'mqId',
        key: 'mqId',
    },
    {
        title: '类型',
        dataIndex: 'mqSubject',
        key: 'mqSubject',
    },
    {
        title: '题目',
        dataIndex: 'mqQuestion',
        key: 'mqQuestion',
    }
]

const judgeColumns = [
    {
        title: '编号',
        dataIndex: 'jqId',
        key: 'jqId',
    },
    {
        title: '类型',
        dataIndex: 'jqSubject',
        key: 'jqSubject',
    },
    {
        title: '题目',
        dataIndex: 'jqQuestion',
        key: 'jqQuestion',
    },

]

const inputColumns = [
    {
        title: '编号',
        dataIndex: 'iqId',
        key: 'iqId',
    },
    {
        title: '类型',
        dataIndex: 'iqSubject',
        key: 'iqSubject',
    },
    {
        title: '题目',
        dataIndex: 'iqQuestion',
        key: 'iqQuestion',
    },
]

const shortAnswerColumns = [
    {
        title: '编号',
        dataIndex: 'saqId',
        key: 'saqId',
    },
    {
        title: '类型',
        dataIndex: 'saqSubject',
        key: 'saqSubject',
    },
    {
        title: '题目',
        dataIndex: 'saqQuestion',
        key: 'saqQuestion',
    },
]

const programColumns = [
    {
        title: '编号',
        dataIndex: 'pqId',
        key: 'pqId',
    },
    {
        title: '类型',
        dataIndex: 'pqSubject',
        key: 'pqSubject',
    },
    {
        title: '题目',
        dataIndex: 'pqQuestion',
        key: 'pqQuestion',
    },
]