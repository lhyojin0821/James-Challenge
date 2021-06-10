var express = require('express');
var app = express();
app.listen(3000);

app.use(express.json());
// app.use(express.urlencoded({ extended: false }));

app.get('/', (req, res) => res.json("Hi"));

// rest api 
// -> path 를 의미있게

// /flutter/data/all -- GET
// /flutter/datas
// /datas

app.get('/flutter/data/all', (req, res) => {
  var datas = [
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '댄스',
      'datas': [
        {
          'title': '댄스노래1',
          'name': '댄스가수1',
          'des': '가사1',
          'img':
            'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
        },
        { 'title': '댄스노래2', 'name': '댄스가수2', 'des': '가사2', 'img': '' },
      ],
    },
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '발라드',
      'datas': [
        {
          'title': '발라드노래1',
          'name': '발라드가수1',
          'des': '가사1',
          'img':
            'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        { 'title': '발라드노래2', 'name': '발라드가수2', 'des': '가사2', 'img': '' },
      ],
    },
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '힙합',
      'datas': [
        { 'title': '힙합노래1', 'name': '힙합가수1', 'des': '가사1', 'img': '' },
        { 'title': '힙합노래2', 'name': '힙합노래2', 'des': '가사2', 'img': '' },
      ],
    }
  ];
  res.json({ data: datas });
})

app.post('/flutter/login', (req, res) => {
  console.log(req.headers);
  var id = req.body.id;
  var pw = req.body.pw;
  // var { id, pw } = req.body; // JS-ES6
  console.log(`id:${id} / pw: ${pw}`);
  if (id === 'abc' && pw === 'a123') {
    return res.json(true);
  }
  return res.json(false);

});