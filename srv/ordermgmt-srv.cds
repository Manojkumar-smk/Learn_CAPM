using {com.htl.a1f6capm.db as a1f6db} from '../db/schema';

service OrderMgmtService {
    entity Products   as projection on a1f6db.Products;

    @odata.draft.enabled
    @Common.SideEffects:{
        SourceEntities : ['items'],
        TargetProperties : ['netPrice']
    }
    entity Orders     as projection on a1f6db.Orders;
    @Common.SideEffects:{
        SourceProperties : ['unitPrice', 'quantity'],
        TargetProperties : ['totalPrice']
    }
    entity OrderItems as projection on a1f6db.OrderItems;
}
