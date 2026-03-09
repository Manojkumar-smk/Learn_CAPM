using {com.htl.a1f6capm.db as a1f6db} from '../db/schema';

service storeAnalyticsService {

    entity storeWiseSales   as
        select from a1f6db.Orders {
            key storeName,
                cast(
                    sum(netPrice) as Decimal(9, 2)
                ) as totalSales,
        }
        group by
            storeName;

    entity productWiseSales as
        select from a1f6db.OrderItems {
            key product.ID,
                product.name as productName,
                cast(
                    sum(totalPrice) as Decimal(9, 2)
                )            as totalSales,
        }
        group by
            product.ID,
            product.name;

    entity LowstockAlert    as
        select from a1f6db.Products {
            key ID,
                name,
                Stock,
        }
        where
            Stock < 10;

    entity Top3Orders       as
        select from a1f6db.Orders {
            key ID,
                netPrice,
                customerName,
                storeName,
        }
        order by
            netPrice desc
        limit 3;

}
