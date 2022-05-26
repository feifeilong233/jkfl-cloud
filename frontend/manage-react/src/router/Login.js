import React, {Component} from 'react';
import {Button, Form, Grid, Header, Image, Input, Message, Segment} from "semantic-ui-react";
import {authentication} from "../api/system";
import {setJwtToken} from "../lib/utils";
import axios from "axios";
import {useHistory} from "react-router-dom/cjs/react-router-dom";

class Login extends Component {

    constructor(props) {
        super(props);
        this.state={
            inputTel:0,
            inputPwd:0,
        }

    }

    bindInputTel=(e)=>{
        const inputTel = e.target.value;
        this.setState({
            inputTel: inputTel
        });
    }

    bindInputPwd=(e)=>{
        const inputPwd = e.target.value;
        this.setState({
            inputPwd: inputPwd
        });
    }

    bindLoginBtn=()=>{
        const {inputTel, inputPwd} = this.state;
        console.log(inputTel,inputPwd)
        /*authentication(inputTel, inputPwd)
            .then(response=>{
                console.log(response)
                setJwtToken(response.data)
            })
            .catch(err=>{
                console.log(err)
            })*/
        axios.post('http://localhost:3000/api/back/authentication?tel='+inputTel+'&pwd='+inputPwd)
            .then(response=>{
                console.log(response)
                setJwtToken(response.data.message);

                this.props.history.push('/back')

            })
            .catch(error=>console.log(error));
    }

    render() {
        return (
            <div className='login'>
                <Grid textAlign='center' style={{ height: '100vh' }} verticalAlign='middle'>
                    <Grid.Column style={{ maxWidth: 450 }}>
                        <Header as='h2' color='teal' textAlign='center'>
                            <Image style={{width:'50px'}} src='/logo.svg'/> JKFL Online Exam
                        </Header>
                        <Form size='large'>
                            <Segment stacked>
                                <Form.Input fluid icon='user'
                                            iconPosition='left'
                                            placeholder='Your Tel'
                                            onChange={e=>this.bindInputTel(e)}
                                />
                                <Form.Input
                                    fluid
                                    icon='lock'
                                    iconPosition='left'
                                    placeholder='Password'
                                    type='password'
                                    onChange={e=>this.bindInputPwd(e)}
                                />

                                <Button color='teal'
                                        fluid size='large'
                                        onClick={this.bindLoginBtn}
                                >
                                    Login
                                </Button>
                            </Segment>
                        </Form>
                        <Message>
                            New to us? <a href='#'>Sign Up</a>
                        </Message>
                    </Grid.Column>
                </Grid>

            </div>
        );
    }
}

export default Login;
