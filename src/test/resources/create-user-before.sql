delete from user_role;
delete from information;
delete from usr;

insert into usr(id, username, password, active) values
(1, 'admin', '$2a$08$Hgepekisa27geJOggidcdenredIRs8lYQYUZsvApYMGHLqQmh.fO.', true),
(2, 'vlad', '$2a$08$Hgepekisa27geJOggidcdenredIRs8lYQYUZsvApYMGHLqQmh.fO.', true);

insert into information (id, email, firstname, lastname, patronymic, phone, city, address, inf_id)values
(1, '', '', '', '', '', '', '', 1),
(2, 'vlad@gmail.com', 'firstname', 'lastname', 'patronymic', '0661234567', 'Kiev', '58', 2);

insert into user_role(user_id, roles) values
(1, 'ADMIN'), (1, 'USER'),
(2, 'USER');