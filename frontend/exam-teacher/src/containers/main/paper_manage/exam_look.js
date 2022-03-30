import React, {Component} from 'react';
import BreadcrumbCustom from "@components/BreadcrumbCustom";

class ExamLook extends Component {

    constructor(props) {
        super(props);
        this.state={
            pathList:['考试管理','监考']
        }
    }

    render() {
        return (
            <div>
                <BreadcrumbCustom pathList={this.state.pathList}></BreadcrumbCustom>
            </div>
        );
    }
}

export default ExamLook;