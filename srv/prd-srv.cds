using {com.htl.a1f6capm.db as a1f6db} from '../db/schema';

service prdMgmtService {
            @odata.draft.enabled

    entity Products as
        projection on a1f6db.Products {
            *,
            case
                when Stock = 0
                     then 'Out of Stock'
                when Stock < 10
                     then 'Low Stock'
                else 'Available'
            end as status            : String,
            case
                when Stock = 0
                     then 1
                when Stock < 10
                     then 2
                else 3
            end as statusCriticality : Integer

        }
        actions {
            @Common.SideEffects: {TargetProperties: [
                'Stock',
                'status',
                'statusCriticality'
            ]}
            action AddStock(stock: Integer) returns String;
        }
}
