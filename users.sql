create table "posts"(
"id_post" SERIAL primary key,
"titulo" varchar,
"id_user" int,
"contenido" text
);

create table "usuarios"(
"id_user" SERIAL primary key,
"nombre" varchar,
"id_role" int,
"email" varchar,
"password" varchar
);

create table "roles"(
"id_role" SERIAL primary key,
"nombre" varchar
);

create table "lista_comentarios"(
"id_lista_comentario" SERIAL primary key,
"id_post" int,
"id_comentario" int
);

create table "comentarios"(
"id_comentario" SERIAL primary key,
"contenido" text,
"id_user" int
);

create table "lista_categorias"(
"id_lista_categorias" SERIAL primary key,
"id_post" int,
"id_categoria" int
);

create table "categorias"(
"id_categoria" SERIAL primary key,
"nombre" varchar
);

alter table posts add foreign key (id_user) references usuarios (id_user);
alter table usuarios add foreign key (id_role) references roles (id_role);
alter table lista_comentarios add foreign key (id_post) references posts (id_post);
alter table lista_comentarios add foreign key (id_comentario) references comentarios (id_comentario);
alter table lista_categorias add foreign key (id_post) references posts (id_post);
alter table lista_categorias add foreign key (id_categoria) references categorias (id_categoria);

insert into posts (titulo, id_user, contenido) values ('programa en la noche', 1, 'Lorem ipsum es el texto que se usa habitualmente en diseño gráfico en demostraciones de tipografías o de borradores de diseño para probar el diseño visual antes de insertar el texto final.' );
insert into categorias (nombre) values ('moda'), ('hogar'), ('religion'), ('musica');
insert into roles (nombre) values ('administrador'), ('usuario'), ('anonimo');
insert into usuarios (nombre, id_role, email, password) values ('Brad Pitt', 1, 'brad@gmail.com', '1234'),
('Marcelo Ibarra', 2, 'marcelo@gmail.com', '4321'), 
('Tere Pana', 3, 'tere@gmail.com', '5678'); 
insert into comentarios (contenido, id_user) values ('SU contenido es uy bueno, muy útil, pero carece de  ortografía', 2);
insert into lista_comentarios (id_post, id_comentario) values (1,1);
insert into lista_categorias (id_post, id_categoria) values (1,4);