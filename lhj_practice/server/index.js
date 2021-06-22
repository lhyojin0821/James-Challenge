var express = require('express');
var app = express();
var path = require('path');
app.listen(3000);

app.use(express.json());
app.get('/', (req, res) => res.json('Hi'));

app.get('/flutter/data/all', (req, res) => {
  var datas = [
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1593642532744-d377ab507dc8?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '발라드',
      'datas': [
        {
          'title': '너를 만나',
          'name': '폴킴',
          'des': `    
                너를 만난 그 이후로 사소한 변화들에 
                행복해져 눈이 부시게 빛 나는 아침
                너를 떠올리며 눈 뜨는 하루 식탁 위에 마주 앉아
                너의 하루는 어땠는지 묻거나
                나의 하루도 썩 괜찮았어
                웃으며 대답해 주고 싶어
                별것 아닌 일에 맘이 통할 때면
                익숙해진 서로가 놀라웠어
                널 사랑해
                평온한 지금처럼만
                영원하고 싶다고
                너를 바라보다 생각했어
                너를 만나 참 행복했어
                나 이토록 사랑할 수 있었던 건
                아직 어리고 모자란 내 맘
                따뜻한 이해로 다 안아줘서
                무심한 말투에 서로 아플 때면
                차가워진 사이가
                견딜 수 없어 미안해
                불안한 지금이라도
                영원하고 싶다고
                너를 바라보다 생각했어
                너를 만나 참 행복했어
                나 이토록 사랑할 수 있었던 건
                아직 어리고 모자란 내 맘
                따뜻한 이해로 다 안아줘서
                뜨거웠던 여름 지나
                그리워질 빗소리에
                하나 둘 수줍어 또 얼굴 붉히면
                생각이 많아진 너의 눈에 입 맞출 테니
                우리 함께 걸어가기로 해
                나를 만나 너도 행복하니
                못 해준 게 더 많아서 미안해
                이기적이고 불안한 내가
                너에게만은 잘하고 싶었어
                오랫동안 나 기다려온
                완벽한 사랑을 찾은 것 같아
                날 잡아줘서 힘이 돼줘서
                소중한 배려로 날 안아줘서
                너를 만나`,
          'img': 'https://image.bugsm.co.kr/album/images/500/202037/20203701.jpg'
        },
        { 'title': '발라드노래2', 'name': '발라드가수2', 'des': '가사2', 'img': '' },
      ],
    },
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1621447578058-6543ad48e6b2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '댄스',
      'datas': [
        {
          'title': '댄스노래1',
          'name': '댄스가수1',
          'des': '가사1',
          'img':
            'https://images.unsplash.com/photo-1621447578058-6543ad48e6b2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        { 'title': '댄스노래2', 'name': '댄스가수2', 'des': '가사2', 'img': '' },
      ],
    },
    {
      'imgUrl':
        'https://images.unsplash.com/photo-1621447578191-3869acfdfd6a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '힙합',
      'datas': [
        { 'title': '힙합노래1', 'name': '힙합가수1', 'des': '가사1', 'img': '' },
        { 'title': '힙합노래2', 'name': '힙합가수2', 'des': '가사2', 'img': '' },
      ],
    },
  ];
  res.json({ data: datas });
});
app.post('/flutter/login', (req, res) => {
  console.log(req.headers);
  var id = req.body.id;
  var pw = req.body.pw;
  console.log(`id:${id} / pw:${pw}`);
  if (id === 'abc' && pw === 'a123') {
    return res.json(true);
  } else {
    return res.json(false);
  }

});

app.get('/oauth', (req, res) => {
  var { code } = req.query;
  console.log(code);
  if (code) {
    // res.json(true);
    return res.sendFile(path.join(__dirname, './views/kakaoLogin.html'));
  }
  res.json(false);
});

app.post('/kakaokey', (req, res) => {
  var { fkey } = req.headers;
  if (fkey !== 'flutter') return res.json('http://172.30.1.34:3000/error');

  var key = '2494f3a15ff25809d37ac8ebb915cea6';
  var rUrl = 'http://172.30.1.34:3000/oauth';
  var url =
    `https://kauth.kakao.com/oauth/authorize?client_id=${key}&redirect_uri=${rUrl}&response_type=code`;
  return res.json(url);
});

app.get('/error', (req, res) => {
  res.send('정상적인 요청이 아닙니다');
});