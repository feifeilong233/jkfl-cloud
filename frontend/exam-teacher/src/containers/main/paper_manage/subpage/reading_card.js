import React from 'react'

import {Row,Col,Input, Icon, Divider,Button,Card,Tag,InputNumber} from 'antd'

export default class ReadingCard extends React.Component {
  constructor(){
    super()
    this.state = {
      type : 0, //1 填空题  5 简答题 6 编程题
    }
  }

  componentWillMount(){
  }

  componentWillReceiveProps(nextProps){
    if(nextProps.questionList[0]) {
        this.setState({type : nextProps.questionList[0].type})
    }

  }

  //老师打分框框改变
  scoreChange(i,value,type){
      console.log('scorechange',i,type,`type - ${value}`)
      this.props.scoreChange(i, type, value)
    //this.props.scoreChange(this.state.type,i,value);
  }

  render(){

    let questionList = [];
    const {answerList} = this.props;
/*    console.log('ANSWER',answerList)*/
    this.props.questionList.forEach((item,i)=>{

        questionList.push(
            <div className="question-single" key={i}>
                <Tag>第{i+1}题</Tag>
                <span>
                    {
                        (item.iqQuestion && '3分') ||
                        (item.saqQuestion && '10分') ||
                        (item.pqQuestion && '10分')
                    }
                </span>
                <div className="content">
                    {
                        (item.iqQuestion && item.iqQuestion) ||
                        (item.saqQuestion && item.saqQuestion) ||
                        (item.pqQuestion && item.pqQuestion)
                    }
                </div>
                <div className="content">
                    <div className="bold">学生答案：</div>
                        {
                            answerList.map((j,_)=>{
                                return (
                                    <div key={_}>
                                        {
                                            (item.iqId === j.iqId && j.iqAnswer) ||
                                            (item.saqId === j.saqId && j.saqAnswer) ||
                                            (item.pqId === j.pqId && j.pqAnswer)
                                        }
                                    </div>
                                )
                            })
                        }

                    </div>
                    <div className="clearfix">
                    <span className="f-r">
                        得分：
                        {
                            item.iqQuestion && <InputNumber min={0} max={3} size="small" style={{width:100}} onChange={this.scoreChange.bind(this,i,'4')}/> ||
                            item.saqQuestion && <InputNumber min={0} max={10} size="small" style={{width:100}} onChange={this.scoreChange.bind(this,i,'5')}/> ||
                            item.pqQuestion && <InputNumber min={0} max={10} size="small" style={{width:100}} onChange={this.scoreChange.bind(this,i,'6')}/>
                        }
                    </span>
                </div>
                {i === this.props.questionList.length-1 ? "" : <Divider dashed="true"/>}
            </div>
        )
    })


    return(
      <Card title={this.props.title} bordered={false} style={{ width: '100%' }}>
        {questionList}
      </Card>
    )
  }
}
