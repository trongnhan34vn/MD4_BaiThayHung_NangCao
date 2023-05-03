create table Cart
(
    ProductId int not null,
    Quantity  int not null,
    CartID    int auto_increment
        primary key,
    constraint cart_ibfk_1
        foreign key (ProductId) references Product (ProductID)
);

create index ProductId
    on Cart (ProductId);

