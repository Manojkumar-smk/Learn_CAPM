using prdMgmtService as service from '../../srv/prd-srv';
annotate service.Products with @(
    UI.SelectionFields : [
        name,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : desc,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : Stock,
        },
        {
            $Type : 'UI.DataField',
            Value : status,
            Criticality : statusCriticality,
            CriticalityRepresentation : #WithIcon,
        },
    ],
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    },
    UI.LineItem #tableView : [
    ],
    UI.SelectionPresentationVariant #tableView1 : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem#tableView',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View 1',
    },
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : '',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'status',
            Target : '@UI.DataPoint#status',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product',
            ID : 'Product',
            Target : '@UI.FieldGroup#Product',
        },
    ],
    UI.FieldGroup #Product : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : desc,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : Stock,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
                Label : 'discount',
            },
            {
                $Type : 'UI.DataField',
                Value : image,
                Label : 'Image',
            },
        ],
    },
    UI.HeaderInfo : {
        TypeName : 'Product',
        TypeNamePlural : 'Products',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : desc,
        },
        ImageUrl : image,
    },
    UI.DataPoint #Stock : {
        $Type : 'UI.DataPointType',
        Value : Stock,
        Title : 'Stock',
    },
    UI.DataPoint #status : {
        $Type : 'UI.DataPointType',
        Value : status,
        Title : 'status',
        Criticality : statusCriticality,
    },
);

annotate service.Products with {
    name @Common.Label : 'Name';
    desc @Common.Label : 'Description';
    price @Common.Label : 'Price';
    discount @Commin.Label : 'Discount';
    Stock @Common.Label : 'Stock';
    status @Common.Label : 'Status'
};

