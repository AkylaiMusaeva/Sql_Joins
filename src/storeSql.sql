--SqlJoins session(queries were written in pg.Admin(file Store.sql)) in new database sql_join
create table if not exists stores
(
    id           serial primary key,
    name         varchar,
    instagram    varchar,
    phone_number varchar,
    address      varchar
);

create table if not exists categories
(
    id         serial primary key,
    name       varchar
);

create table if not exists products
(
    id          serial primary key,
    name        varchar,
    description varchar(1000),
    price       decimal,
    store_id    int references stores (id),
    category_id int references categories(id)
    );

create table if not exists clients
(
    id           serial primary key,
    full_name    varchar,
    inn          varchar,
    email        varchar unique ,
    phone_number integer,
    balance      integer
);


create table if not exists feedbacks
(
    id         serial primary key,
    image      varchar,
    description varchar(1000),
    client_id  int references clients (id),
    product_id int references products (id)
    );

create table if not exists product_client
(
    id         serial primary key,
    product_id int references products (id),
    client_id  int references clients (id)
    );
INSERT INTO stores (name, instagram, phone_number, address)
VALUES
    ('Amin Trading', 'amin_trading', null, 'Jibek Jolu 112'),
    ('Asia', 'asia_kg', '555-32-33-23', 'Vostok-5'),
    ('Globus', 'globus_start', '700-32-11-21', 'Bishkek'),
    ('Brand Mix', 'brand_bishkek', null, 'Italy'),
    ('Gadget', 'gadget_store', '555555555', 'Russia'),
    ('Toyota', 'toyota_kg', '666666666', '7 mkr'),
    ('Market Store', 'market_store', '777777777','Pokrovka'),
    ('Narodnyi', null, '888888888', 'Naryn'),
    ('Mashina_kg', 'mashina_kg', '999999999', 'Seul'),
    ('Fix price', null, '000000000', 'Home');

INSERT INTO categories (name)
VALUES
    ('juice'),
    ('car'),
    ('smartphone'),
    ('vegetables');

INSERT INTO products (name, description, price, store_id,category_id)
VALUES
    ('Hyunday Solaris', 'car store', 15000, 1,2),
    ('Coca-Cola', 'juice', 50.99, 2,1),
    ('Hyunday Sonata', 'best car', 60.99, null,2),
    ('Samsung', 'Description 7', 70.99, 7,3),
    ('Iphone', 'Description 8', 80.99, 7,3),
    ('Fanta', 'juice', 90.99, 2,null),
    ('Toyota', 'cars', 100.99, 6,2),
    ('Potatoes', 'Description 11', null, 8,4),
    ('tomato', 'Description 12', 120.99, 8,4),
    ('Tv', null, 130.99, null,null);

-- clients 10

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Sadyr Japarov', '123456789', 'sadyr@example.com', 12345678, 1000);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Aigul Japarova', '987654321', 'aigul@example.com', 98765432, 2000);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Manas Baidulaev', '456789123', 'manas@example.com', 45678912, 5000);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Aizada Jamgyrchyeva', '123456789', 'aizada@example.com', 12345670, 1500);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Daniel Gafurov', '987654321', 'daniel@example.com', 98765430, 2300);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Akylai Musaeva', '456789123', 'akylai@example.com', 45678910, 5500);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Baktulan Nazirbek uulu', '123456789', 'baktulan@example.com', 12345890, 100);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Aikezhan Akmatova', '987654321', 'aikezhan@example.com', 98765410, 200);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Januzak Anashov', '456789123', 'januzak@example.com', 45678930, 50);

INSERT INTO clients (full_name, inn, email, phone_number, balance)
VALUES ('Symbatai Rakibova', '456789123', 'symbatai@example.com', 45678230, 500);


-- feedbacks 12

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image1.jpg', 'Feedback for Product 1', 1, 1);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image2.jpg', 'Feedback for Product 2', 1, 2);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product 3', 2, 3);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image1.jpg', 'Feedback for Product 4', 1, 4);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image2.jpg', 'Feedback for Product 6', 1, 6);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product 1', 4, 1);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image1.jpg', 'Feedback for Product 7', 4, 7);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image2.jpg', 'Feedback for Product 5', 5, 5);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product 10', 7, 10);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image1.jpg', 'Feedback for Product 10', 10, 10);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image2.jpg', 'Feedback for Product 7', 10, 7);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product 3', 7, 7);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product ', null, null);

