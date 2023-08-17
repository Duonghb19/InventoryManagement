-- Tạo cơ sở dữ liệu
CREATE DATABASE InventoryManagement;
GO
-- Sử dụng cơ sở dữ liệu
USE InventoryManagement;
GO

-- Bảng cho khách hàng
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY IDENTITY(1,1)
 ,CustomerName NVARCHAR(255)
 ,ContactPerson NVARCHAR(255)
 ,ContactEmail NVARCHAR(255)
 ,ContactPhone NVARCHAR(20)
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
);
GO
-- Bảng cho nhà cung cấp
CREATE TABLE Suppliers (
  SupplierID INT PRIMARY KEY IDENTITY(1,1)
 ,SupplierName NVARCHAR(255)
 ,ContactPerson NVARCHAR(255)
 ,ContactEmail NVARCHAR(255)
 ,ContactPhone NVARCHAR(20)
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
);
GO
-- Bảng cho thể loại vật tư hàng hóa
CREATE TABLE Categories (
  CategoryID INT PRIMARY KEY IDENTITY(1,1)
 ,CategoryName NVARCHAR(255)
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
);
GO
-- Bảng cho kho
CREATE TABLE Warehouses (
  WarehouseID INT PRIMARY KEY IDENTITY(1,1)
 ,WarehouseName NVARCHAR(255)
 ,Location NVARCHAR(255)
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
);
GO
-- Bảng cho vật tư hàng hóa
CREATE TABLE Products (
  ProductID INT PRIMARY KEY IDENTITY(1,1)
 ,ProductName NVARCHAR(255)
 ,CategoryID INT
 ,QuantityInStock INT
 ,PurchasePrice DECIMAL(10, 2)
 ,SalePrice DECIMAL(10, 2)
 ,WarehouseID INT
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
 ,FOREIGN KEY (CategoryID) REFERENCES Categories (CategoryID)
 ,FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID)
);
GO
-- Bảng cho phiếu nhập kho
CREATE TABLE IncomingReceipts (
  ReceiptID INT PRIMARY KEY IDENTITY(1,1)
 ,ReceiptDate DATE
 ,TotalAmount DECIMAL(10, 2)
 ,SupplierID INT
 ,WarehouseID INT
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
 ,FOREIGN KEY (SupplierID) REFERENCES Suppliers (SupplierID)
 ,FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID)
);
GO
-- Bảng chi tiết phiếu nhập kho
CREATE TABLE IncomingReceiptDetails (
  DetailID INT PRIMARY KEY IDENTITY(1,1)
 ,ReceiptID INT
 ,ProductID INT
 ,Quantity INT
 ,PurchasePrice DECIMAL(10, 2)
 ,WarehouseID INT
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
 ,FOREIGN KEY (ReceiptID) REFERENCES IncomingReceipts (ReceiptID)
 ,FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
 ,FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID)
);
GO
-- Bảng cho phiếu xuất kho
CREATE TABLE OutgoingOrders (
  OrderID INT PRIMARY KEY IDENTITY(1,1)
 ,OrderDate DATE
 ,TotalAmount DECIMAL(10, 2)
 ,CustomerID INT
 ,WarehouseID INT
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
 ,FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
 ,FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID)
);
GO
-- Bảng chi tiết phiếu xuất kho
CREATE TABLE OutgoingOrderDetails (
  DetailID INT PRIMARY KEY IDENTITY(1,1)
 ,OrderID INT
 ,ProductID INT
 ,Quantity INT
 ,SalePrice DECIMAL(10, 2)
 ,WarehouseID INT
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
 ,FOREIGN KEY (OrderID) REFERENCES OutgoingOrders (OrderID)
 ,FOREIGN KEY (ProductID) REFERENCES Products (ProductID)
 ,FOREIGN KEY (WarehouseID) REFERENCES Warehouses (WarehouseID)
);
GO
CREATE TABLE Users (
  UserId INT PRIMARY KEY IDENTITY(1,1)
 ,Username NVARCHAR(50)
 ,Password NVARCHAR(100)
 ,Role NVARCHAR(50)
 ,CreatedDate DATETIME
 ,CreatedBy int
 ,ModifiedDate DATETIME
 ,ModifiedBy int
);


INSERT into Users (Username, Password, Role, CreatedDate, ModifiedDate)
  VALUES ('admin', '$2a$11$A4UTHKWIR53tWqhSu9UKMOJqyyyuADsl9wfnH8vNLcokRDGn4gpL6', '', GETDATE(), GETDATE());

select * from Users u