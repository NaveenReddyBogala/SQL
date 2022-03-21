CREATE TABLE table1 (
    id numeric,
    color VARCHAR(10)
);

CREATE TABLE table2 (
    id numeric,
    color VARCHAR(10)
);

INSERT INTO table1 (id, color)
VALUES (1, 'Red');

INSERT INTO table1 (id, color)
VALUES (2, 'Green');

INSERT INTO table1 (id, color)
VALUES (3, 'Blue');

INSERT INTO table1 (id, color)
VALUES (4, 'Purple');

-- insert data for the palette_b
INSERT INTO table2 (id, color)
VALUES (1, 'Green');

INSERT INTO table2 (id, color)
VALUES (2, 'Red');

INSERT INTO table2 (id, color)
VALUES (3, 'Cyan');

INSERT INTO table2 (id, color)
VALUES (4, 'Brown');


select * from table1;

select * from table2;

-- inner join
select table1.id,table1.color,table2.id,table2.color 
from table1 inner join table2
on table1.color=table2.color;

-- left join
select table1.id,table1.color,table2.id,table2.color 
from table1 left join table2
on table1.color=table2.color;

-- left join only left part
select table1.id,table1.color,table2.id,table2.color 
from table1 left join table2
on table1.color=table2.color
where table2.id is null;

-- right join 
select table1.id,table1.color,table2.id,table2.color
from table1 right join table2
on table1.color=table2.color;

-- right join only right part
select table1.id,table1.color,table2.id,table2.color 
from table1 left join table2
on table1.color=table2.color
where table1.id is null;

-- full outer join
select table1.id,table1.color,table2.id,table2.color
from table1 full outer join table2
on table1.color=table2.color;


