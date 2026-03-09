namespace com.htl.a1f6capm.db;

using { cuid, managed } from '@sap/cds/common';


entity Products : cuid {
        name     : String(30) @mandatory;
        desc     : String(50) @mandatory;
        price    : Decimal(9, 2) @mandatory;
        discount : Integer;
        Stock    : Integer @mandatory;
        image    : LargeBinary @Core.MediaType : 'image/jpeg' ;
}

entity Orders : cuid, managed{
    customerName : String(30) @mandatory;
    customerMobile : String(10);
    storeName : String @mandatory;
    netPrice : Decimal(9,2);
    items : Composition of many OrderItems on items.order = $self;
}

entity OrderItems : cuid {
    order : Association to Orders;
    product : Association to Products @mandatory;
    quantity : Integer @mandatory;
    discount : Integer;
    unitPrice : Decimal(9,2);
    totalPrice : Decimal(9,2);
}