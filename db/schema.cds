namespace com.htl.a1f6capm.db;

using { cuid, managed } from '@sap/cds/common';


entity Products : cuid {
        name     : String(30);
        desc     : String(50);
        price    : Decimal(9, 2);
        discount : Integer;
        Stock    : Integer;
        image    : LargeBinary @Core.MediaType : 'image/jpeg' ;
}

entity Orders : cuid, managed{
    customerName : String(30);
    customerMobile : String(10);
    storeName : String;
    netPrice : Decimal(9,2);
    items : Composition of many OrderItems on items.order = $self;
}

entity OrderItems : cuid {
    order : Association to Orders;
    product : Association to Products;
    quantity : String;
    discount : String;
    unitPrice : Decimal(9,2);
    totalPrice : Decimal(9,2);
}