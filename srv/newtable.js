// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function() {
//     const { Orders, OrderItems, OrderSummary } = this.entities;

//     this.on('populateOrderSummary', async (req) => {
//         const tx = cds.transaction(req);

//         try {
//             // Call the custom function
//             const result = await this.run({ 
//                 method: 'populateOrderSummary',
//                 data: {}
//             });

//             return result;
//         } catch (err) {
//             req.error(500, 'Failed to populate OrderSummary table');
//         }
//     });

//     this.on('populateOrderSummary', async () => {
//         const tx = cds.transaction();

//         try {
//             // Clear existing data
//             await tx.run(DELETE.from(OrderSummary));

//             // Retrieve data from Orders and OrderItems
//             const orders = await tx.run(SELECT.from(Orders));
//             const orderItems = await tx.run(SELECT.from(OrderItems));

//             // Combine and insert data into OrderSummary
//             const entries = [];
//             for (let order of orders) {
//                 const items = orderItems.filter(item => item.OrderID_ID === order.ID);
//                 for (let item of items) {
//                     entries.push({
//                         ID: cds.utils.uuid(),
//                         OrderID: order.ID,
//                         OrderDate: order.OrderDate,
//                         CustomerName: order.CustomerName,
//                         ProductName: item.ProductName,
//                         Quantity: item.Quantity,
//                         Price: item.Price,
//                         TotalAmount: item.Quantity * item.Price
//                     });
//                 }
//             }
//             console.log('Preparing entry:', entries);


//             if (entries.length > 0) {
//                 await tx.run(INSERT.into(OrderSummary).entries(entries));
//             }

//             await tx.commit();
//             return 'OrderSummary table populated successfully';
//         } catch (err) {
//             await tx.rollback();
//             return 'Failed to populate OrderSummary table';
//         }
//     });
// });


const cds = require('@sap/cds')
module.exports = cds.service.impl(function () {
    this.on('sleep', async () => {
    try {
        let dbQuery = ' Call "sleep"( )'
        let result = await cds.run(dbQuery, { })
        cds.log().info(result)
        return true
    } catch (error) {
        cds.log().error(error)
        return false
    }
    })
})
