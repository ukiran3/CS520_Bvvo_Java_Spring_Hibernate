create sequence hibernate_sequence minvalue 1000;

    create table users (
        user_type 	varchar(31) not null,
        id 		integer not null primary key,
        city 		varchar(255) not null,
        email 		varchar(255) not null,
        f_name 		varchar(255) not null,
        l_name 		varchar(255) not null,
        password 	varchar(255) not null,
        st_address 	varchar(255),
        state 		varchar(255) not null,
        zip 		integer not null,
        expertise 	varchar(255),
        year 		integer
    );

    create table reviews (
        id		integer not null primary key,
        date 		date not null,
        knowledge 	integer not null,
        message 	varchar(255) not null,
        overall 	integer not null,
        service 	integer not null,
        title 		varchar(255) not null,
        lawyer_id 	integer,
        user_id 	integer
    );


insert into users values('user', 1, 'alhambra', 'kiran.uday', 'uday', 'bodi', 'qwerty','123456', 'CA', 91801, 'Criminal Law', 1989);

insert into users values('lawyer', 2, 'Los Angeles', 'cysun@calstatela.edu', 'Chengyu', 'Sun', 'abcd', '12345678', 'CA', 91801, 'Family Law', 2011);

insert into reviews values(1, '2013-09-11', 4, 'Hello everyone!', 4, 4, 'This is a review', 2, 1);