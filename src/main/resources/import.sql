INSERT INTO security_role(account, code) values
('admin', 'ROLE_ADMIN'),
('123', 'ROLE_USER');

INSERT INTO security_user(account, password, enabled) values
('admin','$2a$10$CI.TCDqxdr8xAhnkCz9oyOViGnBG5iHFFxicjcRwJORbt1IzENR7G', 1),
('123', '$2a$10$weN4FB8uqq1jpv/7HEPBDuYMuw2xbMCBGKx3xYfWk3Da/UoVFS/7W', 1);

INSERT INTO user_role(user_id, role_id) values
(1,1),
(2,1);

INSERT INTO article (name, content, article_type, ref_id, count) values
  ('EZ5音樂餐廳徵求臨時鼓手一名', '2019/8/8 將舉辦慈善表演，徵求鼓手一名，詳洽02-12345678，MR.口鳥先生', 'Vender', 1, 2),
  ('陳忻玥新專輯！衝上排行第一！', '你/妳好！ 我的名字叫忻玥(ㄒㄧㄣ ㄩㄝ、)女聲 & 吉他 & 創作Hello! I’m Vicky Chen.Singing & Playing guitar & Writing找我演出：alex@skrpresents.com', 'Performance', 1, 99),
  ('白賊虞表示：發財', '發財發財發財發財，發財發財發財發財發財發財發財發財，發財發財，發財！', 'Artist', 2, 5),
  ('柳川鳳在球場上穿梭自如', '更多自由移動機會？立即充值！', 'Artist', 3, 10),
  ('《比悲傷更悲傷的故事》 催淚破億音樂裡藏的小彩蛋你發現了嗎？', '由劉以豪（飾K）及陳意涵（飾Cream）主演的《比悲傷更悲傷的故事》改編自爆紅韓國電影，講述一對戀人相愛卻無法在一起的故事，浪漫催淚的劇情設定讓電影一出來便引起廣大關注，在台上映短短 9 天票房便破億，成為今年最快破億國片！除了堅強卡司及動人劇情，音樂在其中更扮演著催化觀眾入戲的重要角色之一，電影原聲帶由知名製作人陳建騏及配樂家羅恩妮共同合作，將歡樂亦憂傷的歌曲旋律貫穿劇情，連帶讓觀眾深陷故事人物的情緒裡。', 'Performance', 2, 1),
  ('GEM新歌《新的心跳》：舊事已過都變成新的', '近日，基督徒歌手鄧紫棋發佈了新歌《新的心跳》MV，動感十足的歌曲著滲透濃濃的勵志信息。歌詞「我們死而復活......舊事已過都變成新的」出自《聖經》，流露信仰味道。鄧紫棋在MV中扮演一個被校園欺凌的乖乖女，《新的心跳》寓意新的生命幫助她走出了欺凌陰影，MV中除了鄧紫棋，還有另外兩位主角，一個是帶著假肢的舞者，一個是對跳水很膽怯女孩。她們都有被嘲笑，冷嘲熱諷的經歷。但是在努力不懈的練習下，假肢女孩舞出了美麗的舞蹈，跳水女孩展現了完美的跳躍。MV進行到尾聲，小個子的鄧紫棋勇敢推開曾經欺凌自己的人，並回頭報以燦爛的笑臉。', 'Performance', 3, 3),
  ('間諜小狗', ' 想不到郭台銘，也很有戲劇天分~~ ，在新的動物頻道中，郭董飾演間諜小狗，演技逼真，吃草認真', 'Activity', 5, 4);
 
 insert into forum (ref_id, ref_comment_id, forum_board, user_name, comment, comment_date) values
 (1, 0,'Performance', '薔薔4', '大家好我是薔薔4', '2019/05/25 18:13:21'),
 (2, 1,'Activity', '博恩4', '我真有那麼尷尬嗎？4', '2019/05/22 13:50:02'),
 (2, 1,'Performance', '豬孝天', '流星雨揪團', '2006/03/04 13:14:55'),
 (2, 1,'Activity', '永和金城武', '不要再冒充我了！', '2019/05/28 20:00:27'),
 (2, 1,'Article', '大中天', '以前你偶爾聽，現在你應該天天聽', '2006/03/04 13:14:55'),
 (2, 1,'Article', '大平台', '我已經買了zzZ', '2019/05/28 20:00:27'); 
 INSERT INTO performance (title,introduction,youtube_url,update_time,activity_id,views,likes,unlikes) values
 ('陳忻玥 Vicky Chen -【入土之前】','陳祈玥入土之前完整MV','https://www.youtube.com/watch?v=GfWkG4qedoE','2019/05/25 17:12:05',1,3000,200,10),
 ('A-Lin《有一種悲傷 A Kind of Sorrow》','ALIN最新歌曲有一種悲傷','https://www.youtube.com/watch?v=BRcudpJzy1I','2019/05/28 19:10:35',2,2150,180,5),
 ('G.E.M.【再見 GOODBYE】鄧紫棋','鄧紫棋發燒歌曲再見，讓您聆聽','https://www.youtube.com/watch?v=Lhel0tzHE08','2019/05/28 21:05:46',3,1100,10,0);
 							
 
 INSERT INTO artist(name,fan_number,location) VALUES
 ('桑源雅沂',86520,'東京'),
 ('白賊虞',30678,'高雄市'),
 ('柳川鳳',66666,'神奈川'),
 ('張添財',98765,'自由新鎮'),
 ('張添財',32548,'鬼島'),
 ('敏敏',12345,'大都')
 
 

