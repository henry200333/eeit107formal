  INSERT INTO article (name, context, type, ref_id) values
  ('發大財', '我們的最終目標就是要"發大財"', 1, 100),
  ('經濟0分', '政治100分，經濟0分', 1, 105),
  ('AI贏過放射專家', '肺癌預測的人機對決 谷歌AI贏過6位放射專家', 2, 200);
  
 insert into forum (id, board, name, context, comment_date) values
 (1, 1, '薔薔', '大家好', '2019/05/25 18:13:21'),
 (2, 1, '博恩', '我真有那麼尷尬嗎？', '2019/05/22 13:50:02');
 
 INSERT INTO performance (id,name,youtube_url,update_time,activity_id) values
 (1,'中正紀念堂舞蹈表演','www.youtube.com','2019/05/25 17:12:05',1),
 (2,'自家餵狗秀','www.youtube.com','2019/05/28 19:10:35',1),
 (3,'倒立30分鐘','www.youtube.com','2019/05/28 21:05:46',1);
 
 INSERT INTO artist(id,name,fan_number,location) VALUES
 (1,'口鳥鳴',1314,'資策會'),
 (2,'柳常玄',30678,'台北市'),
 (3,'杳堯要咬瑤',6666,'高雄市');
 
 INSERT INTO activity (activity_id,name,artist,begin_time,end_time) values
 (1,'吃飯','王世堅','2019/05/28 12:03:04','2019/05/28 12:30:08'),
 (2,'睡覺','柯文哲','2019/05/29 23:35:16','2019/05/30 07:35:47'),
 (3,'打東東','韓國瑜','2019/05/30 07:35:48','2019/06/03 17:15:46');
