import React, {Component, createRef} from 'react';
import axios from "axios";
import {getJwtToken} from "../lib/utils";
import './pages.css';

class SysDataBase extends Component {

    constructor(props) {
        super(props);
        this.state={
        }
    }

    UNSAFE_componentWillMount() {
        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/database',{},{
            headers: {
                "Authorization":jwt
            }
        })
            .then(response=>{console.log(response)})
            .catch(error=>console.log(error))
    }



    render() {
        return (
            <div style={{width:'100vw',height:'100vh'}}>
                <iframe src={'/jkfl_生成文档信息描述_1.0.0.html'}
                        className='xi-on-swagger-iframe'
                        width="100%"
                        height="100%"/>
            </div>
        );
    }
}

export default SysDataBase;