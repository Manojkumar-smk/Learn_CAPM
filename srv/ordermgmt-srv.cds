using {com.htl.a1f6capm.db as a1f6db} from '../db/schema';

service OrderMgmtService {
    entity Products   as projection on a1f6db.Products;

    @odata.draft.enabled
    entity Orders     as projection on a1f6db.Orders;

    entity OrderItems as projection on a1f6db.OrderItems;
}
