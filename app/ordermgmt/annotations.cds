using OrderMgmtService as service from '../../srv/ordermgmt-srv';
annotate service.Orders with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Customer Name',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Customer Mobile',
                Value : customerMobile,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Store Name',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Net Price',
                Value : netPrice,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Orders Details',
            ID : 'Orders',
            Target : '@UI.FieldGroup#Orders',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Item Details',
            ID : 'ItemDetails',
            Target : 'items/@UI.LineItem#ItemDetails',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer Name',
            Value : customerName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Customer Mobile',
            Value : customerMobile,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Store Name',
            Value : storeName,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Net Price',
            Value : netPrice,
        },
    ],
    UI.SelectionFields : [
        ID,
        customerName,
        storeName,
        netPrice,
    ],
    UI.HeaderInfo : {
        TypeName : 'Header',
        TypeNamePlural : 'Headers',
        Title : {
            $Type : 'UI.DataField',
            Value : customerName,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    },
    UI.DataPoint #storeName : {
        $Type : 'UI.DataPointType',
        Value : storeName,
        Title : 'Store Name',
    },
    UI.DataPoint #createdBy : {
        $Type : 'UI.DataPointType',
        Value : createdBy,
        Title : 'Created By',
    },
    UI.DataPoint #customerName : {
        $Type : 'UI.DataPointType',
        Value : customerName,
        Title : 'Customer Name',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeName',
            Target : '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'createdBy',
            Target : '@UI.DataPoint#createdBy',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'customerName',
            Target : '@UI.DataPoint#customerName',
        },
    ],
    UI.FieldGroup #Orders : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : customerName,
            },
            {
                $Type : 'UI.DataField',
                Value : customerMobile,
                Label : 'customer Mobile',
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
        ],
    },
);

annotate service.Orders with {
    ID @Common.Label : 'ID'
};

annotate service.Orders with {
    customerName @Common.Label : 'Customer Name'
};

annotate service.Orders with {
    storeName @Common.Label : 'Store Name'
};

annotate service.Orders with {
    netPrice @(
        Common.Label : 'Net Price',
        Common.FieldControl : #ReadOnly,
    )
};

annotate service.OrderItems with @(
    UI.LineItem #ItemDetails : [
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'Order ID',
        },
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'Product ID',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'Unit Price',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'Quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'Total Price',
        },
    ]
);

annotate service.OrderItems with {
    product @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Products',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : product_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'price',
                    LocalDataProperty : unitPrice,
                },
                {
                    $Type : 'Common.ValueListParameterOut',
                    ValueListProperty : 'discount',
                    LocalDataProperty : discount,
                },
            ],
            Label : 'Select Product',
        },
        Common.ValueListWithFixedValues : false,
)};

annotate service.Products with {
    ID @Common.Text : name
};



