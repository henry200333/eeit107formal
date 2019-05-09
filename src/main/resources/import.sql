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