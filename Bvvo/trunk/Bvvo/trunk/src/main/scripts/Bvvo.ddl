
    create table reviews (
        id int4 not null,
        date timestamp,
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
        email varchar(255) not null,
        f_name varchar(255),
        l_name varchar(255),
        large_img bytea,
        password varchar(255),
        small_img bytea,
        st_address varchar(255),
        state varchar(255),
        user_type varchar(255),
        year int4 not null,
        zip int4 not null,
        primary key (id)
    );

    alter table reviews 
        add constraint FK_254a65edf1064134815986fc8b3 
        foreign key (lawyer_id) 
        references users;

    alter table reviews 
        add constraint FK_cbcaacd5b0d847eea0706c4d181 
        foreign key (user_id) 
        references users;

    create sequence hibernate_sequence;