INSERT INTO feedbacks (image, description, client_id, product_id)
VALUES ('image3.jpg', 'Feedback for Product ', null, null);


-- product_client 16

INSERT INTO product_client (product_id, client_id)
VALUES (10, 1);

INSERT INTO product_client (product_id, client_id)
VALUES (10, 10);

INSERT INTO product_client (product_id, client_id)
VALUES (10, 5);

INSERT INTO product_client (product_id, client_id)
VALUES (6, 1);

INSERT INTO product_client (product_id, client_id)
VALUES (6, 7);

INSERT INTO product_client (product_id, client_id)
VALUES (2, 2);

INSERT INTO product_client (product_id, client_id)
VALUES (3, 4);

INSERT INTO product_client (product_id, client_id)
VALUES (5, 6);

INSERT INTO product_client (product_id, client_id)
VALUES (7, 8);

INSERT INTO product_client (product_id, client_id)
VALUES (2, 1);

INSERT INTO product_client (product_id, client_id)
VALUES (9, 1);

INSERT INTO product_client (product_id, client_id)
VALUES (4, 7);

INSERT INTO product_client (product_id, client_id)
VALUES (8, 8);

INSERT INTO product_client (product_id, client_id)
VALUES (3, 2);

INSERT INTO product_client (product_id, client_id)
VALUES (3, 1);

INSERT INTO product_client (product_id, client_id)
VALUES (10, 2);
--1 Суроо: Бардык продукталарды аларга тиешелүү дүкөн маалыматы менен бирге алыңыз.
select products.name,s.* from products join stores as s on products.store_id=s.id;

--2 Суроо: Белгилүү бир продукт боюнча комментарий берген кардарларды алыңыз.
select p.name,feedbacks.description,full_name from feedbacks join clients as c on feedbacks.client_id=c.id
                                                             join products as p on feedbacks.product_id=p.id;

--3 Суроо: Бардык дүкөндөрдүн аталыштарын жана алардын Instagram туткаларын чыгарып алыңыз.
select name,instagram from stores;

--4 Суроо: Белгилүү бир кардардын жалпы балансын толук аты менен бирге алыңыз.
select balance,full_name from clients where id=2;

--5 Суроо: Белгилүү бир категорияга тиешелүү бардык продукталарды алуу.
select category_id,c.name,products.name from products join categories as c on products.category_id=c.id where category_id=4;

--6 Суроо: Белгилүү бир суммадан ашык балансы бар кардарларды алыңыз.
select * from clients where balance>1500;

--7 Суроо: Бардык пикирлер үчүн продукттун сүрөттөлүшүн жана кардардын толук атын чыгарып алыңыз.
select description,full_name from feedbacks join clients as c on feedbacks.client_id=c.id;

--8 Суроо: Белгилүү бир продукт үчүн дүкөндөрдун дарегин алыңыз.
select products.name,address from products join stores as s on products.store_id=s.id ;

--9 Суроо: Сатып алган кардарлардын электрондук почталарын чыгарып алыңыз.
select email from product_client join clients as c on product_client.client_id=c.id;
--10 Суроо: Белгилүү бир дүкөндө бардык продукталардын орточо баасын алыңыз.
select ceil(avg(price)) from products where store_id=1;
--11 Суроо: Бардык дүкөндөрдүн аталышын жана алардагы товарлардын санын алыңыз
select s.name,count(store_id) from products full join stores as s on products.store_id=s.id
group by s.name;
--12 Суроо: Продукт аталыштарын жана алардын тиешелүү категорияларын алыңыз.
select p.name,c.name from products as p join categories as c on p.category_id=c.id;
--13 Суроо: Белгилүү бир продуктуну сатып алган кардарларды алыңыз.
select name,full_name from product_client join products as p on product_client.product_id=p.id
                                          join clients  as c on product_client.client_id=c.id
where product_id=2 ;
--14 Cуроо: Ар бир продукт үчүн сын-пикирлердин санын алыңыз.
select description,count(product_id)from feedbacks group by description,product_id;
--15 Суроо: Дүкөн жана алардан сатып алган кардарлар тууралуу маалымат алыңыз.
select stores.name,full_name,product_id,inn,email,clients.phone_number,balance
from product_client as pc join clients on pc.client_id=clients.id
                          join products on pc.product_id=products.id
                          join stores on products.store_id=stores.id;
