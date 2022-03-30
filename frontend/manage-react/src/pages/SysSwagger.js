import React, {Component} from 'react';
import './pages.css';
import axios from "axios";
import {getJwtToken} from "../lib/utils";

class SysSwagger extends Component {

    UNSAFE_componentWillMount() {
        const jwt = getJwtToken();
        axios.post('http://localhost:3000/api/back/swagger',{},{
            headers:{
                "Authorization":jwt
            }
        })
            .then(response=>console.log(response.data.message))
            .catch(error=>console.log(error))
    }


    render() {
        return (
            <div style={{height:'100vh',width:'100vw'}}>
                <iframe src='http://localhost:8000/swagger-ui.html'
                        className='xi-on-swagger-iframe'
                        marginHeight={0}
                        marginWidth={0}
                        frameBorder={0}
                        allowFullScreen={true}
                />
            </div>
        );
    }
}

export default SysSwagger;