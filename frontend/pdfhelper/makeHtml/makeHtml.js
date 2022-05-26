const path = require('path');
const fs = require('fs');
const jsdom = require('jsdom');
const { JSDOM } = jsdom;

const qConfig = {
    sqList: 0,
    mqList: 1,
    jqList: 2,
    iqList: 3,
    saqList: 4,
    pqList: 5
}

module.exports.makeBlankHtml = function(data, outHtmlPath) {
    let sampleHtml = fs.readFileSync(path.resolve(__dirname, 'sample', 'blank', 'index.html'), 'utf-8')
    const dom = new JSDOM(sampleHtml);
    const document = dom.window.document;
    
    document.querySelector('#paper>h1').textContent = data.name;

    let qsContainers = document.querySelectorAll('.qs-container');

    Object.keys(qConfig).forEach(qType => {
        let currentDom = qsContainers[qConfig[qType]];
        let currentQs = data[qType];

        switch (qType) {
            case 'sqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].sqQuestion)}</span>
                    </div>
                    <ul>
                        <li><span class="q-abcd">A. </span>${escapeChar(currentQs[i].sqAnswerA)}</li>
                        <li><span class="q-abcd">B. </span>${escapeChar(currentQs[i].sqAnswerB)}</li>
                        <li><span class="q-abcd">C. </span>${escapeChar(currentQs[i].sqAnswerC)}</li>
                        <li><span class="q-abcd">D. </span>${escapeChar(currentQs[i].sqAnswerD)}</li>
                    </ul>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'mqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].mqQuestion)}</span>
                    </div>
                    <ul>
                        <li><span class="q-abcd">A. </span>${escapeChar(currentQs[i].mqAnswerA)}</li>
                        <li><span class="q-abcd">B. </span>${escapeChar(currentQs[i].mqAnswerB)}</li>
                        <li><span class="q-abcd">C. </span>${escapeChar(currentQs[i].mqAnswerC)}</li>
                        <li><span class="q-abcd">D. </span>${escapeChar(currentQs[i].mqAnswerD)}</li>
                    </ul>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'jqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].jqQuestion)}</span>
                    </div>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'iqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].iqQuestion)}</span>
                    </div>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'saqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].saqQuestion)}</span>
                    </div>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'pqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].pqQuestion)}</span>
                    </div>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;

            default:
                break;
        }
    })

    function escapeChar(str) {
        if (typeof str !== 'string') return '无解析';

        let strArr = str.split('');
        for (let i = 0; i < strArr.length; i++) {
            if (strArr[i] == '<') strArr[i] = '&lt;'
            else if (strArr[i] == '>') strArr[i] = '&gt;'
        }
        return strArr.join('');
    }

    return new Promise((resolve, reject) => {
        fs.writeFile(outHtmlPath, document.documentElement.innerHTML, 'utf-8', (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}


module.exports.makeAnswerHtml = function(data, outHtmlPath) {
    let sampleHtml = fs.readFileSync(path.resolve(__dirname, 'sample', 'answer', 'index.html'), 'utf-8')
    const dom = new JSDOM(sampleHtml);
    const document = dom.window.document;
    
    document.querySelector('#paper>h1').textContent = data.name;

    let qsContainers = document.querySelectorAll('.qs-container');

    Object.keys(qConfig).forEach(qType => {
        let currentDom = qsContainers[qConfig[qType]];
        let currentQs = data[qType];

        switch (qType) {
            case 'sqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].sqQuestion)}</span>
                    </div>
                    <ul>
                        <li><span class="q-abcd">A. </span>${escapeChar(currentQs[i].sqAnswerA)}</li>
                        <li><span class="q-abcd">B. </span>${escapeChar(currentQs[i].sqAnswerB)}</li>
                        <li><span class="q-abcd">C. </span>${escapeChar(currentQs[i].sqAnswerC)}</li>
                        <li><span class="q-abcd">D. </span>${escapeChar(currentQs[i].sqAnswerD)}</li>
                    </ul>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].sqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${escapeChar(currentQs[i].sqAnswer)}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].sqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'mqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].mqQuestion)}</span>
                    </div>
                    <ul>
                        <li><span class="q-abcd">A. </span>${escapeChar(currentQs[i].mqAnswerA)}</li>
                        <li><span class="q-abcd">B. </span>${escapeChar(currentQs[i].mqAnswerB)}</li>
                        <li><span class="q-abcd">C. </span>${escapeChar(currentQs[i].mqAnswerC)}</li>
                        <li><span class="q-abcd">D. </span>${escapeChar(currentQs[i].mqAnswerD)}</li>
                    </ul>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].mqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${escapeChar(currentQs[i].mqAnswer)}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].mqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'jqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].jqQuestion)}</span>
                    </div>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].jqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${currentQs[i].jqAnswer == 'T' ? '√' : '×'}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].jqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'iqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].iqQuestion)}</span>
                    </div>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].iqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${escapeChar(currentQs[i].iqAnswer)}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].iqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'saqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].saqQuestion)}</span>
                    </div>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].saqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${escapeChar(currentQs[i].saqAnswer)}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].saqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;
            case 'pqList':
                for (let i = 0; i < currentQs.length; i++) {
                    let li = document.createElement('li');
                    li.innerHTML = `
                <div class="q-Question">
                    <div class="q-stem">
                        <span class="q-sort">${i + 1}.</span>
                        <span>${escapeChar(currentQs[i].pqQuestion)}</span>
                    </div>
                </div>
                <div class="q-Subject q-info">
                    <span class="q-info-title">类别: </span>
                    <span class="q-info-content">${currentQs[i].pqSubject}</span>
                </div>
                <div class="q-Answer q-info">
                    <span class="q-info-title">答案: </span>
                    <span class="q-info-content">${escapeChar(currentQs[i].pqAnswer)}</span>
                </div>
                <div class="q-Analysis">
                    <span><i>解析</i></span>
                    <p>${escapeChar(currentQs[i].pqAnalysis)}</p>
                </div>
                `;
                    currentDom.appendChild(li);
                }
                break;

            default:
                break;
        }
    })

    function escapeChar(str) {
        if (typeof str !== 'string') return '无解析';

        let strArr = str.split('');
        for (let i = 0; i < strArr.length; i++) {
            if (strArr[i] == '<') strArr[i] = '&lt;'
            else if (strArr[i] == '>') strArr[i] = '&gt;'
        }
        return strArr.join('');
    }

    return new Promise((resolve, reject) => {
        fs.writeFile(outHtmlPath, document.documentElement.innerHTML, 'utf-8', (err, res) => {
            if (err) reject(err);
            resolve(res);
        })
    })
}