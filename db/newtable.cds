context orderstable {

    entity Orders {
        key ID           : UUID;
            OrderDate    : Date;
            CustomerName : String(100);
            TotalAmount  : Decimal(15, 2);
            Items        : Composition of many OrderItems
                               on Items.OrderID = $self;
    }

    entity OrderItems {
        key ID          : UUID;
            ProductName : String(100);
            Quantity    : Integer;
            Price       : Decimal(15, 2);
            OrderID     : Association to Orders;
    }

    entity SalesOrders {
        key OrderID      : UUID;
            CustomerName : String;
            OrderDate    : Date;
            ProductID    : Int16;
            Quantity     : Int16;
            TotalAmount  : Int16;
    }

    entity ProductInfo {
        key ProductID   : Int16;
            ProductName : String;
            Category    : String
    }

    entity SALES_VIEW{
        REGION :String;
        SALES_AMOUNT:Int16;
        CUSTOMER:String;
    }
}

@cds.persistence.exists
@cds.persistence.table
entity ORDER {
    key OrderID      : UUID;
        OrderDate    : Date;
        CustomerName : String(100);
        PRODUCTNAME  : String(100);
        Quantity     : Integer;
        Price        : Decimal(15, 2);
        TotalAmount  : Decimal(15, 2);
}


entity DiscountedOrders {
    OrderID        : UUID;
    OrderDate      : Date;
    CustomerName   : String(100);
    ProductName    : String(100);
    Quantity       : Integer;
    Price          : Decimal(15, 2);
    TotalAmount    : Decimal(15, 2);
    DiscountAmount : Decimal(15, 2);
}

@cds.persistence.exists
@cds.persistence.calcview
entity SALESORDER {
    CustomerName : String(100);
    OrderDate    : Date;
    ProductID    : Int16;
    Quantity     : Integer;
    TotalAmount  : Int16;
    ProductName  : String;
    Category     : String
}


// view OrderSummary as select from orderstable.Orders as o
//     join orderstable.OrderItems as i
//     on o.ID = i.OrderID.ID
// {
//     key o.ID as OrderID    : UUID,         // Define a primary key
//     o.OrderDate            : Date,
//     o.CustomerName         : String(100),
//     i.ProductName          : String(100),
//     i.Quantity             : Integer,
//     i.Price                : Decimal(15, 2),
//     i.Quantity * i.Price as TotalAmount : Decimal(17, 2)
// }
// entity OrderSummary {
//     key ID : UUID;
//     OrderID : UUID;
//     OrderDate : Date;
//     CustomerName : String(100);
//     ProductName : String(100);
//     Quantity : Integer;
//     Price : Decimal(16, 2);
//     TotalAmount : Decimal(16, 2);
// }
