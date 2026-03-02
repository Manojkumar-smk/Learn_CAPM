const cds = require('@sap/cds');
const { results } = require('@sap/cds/lib/utils/cds-utils');

module.exports = class prdMgmtService extends cds.ApplicationService {
    init() {

        const { Products } = cds.entities('prdMgmtService');

        // this.on('CREATE',Products,async req=>{
        //     console.log("Required Request");
        //     console.log(req.data);
        //     await INSERT.into(Products).entries(req.data);
        // });

        this.before('CREATE', Products, async req => {
            console.log("This is Before Handler");
            console.log(req.data.discount);
            if (req.data.discount === null) {
                req.data.discount = 0;
            }
            console.log(req.data.discount);
        });

        this.after("READ", Products, results => {
            console.log("After Read Handler");
            console.log(results);
            for (var i = 0; i < results.length; i++) {
                var discount = results[i].discount;
                var price = results[i].price;
                var priceAfterDiscount = (100 - discount) / 100 * price;
                results[i].discount = priceAfterDiscount;

            }
        });

        return super.init()
    }
}