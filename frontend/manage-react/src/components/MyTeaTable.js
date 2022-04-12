import {Table, Tree} from 'antd';
import store from "../store";
import { teacherSelect} from "../store/actionCreators";
import {getJwtToken} from "../lib/utils";
import axios from "axios";
const treeData = [
    {
        title: '火星大学',
        key: '0',
        id:"1",
        pid:"0",
        children: [
            {
                title: '人工智能与计算机学院',
                key: '0-0',
                id:"3",
                pid:'1',
            },
            {
                title: '物联网工程学院',
                key: '0-1',
                id:"4",
                pid:'1',
            },
            {
                title: '设计学院',
                key: '0-2',
                id:"7",
                pid:'1',
            }
        ],
    },
    {
        title:'不知道起啥名学院',
        key: '1',
        id:"2",
        pid:'0',
        children: [
            {
                title: '数字媒体学院',
                key: '1-0',
                id:"5",
                pid:'2',
            },
            {
                title: '机械工程学院',
                key: '1-1',
                id:"6",
                pid:'2',
            },
        ],
    }
];

export const MyTeaTable = (props) => {

    const onCheck = (checkedKeys, info) => {
        const findList = {};
        checkedKeys.map((item,index)=>{

            //console.log(Object.keys(findList).length)
            let split = item.split('-');

            if (split.length===2){


                if (Object.keys(findList).length===0){
                    //没有数据
                    let data = [];
                    data.push(treeData[split[0]].children[split[1]].title);
                    findList[treeData[split[0]].title] = data;
                }else{
                    //有数据，先对比是不是同一个学校
                    console.log()
                    if(treeData[split[0]].title in findList){
                        let data = findList[treeData[split[0]].title];
                        data.push(treeData[split[0]].children[split[1]].title);
                        findList[treeData[split[0]].title] = data;

                    }else{
                        //同 “没有数据” 的处理方式
                        let data = [];
                        data.push(treeData[split[0]].children[split[1]].title);
                        findList[treeData[split[0]].title] = data;
                    }
                }
            }

        })
        //console.log(findList);
        //const action = teacherSelect(findList);
        //console.log(action);

        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/selectTeaList',{
            data: findList
        },{
            headers:{
                "Authorization":jwt
            }
        }).then(response=>{
            //console.log(response.data.data)
            const tea_data = response.data.data.list;
            const action = teacherSelect(tea_data);
            store.dispatch(action);
        })



    };

    return (
        <div style={{display:'flex'}}>
            <div style={{width:'20vw',height:'100vh'}}>
                <Tree
                    virtual={false}
                    checkable
                    autoExpandParent={false}
                    defaultExpandAll={true}
                    onCheck={onCheck}
                    treeData={treeData}
                />
            </div>

            <div style={{width:'80vw'}}>
                <Table
                    bordered
                    rowKey='teaId'
                    columns={props.columns}
                    dataSource={props.data}
                >
                </Table>

            </div>

        </div>
    );
};
