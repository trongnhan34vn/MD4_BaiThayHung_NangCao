create table Product
(
    ProductID   int auto_increment
        primary key,
    ProductName varchar(255)    not null,
    Img         text            null,
    Description text            null,
    Price       float           not null,
    Quantity    int             not null,
    Status      bit default (1) null
);

