create table channel (
  id bigint not null auto_increment,
  filename varchar(255),
  name varchar(255) not null,
  number int not null,
  user_id bigint,
  primary key (id)) engine=MyISAM;

create table user_role (
  user_id bigint not null,
  roles varchar(255)) engine=MyISAM;

create table users (
  id bigint not null auto_increment,
  activation_code varchar(255),
  active bit not null,
  email varchar(255) not null default '',
  firstname varchar(255) not null default '',
  lastname varchar(255) not null default '',
  password varchar(255) not null,
  username varchar(255) not null,
  dob DATE,
  gender varchar(255),
  primary key (id)) engine=MyISAM;

alter table channel
  add constraint channel_user_fk
foreign key (user_id) references users (id);

alter table user_role
  add constraint user_role_user_fk
foreign key (user_id) references users (id);