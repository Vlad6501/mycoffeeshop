insert into usr (id, active, password, username, email)
    values (1, true, '$2a$08$Hgepekisa27geJOggidcdenredIRs8lYQYUZsvApYMGHLqQmh.fO.', 'admin', 'vladklimenko65@gmail.com');

insert into information (id, email, firstname, lastname, patronymic, phone, inf_id)
    values (1, '', '', '', '', '', 1);

insert into user_role (user_id, roles)
    values (1, 'USER'), (1, 'ADMIN');