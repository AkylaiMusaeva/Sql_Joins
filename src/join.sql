--class theory sql joins in console
create table courses(
    id serial primary key ,
    course_name varchar,
    date_of_start date,
    duration int

                    );

create table mentors(
    id serial primary key ,
    first_name varchar,
    last_name varchar,
    email varchar,
    phone_number varchar,
    course_id int references courses(id)

);

insert into courses(course_name, date_of_start, duration) values
('Java','03-04-2023',9),
('JS','4-4-2023',6),
('English','3-6-2023',3);

insert into courses(course_name, date_of_start, duration) values
                                                              ('Soft_skill','1-04-2023',2);
insert into mentors(first_name, last_name, email, phone_number, course_id) VALUES
('Ulan','Kubanychbekov','ulan@gmail.com','+996772746565',1),
('Asan','Asanov','asan@gmail.com','+996552321457',2),
('Uson','Usonov','uson@gmail.com','+996772124578',3);
insert into mentors(first_name, last_name, email, phone_number) VALUES
('Datka','Datkova','datka@gmail.com','+996772116565');




select * from mentors;
select * from courses;
select * from mentors,courses;--cross join
select * from mentors inner join courses on mentors.course_id=courses.id;--inner join
select * from mentors inner join courses as c on mentors.course_id=c.id;--inner join with nickname
select * from mentors as m inner join courses as c on m.course_id=c.id;--inner join with 2 nicknames

select * from mentors right join courses as c on mentors.course_id=c.id;
select * from mentors full join courses c on c.id = mentors.course_id;
