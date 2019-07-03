INSERT INTO article (name, content, type, ref_id, count) values
  ('明昕兒童中心徵求表演者', '2019/8/8 將舉辦慈善表演，徵求兒童節目表演者，詳洽02-12345678，MR.口鳥先生', 'Vender', 100, 2),
  ('陳忻玥新專輯！衝上排行第一！', '你/妳好！ 我的名字叫忻玥(ㄒㄧㄣ ㄩㄝ、)女聲 & 吉他 & 創作Hello! I’m Vicky Chen.Singing & Playing guitar & Writing找我演出：alex@skrpresents.com', 'Performance', 1, 99),
  ('好"扯"', '扯鈴藝術家-Jason前進太陽馬戲團，再創台灣口碑', 'Artist', 200, 5),
  ('網頁跳轉', 'add頁面insert失敗，網址變為insert', 'Other', 666, 10),
  ('時間格式', '自動包裝entity含有date，String無法轉為long', 'Other', 666, 1),
  ('資料庫自動產生insert時間', '用@CreatTime?', 'Other', 666, 3),
  ('nav.jsp', '抓到網址列的資訊，啟動active的css', 'Other', 666, 4);
 
 insert into forum (ref_id, ref_comment_id, board, user_name, comment, comment_date) values
 (1, 0,'Performance', '薔薔', '大家好', '2019/05/25 18:13:21'),
 (2, 1,'Activity', '博恩', '我真有那麼尷尬嗎？', '2019/05/22 13:50:02'),
 (2, 1,'Performance', '豬孝天', '流星雨揪團', '2006/03/04 13:14:55'),
 (2, 1,'Activity', '永和金城武', '不要再冒充我了！', '2019/05/28 20:00:27'),
 (2, 1,'Article', '大中天', '以前你偶爾聽，現在你應該天天聽', '2006/03/04 13:14:55'),
 (2, 1,'Article', '大平台', '我已經買了zzZ', '2019/05/28 20:00:27'); 
 INSERT INTO performance (title,introduction,youtube_url,update_time,activity_id,views) values
 ('陳忻玥 Vicky Chen -【入土之前】','陳祈玥入土之前完整MV','https://www.youtube.com/watch?v=GfWkG4qedoE','2019/05/25 17:12:05',1,3000),
 ('A-Lin《有一種悲傷 A Kind of Sorrow》','ALIN最新歌曲有一種悲傷','https://www.youtube.com/watch?v=BRcudpJzy1I','2019/05/28 19:10:35',2,100),
 ('G.E.M.【再見 GOODBYE】鄧紫棋','鄧紫棋發燒歌曲再見，讓您聆聽','https://www.youtube.com/watch?v=Lhel0tzHE08','2019/05/28 21:05:46',3,2100);
 							
 
 INSERT INTO artist(name,fan_number,location) VALUES
 ('桑源雅沂',86520,'東京'),
 ('白賊虞',30678,'高雄市'),
 ('柳川鳳',66666,'神奈川'),
 ('張添財',98765,'自由新鎮'),
 ('敏敏',12345,'大都')
 
 INSERT INTO activity (name,artist,description,begin_time,end_time,awesome_Num,bad_Num,cover_Image) values
 ('裝銅人','王世堅','裝了就硬幫幫','2019/03/28 12:03','2019/05/28 12:30',53,15,1),
 ('跳火圈','柯文哲','沒事就愛跳火圈','2019/02/22 23:35','2019/02/23 07:35',109,25,2),
 ('唱情歌','呂秀蓮','在北車唱情歌','2019/07/14 07:35','2019/07/14 17:15',77,35,3),
 ('打工賺錢','蔡英文','賺錢選粽痛','2019/06/27 23:35','2019/06/28 07:35',127,25,4),
 ('裝印地安人','郭台銘','One little two little three little indian..','2019/04/25 07:35','2019/05/01 17:15',203,35,5);

insert into  Vender (name,address,max_people,phone,lat,lng) values
('EZ5音樂餐廳','106台北市大安區安和路二段211號',50,'0227383995',25.0260149,121.550337),
('Music Corner角落音樂餐廳',' 104台北市中山區建國北路一段156號',40,'0225043688',25.0516328,121.5341573),
('LOTUS 音樂餐廳','78號長安東路二段中山區台北市10491',60,' 0223468888',25.0483426,121.5317147),
('EZ5音樂餐廳','106台北市大安區安和路二段211號',50,'0227383995',25.0360149,121.549337),
('Music Corner角落音樂餐廳',' 104台北市中山區建國北路一段156號',40,'0225043688',25.0416328,121.5241573),
('LOTUS 音樂餐廳','78號長安東路二段中山區台北市10491',60,' 0223468888',25.0383426,121.5217147),
('EZ5音樂餐廳','106台北市大安區安和路二段211號',50,'0227383995',25.0270149,121.551337),
('Music Corner角落音樂餐廳',' 104台北市中山區建國北路一段156號',40,'0225043688',25.0526328,121.5351573),
('LOTUS 音樂餐廳','78號長安東路二段中山區台北市10491',60,' 0223468888',25.0493426,121.5327147);