--16 Суроо: Белгилүү бир дүкөн үчүн товардын аталыштарын жана тиешелүү бааларды алыңыз.
select stores.name as store_name,products.name as product_name,price from products
                                                                              join stores on products.store_id=stores.id  where store_id=2;
--17 Суроо: Тиешелүү кардар электрондук почта дареги менен бирге пикир алуу.
select full_name,email,description from feedbacks join clients as c on feedbacks.client_id=c.id order by feedbacks.id;
--18 Суроо: Продукциялардын аталыштарын жана алар жөнүндө сын-пикирлердин санын билип алыңыз.
select p.name,count(product_id) from feedbacks join products as p on feedbacks.product_id=p.id
group by p.name;

--19 Суроо: Дүкөндүн атын жана бул дүкөндөн сатып алган кардарлардын жалпы балансын алыңыз.
select s.name as store_name,sum(c.balance) from product_client    join products as p on product_client.product_id=p.id
                                                                  join stores   as s  on p.store_id=s.id
                                                                  join clients as c on product_client.client_id=c.id
group by s.name;

--20 Суроо: Продукт аталыштары менен бирге сын-пикирлерди берген кардарларды алыңыз.
select p.name,c.full_name from feedbacks join products as p on feedbacks.product_id=p.id
                                         join clients as c on feedbacks.client_id=c.id order by feedbacks.id;

--21 Суроо: Белгилүү бир категориядагы бардык продукталарды сатып алган кардарларды чыгарыңыз.
select c.full_name,ct.name from feedbacks join clients as c on feedbacks.client_id=c.id
                                          join products as p on  feedbacks.product_id=p.id
                                          join categories as ct on p.category_id=ct.id where ct.name='car';

--22 Суроо: Дүкөндөрдүн аталыштарын жана ар бир дүкөндөн сатып алган кардарлардын орточо балансын алыңыз.
select s.name as store_name,sum(balance) from product_client  join products as p on product_client.product_id=p.id
                                                              full join stores   as s  on p.store_id=s.id
                                                              full join clients as c on product_client.client_id=c.id
group by s.name;




--23 Суроо: Белгилүү бир баадагы продукталарды сатып алган кардарларды чыгарыңыз.
select clients.full_name,price from product_client join clients on product_client.client_id=clients.id
                                                   join products on product_client.product_id=products.id
where price=50.99;

--24 Суроо: Продукцияларды жана аларга тиешелүү комментарийлердин сүрөттөрүн алыңыз.
select p.name,feedbacks.image from feedbacks join products as p on feedbacks.product_id=p.id;
--25 Суроо: Бир нече продуктыларды сатып алган кардарларды чыгарыңыз.
select full_name,count(product_client.client_id) from product_client join clients on product_client.client_id=clients.id
group by full_name,product_client.client_id having count(product_client.client_id)>1;

--26 Суроо: Продукт аталыштарын жана алардын орточо комментарийлерин рейтингдерин алыңыз.
alter table feedbacks add rating int;
update feedbacks set rating=6 where id=12;
select product_id,p.name,round(avg(rating),2) from feedbacks join products as p on feedbacks.product_id=p.id group by product_id,p.name;

--27 Суроо: Эң кымбат товарды сатып алган кардарларды чыгарыңыз.
select client_id,clients.full_name,price from product_client join clients on product_client.client_id=clients.id
                                                             join products on product_client.product_id =products.id
where price =(select max(price)from product_client join products on product_client.product_id =products.id);

--28 Суроо: Ар бир продукт үчүн продукт аталыштарын жана комментарийлердин жалпы санын алыңыз.
select p.name,count(product_id) from feedbacks right join products as p on feedbacks.product_id=p.id
group by p.name,product_id;

--29 Суроо: Белгилүү бир дүкөндөн продуктыларды сатып алган кардарларды чыгарып алыңыз.
select s.name as store_name,c.full_name,p.name as product_name from feedbacks join clients as c on feedbacks.client_id=c.id
                                                                              join products as p on feedbacks.product_id=p.id
                                                                              join product_client as pc on feedbacks.client_id=pc.id
                                                                              join stores as s on p.store_id=s.id where store_id=7;
--30 Суроо: Комментарийлери жок продукталарды алыңыз.
select p.name from feedbacks full join  products
    as p on feedbacks.product_id=p.id group by p.name having count(product_id)=0;

