var express = require('express');
var app = express();
var path = require('path');

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

app.get('/oauth', (req, res) => {
  var { code } = req.query
  // var code = req.query.code;
  console.log(code);
  if (code) {
    // return res.json(true);
    return res.sendFile(path.join(__dirname, './views/kakaologin.html'));
  }
  return res.json(false);
});

app.post('/kakaokey', (req, res) => {
  var { fkey } = req.headers;
  if (fkey !== 'flutter') return res.json("http://192.168.0.15:3000/error");

  var key = '06e2d5f00c1fc8a1097eb77c1487ec3b';
  var rUrl = 'http://192.168.0.15:3000/oauth';
  var url =
    `https://kauth.kakao.com/oauth/authorize?client_id=${key}&redirect_uri=${rUrl}&response_type=code`;
  return res.json(url);
});

app.get('/error', (req, res) => {
  res.send("정상적인 요청이 아닙니다");
});