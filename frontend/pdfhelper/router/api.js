const express = require('express');
const router = express.Router();
const fs = require('fs');
const path = require('path');
const prince = require('prince');
const util = require('util');
const {makeBlankHtml, makeAnswerHtml} = require('../makeHtml/makeHtml');

router.post('/getblankpdf', (req, res) => {
    let data = JSON.parse(req.body.data);

    const htmlPath = path.resolve(__dirname, '../', 'makeHtml', 'out', 'index.html');
    const pdfPath = path.resolve(__dirname, '../', 'pdfs', `${data.name}.pdf`);

    makeBlankHtml(data, htmlPath)
        .then(makeHtmlRes => {
            prince().inputs(htmlPath).output(pdfPath)
                .execute()
                .then(princeRes => {
                    console.log('success');
                    let fileStream = fs.createReadStream(pdfPath);
                    let stat = fs.statSync(pdfPath);
                    res.setHeader('Content-Length', stat.size);
                    res.setHeader('Content-Type', 'application/pdf');
                    res.setHeader('Content-Disposition', 'attachment; filename=haha.pdf');
                    fileStream.pipe(res);
                })
                .catch(err => console.log(err))
        })
        .catch(err => {
            console.log('error at makeHtml');
        })
})

router.post('/getanswerpdf', (req, res) => {
    let data = JSON.parse(req.body.data);

    const htmlPath = path.resolve(__dirname, '../', 'makeHtml', 'out', 'index.html');
    const pdfPath = path.resolve(__dirname, '../', 'pdfs', `${data.name}.pdf`);

    makeAnswerHtml(data, htmlPath)
        .then(makeHtmlRes => {
            prince().inputs(htmlPath).output(pdfPath)
                .execute()
                .then(princeRes => {
                    console.log('success');
                    let fileStream = fs.createReadStream(pdfPath);
                    let stat = fs.statSync(pdfPath);
                    res.setHeader('Content-Length', stat.size);
                    res.setHeader('Content-Type', 'application/pdf');
                    res.setHeader('Content-Disposition', 'attachment; filename=haha.pdf');
                    fileStream.pipe(res);
                })
                .catch(err => console.log(err))
        })
        .catch(err => {
            console.log('error at makeHtml');
        })
})

module.exports = router;