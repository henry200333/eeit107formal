insert into chat_message_store(content,message_time,receiver,sender,user_display_name) values
('我4雅伊','2019-07-11 19:20:00','admin','artist001','ADMIN_BOT'),
('午餐吃什麼？','2019-07-11 19:20:00','admin','123','ADMIN_BOT'),
('隨便吧','2019-07-11 19:20:01','123','admin','112233'),
('滷肉飯','2019-07-11 19:20:02','admin','123','ADMIN_BOT'),
('有點油','2019-07-11 19:20:03','123','admin','112233'),
('那..小火鍋嗎','2019-07-11 19:20:04','admin','123','ADMIN_BOT'),
('很熱欸@@!','2019-07-11 19:20:05','123','admin','112233'),
('掰掰','2019-07-11 19:20:06','admin','123','ADMIN_BOT'),
('你生氣了噢','2019-07-11 19:20:07','123','admin','112233'),
('沒有阿','2019-07-11 19:20:08','admin','123','ADMIN_BOT'),
('你為什麼要生氣啊','2019-07-11 19:20:09','123','admin','112233'),
('我沒間考慮太久，隨便吃吃','2019-07-11 19:20:10','admin','123','ADMIN_BOT'),
('那就隨便吃阿','2019-07-11 19:20:11','123','admin','112233'),
('牛肉麵?','2019-07-11 19:20:12','admin','123','ADMIN_BOT'),
('你等我一下我有電話','2019-07-11 19:20:13','123','admin','112233'),
('還沒好嗎??','2019-07-11 19:50:14','admin','123','ADMIN_BOT'),
('啊!我朋友找我吃飯','2019-07-11 19:50:15','123','admin','112233'),
('我在餐廳了耶','2019-07-11 19:50:16','123','admin','112233'),
('刪好友吧^^','2019-07-11 19:50:17','admin','123','ADMIN_BOT'),
('......','2019-07-11 19:50:18','123','admin','112233'),
('人生短短幾個秋~','2019-07-11 19:50:19','admin','123','ADMIN_BOT'),
('請你喝蜂蜜檸檬？','2019-07-11 19:50:20','123','admin','112233'),
('可可可可可可可以喔','2019-07-11 19:50:21','admin','123','ADMIN_BOT'),
('算了，手頭有點緊，還是刪吧','2019-07-11 19:50:22','123','admin','112233');

INSERT INTO security_role(code) values
('ROLE_ADMIN'),
('ROLE_USER'),
('ROLE_ARTIST'),
('ROLE_VENDER');


 INSERT INTO security_user(account, password, display_name, member_name, photo, gender, mail, birth, address, tel, favorite_location, register_date, introduction, enabled, followers) values