insert into  Vender (name,address,max_people,phone,lat,lng) values
('EZ5音樂餐廳','106台北市大安區安和路二段211號',50,'0227383995',25.0260149,121.550337),
('Music Corner角落音樂餐廳',' 104台北市中山區建國北路一段156號',40,'0225043688',25.0516328,121.5341573),
('LOTUS 音樂餐廳','78號長安東路二段中山區台北市10491',60,' 0223468888',25.0483426,121.5317147);

insert into  job (name,job_type,job_time,detal,vender_id) values
('誠徵鼓手一名','音樂','2019-07-15 12:00:00','經驗要求5年以上',1),
('誠徵吉他手一名','音樂','2019-07-16 12:00:00','經驗要求5年以上',1),
('誠徵搞笑演員一名','搞笑','2019-07-17 12:00:00','jason',1);


INSERT INTO Location (location_name,city,district,address) values
('北投公園','台北市','北投區','光明路、中山路'),
('捷運北投站','台北市','北投區','光明路1號'),
('捷運淡水站','新北市','淡水區','中正路1號'),
('捷運新北投站','台北市','北投區','大業路700號'),
('關渡河濱公園','台北市','北投區','關渡河濱公園'),
('士林市場藝文空間','台北市','士林區','基河路101號'),
('士林官邸公園','台北市','士林區','福林路60號'),
('天母運動公園音樂台','台北市','士林區','忠誠路二段77號'),
('捷運士林站','台北市','士林區','捷運士林站'),
('臺北市天文科學教育館','台北市','士林區','基河路363號'),
('臺北市兒童新樂園','台北市','士林區','承德路五段55號'),
('錢穆故居戶外庭園、人文茶坊','台北市','士林區','臨溪路72號'),
('大湖公園','台北市','內湖區','成功路五段31號'),
('大潤發內湖二店','台北市','內湖區','舊宗路一段188號'),
('成美右岸河濱公園','台北市','內湖區','成美右岸河濱公園'),
('成美左岸河濱公園','台北市','內湖區','成美左岸河濱公園'),
('港富里737音樂夜市','台北市','內湖區','內湖路一段737巷'),
('碧湖公園','台北市','內湖區','內湖路二段、內湖路二段103巷、環山路三段'),
('大佳河濱公園','台北市','中山區','大佳河濱公園'),
('花博公園公共空間','台北市','中山區','中山區玉門街1號'),
('花博公園原民風味館','台北市','中山區','中山北路三段151號'),
('美堤河濱公園','台北市','中山區','北安路400巷1弄10號'),
('美麗華百樂園','台北市','中山區','敬業三路20號'),
('美麗新廣場','台北市','中山區','北安路780號'),
('捷運中山站','台北市','中山區','南京西路16號'),
('捷運劍南路站','台北市','中山區','捷運劍南路站'),
('臺北市立美術館廣場','台北市','中山區','中山北路三段181號'),
('永樂廣場','台北市','大同區','迪化街一段23號'),
('迪化污水處理廠附設休閒運動公園','台北市','大同區','酒泉街235號'),
('捷運圓山站','台北市','大同區','酒泉街9之1號'),
('臺北當代藝術館','台北市','大同區','長安西路39號'),
('公民會館','台北市','信義區','松勤街50號'),
('台北101廣場','台北市','信義區','信義路五段7號'),
('市民廣場及市政大樓週邊場地街舞區','台北市','信義區','市府路1號'),
('松山文創園區','台北市','信義區','光復南路133號'),
('信義區香堤大道、威秀廣場','台北市','信義區','松壽路9號'),
('國立國父紀念館與中山公園','台北市','信義區','仁愛路四段505號'),
('大安森林公園','台北市','大安區','新生南路二段1號(2號、11號門入口)'),
('東區頂好廣場','台北市','大安區','大安路一段77號'),
('東區龍門廣場','台北市','大安區','忠孝東路四段124-13號'),
('捷運大安森林公園站','台北市','大安區','信義路三段100號'),
('捷運東區地下街','台北市','大安區','大安路一段77號'),
('二二八和平公園','台北市','中正區','懷寧街103號'),
('三創生活園區一樓廣場','台北市','中正區','市民大道三段2號'),
('中山堂廣場-國父銅像園區票友劇場','台北市','中正區','延平南路98號'),
('古亭河濱公園','台北市','中正區','思源街1號'),
('台北車站誠品站前K區地下街','台北市','中正區','臺北市中正區忠孝西路一段47號B1F'),
('自來水園區內各展演場地','台北市','中正區','思源街1號'),
('草山國際藝術村','台北市','中正區','北平東路7號'),
('捷運中正紀念堂站','台北市','中正區','羅斯福路一段8之1號'),
('臺北市四平商圈徒步區','台北市','中正區','四平陽光商圈'),
('臺北市青少年發展處','台北市','中正區','仁愛路一段17號'),
('臺北市站前地下街','台北市','中正區','市民大道一段100號'),
('臺北市臺北地下街','台北市','中正區','市民大道一段100號'),
('臺北當代工藝設計分館','台北市','中正區','南海路41號'),
('寶藏巖','台北市','中正區','汀州路三段230巷'),
('西門町行人徒步區','台北市','萬華區','漢中街、武昌街'),
('馬場町紀念公園','台北市','萬華區','水源路'),
('捷運西門站','台北市','萬華區','寶慶路32-1號'),
('艋舺公園','台北市','萬華區','捷運龍山寺站'),
('艋舺商旅','台北市','萬華區','廣州街247號'),
('臺北市立動物園','台北市','文山區','新光路二段30號'),
('貓空纜車','台北市','文山區','新光路二段8號');


