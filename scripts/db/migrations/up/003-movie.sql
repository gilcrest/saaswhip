create table demo.movie
(
    movie_id         uuid                     not null,
    extl_id          varchar(250)             not null,
    title            varchar(1000)            not null,
    rated            varchar(10),
    released         date,
    run_time         integer,
    director         varchar(1000),
    writer           varchar(1000),
    create_app_id    uuid                     not null,
    create_user_id   uuid,
    create_timestamp timestamp with time zone not null,
    update_app_id    uuid                     not null,
    update_user_id   uuid,
    update_timestamp timestamp with time zone not null,
    constraint movie_pk
        primary key (movie_id),
    constraint movie_create_user_fk
        foreign key (create_user_id) references demo.app_user
            deferrable initially deferred,
    constraint movie_update_user_fk
        foreign key (update_user_id) references demo.app_user
            deferrable initially deferred,
    constraint movie_create_app_fk
        foreign key (create_app_id) references demo.app
            deferrable initially deferred,
    constraint movie_update_app_fk
        foreign key (update_app_id) references demo.app
            deferrable initially deferred
);

alter table demo.movie
    owner to demo_user;

create unique index movie_extl_id_uindex
    on demo.movie (extl_id);
