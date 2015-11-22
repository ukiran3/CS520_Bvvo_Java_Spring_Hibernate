create sequence hibernate_sequence minvalue 1000;

    create table users (
        user_type 	varchar(255) not null,
        id 		integer not null primary key,
        city 		varchar(255) not null,
        username 	varchar(255) unique not null,
        f_name 		varchar(255) not null,
        l_name 		varchar(255) not null,
        enabled 	boolean default true,
        password 	varchar(255) not null,
        st_address 	varchar(255),
        small_img	bytea,
        large_img	bytea,
        state 		varchar(255) not null,
        zip 		integer not null,
        expertise 	varchar(255),
        year 		integer
    );

    create table reviews (
        id		integer not null primary key,
        date 		timestamp not null,
        knowledge 	integer not null,
        message 	varchar(255) not null,
        overall 	integer not null,
        service 	integer not null,
        title 		varchar(255) not null,
        lawyer_id 	integer,
        enabled		boolean,
        user_id 	integer
    );
  
  select * from users;