('admin','$2a$10$CI.TCDqxdr8xAhnkCz9oyOViGnBG5iHFFxicjcRwJORbt1IzENR7G', 'ADMIN_BOT', 'Mr.Admin', '/resources/profile_image/admin.jpg', 'male', 'admin@admin', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im admin',  1, 0),
('123', '$2a$10$weN4FB8uqq1jpv/7HEPBDuYMuw2xbMCBGKx3xYfWk3Da/UoVFS/7W', '112233', 'OneTwoThree', '/resources/profile_image/123.jpg', 'male', '123@123', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im 123',  1, 0),
('artist001', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','桑源雅沂', '劉長軒', '/resources/profile_image/artist001.jpg', 'female', 'Liu0807@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Liu',  1, 86520),
('artist002', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','白賊虞', '李承宇', '/resources/profile_image/artist002.jpg', 'male', 'Lee0708@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Lee',  1, 30678),
('artist003', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','柳川鳳', '吳帆祥', '/resources/profile_image/artist003.jpg', 'male', 'Wu0102@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Wu',  1, 66666),
('artist004', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','張添財', '陳品堯', '/resources/profile_image/artist004.jpg', 'male', 'Chen0604@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Chen',  1, 98765),
('artist005', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','王芯營', '彭璿哲', '/resources/profile_image/artist005.jpg', 'male', 'Peng0911@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Peng',  1, 32548),
('artist006', '$2a$10$n8yvS9u7oftROmfhAsbQtejfz98C6Bgnfje6nkY88m6ua7iOiV9ai','敏敏', '李宜鳴', '/resources/profile_image/artist006.jpg', 'male', 'Min1211@gmail.com', '1989/01/01', '台北市大安區', '0912345678', '台北市', '2019/07/01', 'hi,im Min',  1, 12345),
('user001', '$2a$10$IB/9GXt3Gmm/tcIsd43Km.OAP9PvDYgFd5xOyrpefY.IsbVE/w7UK','User001','Pro User',  '/resources/profile_image/user001.jpg', 'female','user@gmail.com','1989/01/01','台北市萬華區','0912345678','高雄市','2019/06/30','hi,im user', 1, 0),
('deaduser', '$2a$10$ovBda/JPk8ZBNpfyqp7CZukgEFmon.kW/yLbdGciQhPd09CxNXdY2','No show','Cant see', '/resources/profile_image/deaduser.jpg', 'femail','death@gmail.com','1989/01/01','台北市大安區','0912345678','新竹市','2019/01/01','should never see this',0, 0);


ALTER TABLE user_role NOCHECK CONSTRAINT ALL;
INSERT INTO user_role(user_id, role_id) values
(1,1),(1,2),(1,3),(1,4),
(2,1),(2,2),(2,3),(2,4),
(3,2),(3,3),
(4,2),(4,3),
(5,2),(5,3),
(6,2),(6,3),
(7,2),(7,3),
(8,2),(8,3),
(9,2),
(10,2);
ALTER TABLE user_role CHECK CONSTRAINT ALL;


 
INSERT INTO article (name, content, article_type, ref_id, count, announce) values
('EZ5音樂餐廳徵求臨時鼓手一名', '### 簡述
2019/8/8 將於台北市EZ5音樂餐廳舉辦慈善表演，臨時需求鼓手一名，特此應徵。
### 聯絡方法
詳洽02-12345678，MR.口鳥先生
### 工作環境
![](http://www.ez5.com.tw/new/images/pic_brief.jpg)
### 薪資待遇
以時計酬，詳情面議', 'Vender', 1, 2, '2019-07-11 19:20:55'),
('陳忻玥新專輯！衝上排行第一！', '### 個人簡介
你/妳好！ 我的名字叫忻玥(ㄒㄧㄣ ㄩㄝ、)女聲 & 吉他 & 創作
Hello! I’m Vicky Chen.Singing & Playing guitar & Writing
### 找我演出
alex@skrpresents.com
![](https://i.kfs.io/artist/global/10012811,0v1/fit/300x300.jpg)', 'Performance', 1, 99, '2019-07-12 19:20:55'),
('白賊虞表示：發財', '# ~~發大財~~ 發財
------------
##### 路人A：
這個老頭是誰啊？
##### 路人B：
噓！安靜！他可是白賊虞！他有重大的事情要向我們宣布。
##### 白賊虞：
#### 發財！
發財發財發財發財發財發財發財發財發財發財發財，
發財。
### 發財！！！
##### 路人A：
我決定把此生獻給這位市長，赴湯蹈火在所不辭。

------------

![](https://i.imgur.com/31rorUq.jpg)', 'Artist', 2, 5, '2019-07-13 19:20:55'),
('柳川鳳在球場上穿梭自如', '# 柳川鳳在湖南對湘北的校際賽大展身手
![](http://b.zol-img.com.cn/desk/bizhi/image/1/960x600/1348714169293.jpg)
### 球場上旁若無人，穿梭自如
彷彿沒有模組間物體碰撞一般的移動。
### 怎麼辦到的？
更多自由移動機會？
#### 立即充值！', 'Artist', 3, 10, '2019-07-14 19:20:55'),
('《比悲傷更悲傷的故事》 催淚破億音樂裡藏的小彩蛋你發現了嗎？', '# 《比悲傷更悲傷的故事》 催淚破億音樂裡藏的小彩蛋你發現了嗎？
------------
#### 	　　由劉以豪（飾K）及陳意涵（飾Cream）主演的《比悲傷更悲傷的故事》改編自爆紅韓國電影，講述一對戀人相愛卻無法在一起的故事，浪漫催淚的劇情設定讓電影一出來便引起廣大關注，在台上映短短 9 天票房便破億，成為今年最快破億國片！
#### 	　　除了堅強卡司及動人劇情，音樂在其中更扮演著催化觀眾入戲的重要角色之一，電影原聲帶由知名製作人陳建騏及配樂家羅恩妮共同合作，將歡樂亦憂傷的歌曲旋律貫穿劇情，連帶讓觀眾深陷故事人物的情緒裡。', 'Performance', 2, 1, '2019-07-15 19:20:55'),
('GEM新歌《新的心跳》：舊事已過都變成新的', '![](https://i.ytimg.com/vi/-P5EtAF4TUA/hqdefault.jpg)
#### 	　　近日，基督徒歌手鄧紫棋發佈了新歌《新的心跳》MV，動感十足的歌曲著滲透濃濃的勵志信息。歌詞「我們死而復活......舊事已過都變成新的」出自《聖經》，流露信仰味道。
#### 	　　鄧紫棋在MV中扮演一個被校園欺凌的乖乖女，《新的心跳》寓意新的生命幫助她走出了欺凌陰影，MV中除了鄧紫棋，還有另外兩位主角，一個是帶著假肢的舞者，一個是對跳水很膽怯女孩。
#### 	　　她們都有被嘲笑，冷嘲熱諷的經歷。但是在努力不懈的練習下，假肢女孩舞出了美麗的舞蹈，跳水女孩展現了完美的跳躍。
#### 	　　MV進行到尾聲，小個子的鄧紫棋勇敢推開曾經欺凌自己的人，並回頭報以燦爛的笑臉。', 'Performance', 3, 3, '2019-07-16 19:20:55'),
('間諜小狗', '### 製作團隊將間諜小狗投放至野狗群中
#### 	　　間諜小狗能不能在第一次接觸被認定為同伴？
### 演員評價
#### 	　　想不到郭董也很有戲劇天分~~ ，在新的動物頻道中，郭董飾演間諜小狗，演技逼真，吃草認真
![](http://img.komicolle.org/2019-05/15578732626695.png)', 'Activity', 5, 4, '2019-07-17 19:20:55');
 
 insert into forum (ref_id, ref_comment_id, forum_board, user_name, comment, comment_date) values
 (1, 0,'Performance', '薔薔4', '大家好我是薔薔4', '2019/05/25 18:13:21'),
 (2, 1,'Activity', '博恩4', '我真有那麼尷尬嗎？4', '2019/05/22 13:50:02'),
 (2, 1,'Performance', '豬孝天', '流星雨揪團', '2006/03/04 13:14:55'),
 (2, 1,'Activity', '永和金城武', '不要再冒充我了！', '2019/05/28 20:00:27'),
 (2, 1,'Article', '大中天', '以前你偶爾聽，現在你應該天天聽', '2006/03/04 13:14:55'),
 (2, 1,'Article', '大平台', '我已經買了zzZ', '2019/05/28 20:00:27'); 
 
 INSERT INTO performance (title,introduction,youtube_url,update_time,activity_id,views,likes,dislikes,userp_id,username,gerne) values
 ('陳忻玥 Vicky Chen -【入土之前】','陳祈玥入土之前完整MV','https://www.youtube.com/watch?v=GfWkG4qedoE','2019/05/25 17:12:05',1,3000,200,10,3,'桑源雅沂','表演藝術'),
 ('A-Lin《有一種悲傷 A Kind of Sorrow》','ALIN最新歌曲有一種悲傷','https://www.youtube.com/watch?v=BRcudpJzy1I','2019/05/28 19:10:35',2,2150,180,5,4,'白賊虞','視覺藝術'),
 ('G.E.M.【再見 GOODBYE】鄧紫棋','鄧紫棋發燒歌曲再見，讓您聆聽','https://www.youtube.com/watch?v=Lhel0tzHE08','2019/05/18 21:05:46',3,160,20,1,5,'柳川鳳','創意藝術'),
 ('下午悠閒練習畫圖','休閒畫畫影片','https://www.youtube.com/watch?v=MHLjKQdfTb8','2019/05/30 17:45:52',1,100,70,1,5,'柳川鳳','表演藝術'),
 ('這群人 畢業後要幹嘛','讓你笑點大開，這群人又來了!!','https://www.youtube.com/watch?v=2pC8Jk2FDO4','2019/05/29 02:15:16',2,1912,30,5,6,'張添財','視覺藝術'),
 ('輪到你了SP','日本熱門懸疑劇輪到你了，女主角居然死掉了','https://www.youtube.com/watch?v=TBjykqBrhMg','2019/06/18 17:34:36',3,1100,75,46,5,'柳川鳳','創意藝術'),
 ('超級可愛的柴犬','可愛的柴犬讓你融化','https://www.youtube.com/watch?v=TxgYs4_29KI','2019/06/19 11:45:01',1,151100,7890,10,8,'敏敏','表演藝術'),
 ('阿滴開始健身了','瘦巴巴的阿滴居然開始健身了，究竟會怎麼樣呢','https://www.youtube.com/watch?v=SF8s3jVmiAs','2019/06/27 22:15:23',2,6400,590,17,5,'柳川鳳','視覺藝術'),
 ('暗殺教室S1 第21話','支持正版動畫，官頻廣告不略過，看好看滿才能看更多！','https://www.youtube.com/watch?v=wRs3z2Mr-uA','2019/07/18 15:151:22',7,212,71,2,7,'王芯營','視覺藝術');
 							
insert into  Vender (name,city,district,address,max_people,phone,lat,lng) values
('EZ5音樂餐廳','台北市','大安區','安和路二段211號',50,'0227383995',25.0260149,121.550337),
('Music Corner角落音樂餐廳','台北市','中山區',' 建國北路一段156號',40,'0225043688',25.0516328,121.5341573),
('LOTUS 音樂餐廳','台北市','中山區','長安東路二段78號',60,' 0223468888',25.0483426,121.5317147),
('HOOTERS美式餐廳','台北市','松山區','長安東路二段78號',55,'0227165168','25.0532667','121.54544720000001');

insert into  job (name,job_type,job_time,detal,reward,vender_name,city,district,address,vender_id) values
('誠徵鼓手一名','聽覺藝術','2019-07-15 12:00:00','經驗要求5年以上',1000,'EZ5音樂餐廳','台北市','大安區','安和路二段211號',1),
('誠徵吉他手一名','聽覺藝術','2019-07-16 12:00:00','經驗要求5年以上',1000,'EZ5音樂餐廳','台北市','大安區','安和路二段211號',1),
('誠徵搞笑演員一名','表演藝術','2019-07-17 12:00:00','有舞台經驗佳',1000,'EZ5音樂餐廳','台北市','大安區','安和路二段211號',1),
('誠徵魔術師','表演藝術','2019-07-20 17:00:00','需舞台魔術表演',2000,'Music Corner角落音樂餐廳','台北市','中山區',' 建國北路一段156號',2),
('誠徵街舞舞者','表演藝術','2019-07-19 12:00:00','經驗不限，需炒熱氣氛',3000,'LOTUS 音樂餐廳','台北市','中山區','長安東路二段78號',3),	
('誠徵幹話王','表演藝術','2019-07-19 12:00:00','愛亂講話，不會尷尬就好',20000,'LOTUS 音樂餐廳','台北市','中山區','長安東路二段78號',3);

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
('貓空纜車','台北市','文山區','新光路二段8號'),
('中華電信前廣場及長福橋','新北市','三峽區','民權街36號前廣場'),
('仁愛公園小音樂台','新北市','永和區','仁愛路244-1號'),
('中山藝術公園','新北市','三重區','新北大道1號'),
('二二八公園','新北市','三重區','忠孝路二段靠自強路'),
('三重綜合運動場','新北市','三重區','中正北路2號'),
('環保公園','新北市','三重區','集賢路與五華街口'),
('iFG遠雄購物中心','新北市','汐止區','新台五路一段93號'),
('淡水漁人碼頭','新北市','淡水區','觀海路199號1樓'),
('平溪分駐所波麗士天燈前廣場','新北市','平溪區','靜安路二段141號'),
('板橋大遠百','新北市','板橋區','新站路28號'),
('三鶯藝術村圓形廣場','新北市','鶯歌區','館前路300號'),
('三鶯陶花源','新北市','鶯歌區','館前路300號'),
('福容大飯店漁人碼頭及麗寶漁人碼頭廣場','新北市','淡水區','觀海路83'),
('板橋車站特定專用區站前廣場','新北市','板橋區','縣民大道二段7號'),
('新北市政府市民廣場','新北市','板橋區','中山路一段161號'),
('新北市立鶯歌陶瓷博物館','新北市','鶯歌區','文化路200 號'),
('林本源園邸','新北市','板橋區','西門街9號 '),
('新北市立十三行博物館','新北市','八里區','博物館路200號 '),
('新北市立黃金博物館','新北市','瑞芳區','金瓜石金光路8號 '),
('菁桐礦業生活館','新北市','平溪區','菁桐里菁桐街113號 '),
('三峽祖師廟前廣場','新北市','三峽區','長福街1號 '),
('平溪區民活動中心廣場','新北市','平溪區','石底里公園街17號 '),
('家樂福股份有限公司重新店戶外廣場','新北市','三重區','重新路5段654號 '),
('福德水車園區','新北市','三芝區','福德里八連溪旁 '),
('新莊文化藝術中心廣場','新北市','新莊區','中平路133號 '),
('中港厝休閒廣場','新北市','新莊區','中港路363號 '),
('樹林後站廣場','新北市','樹林區','後站街 '),
('南寮福德宮','新北市','樹林區','保安街二段45巷53號 '),
('福隆遊客中心前廣場','新北市','貢寮區','興隆街36號 '),
('海山捷運站廣場','新北市','土城區','樂利街16號 '),
('永寧捷運站廣場','新北市','土城區','中央路3段105號 '),
('新北市勞工活動中心前戶外廣場','新北市','五股區','五工六路9號 '),
('坪林老街','新北市','坪林區','坪林里坪林街79號 '),
('風箏公園','新北市','石門區','老梅里老梅社區 '),
('新北市客家文化園區','新北市','三峽區','隆恩街239號 '),
('碧潭風景區','新北市','新店區','新店路 '),
('青年公園主題園區活力廣場','新北市','新莊區','壽山路61號 '),
('坪林茶業博物館','新北市','坪林區','水德里水聳淒坑街19之1號 '),
('福壽公園','新北市','新莊區','福壽街與昌明街口 '),
('思賢公園','新北市','新莊區','自由街1號旁 '),
('玫瑰公園廣場','新北市','三重區','集美街112巷 '),
('猴硐煤礦博物園區','新北市','瑞芳區','猴硐路 '),
('錦和公園露天音樂台暨咖啡廣場(風光中和園區)','新北市','中和區','錦和路350號'),
('民享藝文特區','新北市','中和區','民享街 '),
('歷史文物館館前花園廣場','新北市','三峽區','中山路17號 '),
('烏來區綜合活動中心旁廣場','新北市','烏來區','烏來里烏來街34號 '),
('重陽公園','新北市','蘆洲區','集賢路221巷 '),
('林口社區運動公園','新北市','林口區','文化一路與仁愛路交叉口 '),
('根德水車園區','新北市','三芝區','古庄里台2線旁 '),
('枋寮夜市廟仔尾溝(綠林小徑)','新北市','中和區','枋寮街 '),
('鶯歌老街陶館藝術長廊','新北市','鶯歌區','重慶街95號 '),
('捷運淡水站北穿堂','新北市','淡水區','中正路1號 '),
('捷運淡水站南穿堂','新北市','淡水區','中正路1號 '),
('捷運淡水站10號廣場(站後公園)','新北市','淡水區','中正路1號 '),
('捷運淡水站捷運紀念碑北側廊道及站後廣場草坪','新北市','淡水區','中正路1號 '),
('汐止火車站秀峰路廣場','新北市','汐止區','信望里信義路1號 '),
('鶯歌火車站1樓大廳','新北市','鶯歌區','東鶯里文化路68號 '),
('觀音山遊客中心廣場','新北市','五股區','凌雲路三段130號 '),
('觀音山展示館前廣場','新北市','五股區','凌雲路三段130號 '),
('舊草嶺自行車隧道北口木棧板區','新北市','貢寮區','福隆段 '),
('汐止火車站前廣場（南昌路）','新北市','汐止區','信望里信義路1號 '),
('八二三紀念公園','新北市','中和區','中安街 '),
('文程廣場','新北市','泰山區','明志路2段 '),
('同興公園表演場','新北市','泰山區','仁愛路'),
('中山堂前空地','新北市','金山區','溫泉路2巷10號'),
('三芝遊客中心前瞭望廣場','新北市','三芝區','埔坪里埔頭坑164-2號'),
('金山遊客中心前廣場','新北市','金山區','磺港路171-2號'),
('瑠公公園廣場','新北市','新店區','中華路54巷'),
('435藝文特區','新北市','板橋區','中正路435號'),
('瑞芳火車站前區民休閒廣場','新北市','瑞芳區','龍潭里明燈路三段82號'),
('陽光運動園區','新北市','新店區','安業街'),
('蘆州區柳堤公園','新北市','蘆洲區','正義里光榮路及長榮路'),
('中港大排','新北市','新莊區','中華路2段17號'),
('北大特區竹街廣場','新北市','樹林區','學勤路300號'),
('中和區活水文化創意園區','新北市','中和區','中安街85號'),
('中和區環球中和店2F活動區','新北市','中和區','中山路三段122號'),
('中和區環球中和店1F民有公園','新北市','中和區','中山路三段122號'),
('板橋區環球板橋店2F戶外右大門(N.Y Begals)前方空地','新北市','板橋區','縣民大道二段7號2樓'),
('板橋區環球板橋店2F戶外左大門(山間堂餐廳)前方空地','新北市','板橋區','縣民大道二段7號2樓'),
('鶯歌老街陶館戶外舞台','新北市','鶯歌區','重慶街95號'),
('中和區公所前廣場','新北市','中和區','景平路634-2號'),
('瑞芳分局旁區民廣場','新北市','瑞芳區','明燈路三段25號');


INSERT INTO activity (name,artist,description,begin_time,end_time,perf_type,awesome_Num,usera_id,location_id) values
 ('裝銅人','桑源雅沂','裝了就硬幫幫','2019/03/28 12:03','2019/05/28 12:30','表演藝術',53,1,1),
 ('跳火圈','張添財','沒事就愛跳火圈','2019/02/22 23:35','2019/02/23 07:35','視覺藝術',109,4,2),
 ('唱情歌','張添財','在北車唱情歌','2019/07/14 07:35','2019/07/14 17:15','創意藝術',77,4,3),
 ('打工賺錢','柳川鳳','賺錢選粽痛','2019/06/27 23:35','2019/06/28 07:35','表演藝術',127,3,4),
 ('裝印地安人','白賊虞','One little two little three little indian..','2019/04/25 07:35','2019/05/01 17:15','表演藝術',203,2,5),
 ('裝銅人','桑源雅沂','裝了就硬幫幫','2019/03/28 12:03','2019/05/28 12:30','表演藝術',1,1,4),
 ('跳火圈','柳川鳳','沒事就愛跳火圈','2019/02/22 23:35','2019/02/23 07:35','視覺藝術',2,3,3),
 ('唱情歌','白賊虞','在北車唱情歌','2019/07/14 07:35','2019/07/14 17:15','創意藝術',3,2,2),
 ('打工賺錢','柳川鳳','賺錢選粽痛','2019/06/27 23:35','2019/06/28 07:35','視覺藝術',4,3,1),
 ('裝印地安人','桑源雅沂','One little two little three little indian..','2019/04/25 07:35','2019/05/01 17:15','視覺藝術',5,1,2);
 
ALTER TABLE friend NOCHECK CONSTRAINT ALL;
INSERT INTO friend (self_id , friend_id) values
(1,2),
(2,1),
(1,3),
(3,1);
ALTER TABLE friend CHECK CONSTRAINT ALL;