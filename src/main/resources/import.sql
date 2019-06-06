INSERT INTO article (name, content, type, ref_id) values
  ('明昕兒童中心徵求表演者', '2019/8/8 將舉辦慈善表演，徵求兒童節目表演者，詳洽02-12345678，MR.口鳥先生', 'Vender', 100),
  ('經濟0分', '政治100分，經濟0分', 'Other', 105),
  ('好"扯"', '扯鈴藝術家-Jason前進太陽馬戲團，再創台灣口碑', 'Artist', 200),
  ('網頁跳轉', 'add頁面insert失敗，網址變為insert', 'Other', 666),
  ('時間格式', '自動包裝entity含有date，String無法轉為long', 'Other', 666),
  ('資料庫自動產生insert時間', '用@CreatTime?', 'Other', 666),
  ('nav.jsp', '抓到網址列的資訊，啟動active的css', 'Other', 666);
 
 insert into forum (board, name, content, comment_date) values
 ('Ariticle', '薔薔', '大家好', '2019/05/25 18:13:21'),
 ('Ariticle', '博恩', '我真有那麼尷尬嗎？', '2019/05/22 13:50:02'),
 ('Ariticle', '豬孝天', '流星雨揪團', '2006/03/04 13:14:55'),
 ('Ariticle', '永和金城武', '不要再冒充我了！', '2019/05/28 20:00:27');
 
 INSERT INTO performance (name,youtube_url,update_time,activity_id) values
 ('中正紀念堂舞蹈表演','http://www.youtube.com','2019/05/25 17:12:05',1),
 ('自家餵狗秀','http://www.youtube.com','2019/05/28 19:10:35',2),
 ('倒立30分鐘','http://www.youtube.com','2019/05/28 21:05:46',3);
 
 INSERT INTO artist(name,fan_number,location) VALUES
 ('口鳥鳴',1314,'資策會'),
 ('柳常玄',30678,'台北市'),
 ('杳堯要咬瑤',6666,'高雄市');
 
 INSERT INTO activity (name,artist,description,begin_time,end_time) values
 ('吃飯','王世堅','王世堅喜歡炒飯','2019/05/28 12:03','2019/05/28 12:30'),
 ('睡覺','柯文哲','柯文哲議會質詢在睡覺','2019/05/29 23:35','2019/05/30 07:35'),
 ('打東東','韓國瑜','韓國瑜被東東海K','2019/05/30 07:35','2019/06/03 17:15');

insert into  Vender (name,address,max_people,phone) values
('EZ5音樂餐廳','106台北市大安區安和路二段211號',50,'0227383995'),
('Music Corner角落音樂餐廳',' 104台北市中山區建國北路一段156號',40,'0225043688'),
('LOTUS 音樂餐廳','78號長安東路二段中山區台北市10491',60,' 0223468888');


