const cds = require('@sap/cds');
const { executeHttpRequest, getDestination } = require('@sap-cloud-sdk/connectivity');

module.exports = cds.service.impl(async function() {


  this.on('callOnpremise', async () => { 
   
    const destination = await cds.connect.to('OnPremiseExpressApp');
 
    const response = await destination.get('/on-premise');   
    return response;
  });

  this.on('callNorthwind', async (req) => {
    const externalService = await cds.connect.to('northwind');
    
    const products = await externalService.run(
        SELECT.from('Products').columns(
          '*', 
          'Category',  
          'Order_Details',  
          'Supplier'  
        )
      );
    return products;
  });
});
