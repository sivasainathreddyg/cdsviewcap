using orderstable from '../db/newtable';
using { ORDER  } from '../db/newtable';
using { DiscountedOrders } from '../db/newtable';
using { SALESORDER } from '../db/newtable';


service CatalogService
{ 
    entity Orders as projection on orderstable.Orders;
    entity OrderItems as projection on orderstable.OrderItems;
    entity OrderSum as projection on ORDER;
    entity DiscountedOrder as projection on DiscountedOrders;
    entity SALESORDERs as projection on SALESORDER;
    function sleep() returns Boolean;
}

