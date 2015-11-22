
    create table authorities (
        id int4 not null,
        authority varchar(255),
        username varchar(255),
        primary key (id)
    );

    create table reviews (
        id int4 not null,
        date timestamp,
        enabled boolean not null,
        knowledge int4 not null,
        message varchar(255),
        overall int4 not null,
        service int4 not null,
        title varchar(255),
        lawyer_id int4,
        user_id int4,
        primary key (id)
    );

    create table users (
        id int4 not null,
        expertise varchar(255),
        city varchar(255),
        enabled boolean not null,
        f_name varchar(255),
        l_name varchar(255),
        large_img bytea,
        password varchar(255),
        small_img bytea,
        st_address varchar(255),
        state varchar(255),
        user_type varchar(255),
        username varchar(255) not null,
        year int4,
        zip int4 not null,
        primary key (id)
    );

    alter table reviews 
        add constraint FK_57430253e6114c40a7461d9e9b4 
        foreign key (lawyer_id) 
        references users;

    alter table reviews 
        add constraint FK_d5795964a5af4a1081e25aba1e7 
        foreign key (user_id) 
        references users;

    create sequence hibernate_sequence;