INSERT INTO activity (name,artist,description,begin_time,end_time,awesome_Num,bad_Num,artist_id,location_id) values
 ('裝銅人','王世堅','裝了就硬幫幫','2019/03/28 12:03','2019/05/28 12:30',53,15,1,1),
 ('跳火圈','柯文哲','沒事就愛跳火圈','2019/02/22 23:35','2019/02/23 07:35',109,25,4,2),
 ('唱情歌','呂秀蓮','在北車唱情歌','2019/07/14 07:35','2019/07/14 17:15',77,35,4,3),
 ('打工賺錢','蔡英文','賺錢選粽痛','2019/06/27 23:35','2019/06/28 07:35',127,25,3,4),
 ('裝印地安人','郭台銘','One little two little three little indian..','2019/04/25 07:35','2019/05/01 17:15',203,35,2,5),
 ('裝銅人','王世堅','裝了就硬幫幫','2019/03/28 12:03','2019/05/28 12:30',53,15,1,4),
 ('跳火圈','柯文哲','沒事就愛跳火圈','2019/02/22 23:35','2019/02/23 07:35',109,25,3,3),
 ('唱情歌','呂秀蓮','在北車唱情歌','2019/07/14 07:35','2019/07/14 17:15',77,35,2,2),
 ('打工賺錢','蔡英文','賺錢選粽痛','2019/06/27 23:35','2019/06/28 07:35',127,25,3,1),
 ('裝印地安人','郭台銘','One little two little three little indian..','2019/04/25 07:35','2019/05/01 17:15',203,35,1,2);
