USE SeaOtter;

DROP TABLE anime;
CREATE TABLE anime (
id integer primary key,
name varchar(30),
release_date date,
genre varchar(20),
episode integer,
);

INSERT INTO anime values (1,'命運石之門','2011-04-05', '科幻', 23);
INSERT INTO anime values (2,'魔法少女小圓','2011-01-06', '致鬱', 12);
INSERT INTO anime values (3,'我的英雄學院-第一季','2016-04-03', '冒險', 13);
INSERT INTO anime values (4,'路人超能100','2016-07-12', '冒險', 13);
INSERT INTO anime values (5,'動物朋友','2017-01-10', '日常', 13);

DROP TABLE artists;
CREATE TABLE artists (
id integer IDENTITY(1,1) primary key,
name varchar(30),
join_time datetime,
manager integer,
);

INSERT INTO artists values ('管理員1', '2019-5-10 23:50:00', 1);
INSERT INTO artists values ('周杰倫', '2019-5-11 13:12:05', 0);
INSERT INTO artists values ('蔡依林', '2019-5-12 09:10:34', 0);
INSERT INTO artists values ('王心凌', '2019-5-13 21:55:22', 0);