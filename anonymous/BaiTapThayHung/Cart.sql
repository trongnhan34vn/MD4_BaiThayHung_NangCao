create table Cart
(
    ProductId int not null,
    Quantity  int not null,
    constraint cart_ibfk_1
        foreign key (ProductId) references Product (ProductID)
);

create index ProductId
    on Cart (ProductId);

