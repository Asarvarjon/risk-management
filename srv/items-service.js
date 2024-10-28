const cds = require("@sap/cds");

module.exports = cds.service.impl(async function(){

    const { Items } = this.entities;

    this.on("filterItems", async(req)=> {
        const { quantity } = req.data;
        const items = await cds.run(SELECT.from(Items).where({
            quantity
        }))

        return items;
    });

    this.on("createItem", async(req) => {
        const {title, quantity } = req.data;

        const newItem = await cds.run(INSERT.into(Items).entries({
            title, quantity
        }))

        return newItem
    })


    this.before("CREATE", Items, async(req) => {
        const { quantity } = req.data;

        if(quantity > 100) {
            return req.error(400, 'Quantity cannot be greater than 100')
        }
    })

})