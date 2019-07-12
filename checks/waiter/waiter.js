const express = require('express')
const app = express()
const bodyParser = require("body-parser")
const {base64encode, base64decode} = require('nodejs-base64')
const fs = require('fs')

app.use(bodyParser.json())

app.post('/submit', (req, res) => {
  const body = req.body;
  res.send('{"status":"success"}');
  var student = body.student;
  var checklist = base64decode(body.checklist);
  var commandHistory = base64decode(body.command_history);

  fs.writeFile(student+"-checklist", checklist, function(err) {
    if(err) {
      console.error(err);
    }
  });
  fs.writeFile(student+"-command_history", commandHistory, function(err) {
    if(err) {
      console.error(err);
    }
  });
})

app.listen(8080, () => {
  console.log('Server is running on PORT:',8080);
});
