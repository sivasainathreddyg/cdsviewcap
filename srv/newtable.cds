using orderstable from '../db/newtable';
using { ORDER  } from '../db/newtable';

service CatalogService
{ 
    entity Orders as projection on orderstable.Orders;
    entity OrderItems as projection on orderstable.OrderItems;
    entity OrderSum as projection on ORDER;
}

