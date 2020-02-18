create table product_likes (
  user_id bigint not null references usr,
  product_id bigint not null references product,
  primary key (user_id, product_id)
)