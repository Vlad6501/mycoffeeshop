create table hibernate_sequence (next_val bigint);
insert into hibernate_sequence values ( 1 );
insert into hibernate_sequence values ( 1 );

create table information (
    id bigint not null,
    email varchar(255),
    firstname varchar(255),
    lastname varchar(255),
    patronymic varchar(255),
    phone varchar(255),
    city varchar(255),
    address varchar(255),
    inf_id bigint,
    primary key (id)
);

create table user_role (
    user_id bigint not null,
    roles varchar(255)
    );

create table usr (
    id bigint not null,
    activation_code varchar(255),
    active bit not null,
    email varchar(255),
    password varchar(255) not null,
    username varchar(255) not null,
    primary key (id)
);

create table product (
    id bigint not null,
    category integer not null,
    check_discount bit not null,
    filename varchar(255) not null,
    number integer not null,
    price integer not null,
    discount integer not null,
    product_name varchar(255) not null,
    section integer not null,
    specification varchar(255) not null,
    primary key (id)
);

create table product_specification (
    id bigint not null,
    composition varchar(255),
    country varchar(255),
    manufacturer varchar(255),
    packaging varchar(255),
    recommended varchar(255),
    type varchar(255),
    validity varchar(255),
    weight varchar(255),
    prod_id bigint,
    primary key (id)
);

create table basket (
    id bigint not null,
    price integer not null,
    bask_id bigint,
    primary key (id)
);

create table basket_list (
    id bigint not null,
    check_add boolean,
    basket_id bigint,
    primary key (id)
);

create table basket_list_number_list(
    basket_list_id bigint not null,
    number_list    integer
);

create table basket_list_product_list (
    basket_list_id bigint not null,
    product_list bigint
);

create table orders (
    id bigint not null,
    date datetime,
    payment varchar(255),
    payment_method varchar(255),
    price integer not null,
    status varchar(255),
    ord_id bigint,
    primary key (id)
);

create table order_product_list (
    order_id bigint not null,
    product_list bigint
);

create table order_number_list (
    order_id bigint not null,
    number_list integer
);


alter table information add constraint information_user_fk foreign key (inf_id) references usr (id);

alter table product_specification add constraint product_specification_product_fk foreign key (prod_id) references product (id);

alter table user_role add constraint user_role_user_fk foreign key (user_id) references usr (id);

alter table basket add constraint basket_user_fk foreign key (bask_id) references usr (id);

alter table orders add constraint orders_user_fk foreign key (ord_id) references usr (id);

alter table order_product_list add constraint order_product_list_order_fk foreign key (order_id) references orders (id);

alter table order_number_list add constraint order_number_list_order_fk foreign key (order_id) references orders (id);

alter table basket_list add constraint basket_list_basket_fk foreign key (basket_id) references basket (id);

alter table basket_list_number_list add constraint basket_list_number_list_basket_list_fk foreign key (basket_list_id) references basket_list (id);

alter table basket_list_product_list add constraint basket_list_product_list_basket_list_fk foreign key (basket_list_id) references basket_list (id);
