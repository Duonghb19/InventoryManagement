USE master
GO

CREATE DATABASE InventoryManagement
GO

USE InventoryManagement
GO

CREATE TABLE dbo.Warehouses (
  WarehouseID int IDENTITY,
  WarehouseName nvarchar(255) NULL,
  Location nvarchar(255) NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (WarehouseID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[Users]
--
PRINT (N'Create table [dbo].[Users]')
GO
CREATE TABLE dbo.Users (
  UserId int IDENTITY,
  Username nvarchar(50) NULL,
  Password nvarchar(100) NULL,
  Role nvarchar(50) NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (UserId)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[Suppliers]
--
PRINT (N'Create table [dbo].[Suppliers]')
GO
CREATE TABLE dbo.Suppliers (
  SupplierID int IDENTITY,
  SupplierName nvarchar(255) NULL,
  ContactPerson nvarchar(255) NULL,
  ContactEmail nvarchar(255) NULL,
  ContactPhone nvarchar(20) NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (SupplierID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[Products]
--
PRINT (N'Create table [dbo].[Products]')
GO
CREATE TABLE dbo.Products (
  ProductID int IDENTITY,
  ProductName nvarchar(255) NULL,
  CategoryID int NULL,
  QuantityInStock int NULL,
  PurchasePrice decimal(10, 2) NULL,
  SalePrice decimal(10, 2) NULL,
  WarehouseID int NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (ProductID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[Customers]
--
PRINT (N'Create table [dbo].[Customers]')
GO
CREATE TABLE dbo.Customers (
  CustomerID int IDENTITY,
  CustomerName nvarchar(255) NULL,
  ContactPerson nvarchar(255) NULL,
  ContactEmail nvarchar(255) NULL,
  ContactPhone nvarchar(20) NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (CustomerID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[Categories]
--
PRINT (N'Create table [dbo].[Categories]')
GO
CREATE TABLE dbo.Categories (
  CategoryID int IDENTITY,
  CategoryName nvarchar(255) NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (CategoryID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[OutgoingOrders]
--
PRINT (N'Create table [dbo].[OutgoingOrders]')
GO
CREATE TABLE dbo.OutgoingOrders (
  OrderID int IDENTITY,
  OrderDate date NULL,
  TotalAmount decimal(10, 2) NULL,
  CustomerID int NULL,
  WarehouseID int NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (OrderID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[OutgoingOrderDetails]
--
PRINT (N'Create table [dbo].[OutgoingOrderDetails]')
GO
CREATE TABLE dbo.OutgoingOrderDetails (
  DetailID int IDENTITY,
  OrderID int NULL,
  ProductID int NULL,
  Quantity int NULL,
  SalePrice decimal(10, 2) NULL,
  WarehouseID int NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (DetailID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[IncomingReceipts]
--
PRINT (N'Create table [dbo].[IncomingReceipts]')
GO
CREATE TABLE dbo.IncomingReceipts (
  ReceiptID int IDENTITY,
  ReceiptDate date NULL,
  TotalAmount decimal(10, 2) NULL,
  SupplierID int NULL,
  WarehouseID int NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (ReceiptID)
)
ON [PRIMARY]
GO

--
-- Create table [dbo].[IncomingReceiptDetails]
--
PRINT (N'Create table [dbo].[IncomingReceiptDetails]')
GO
CREATE TABLE dbo.IncomingReceiptDetails (
  DetailID int IDENTITY,
  ReceiptID int NULL,
  ProductID int NULL,
  Quantity int NULL,
  PurchasePrice decimal(10, 2) NULL,
  WarehouseID int NULL,
  CreatedDate datetime NULL,
  CreatedBy int NULL,
  ModifiedDate datetime NULL,
  ModifiedBy int NULL,
  PRIMARY KEY CLUSTERED (DetailID)
)
ON [PRIMARY]
GO

-- 
-- Dumping data for table Warehouses
--
PRINT (N'Dumping data for table Warehouses')
SET IDENTITY_INSERT dbo.Warehouses ON
GO
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (1, N'Laporte2020', N'Hậu Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (2, N'Corley1983', N'Bình Phước', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (3, N'Moody1953', N'Bạc Liêu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (4, N'Abe1985', N'Cao Bằng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (5, N'Hanes777', N'Quảng Trị', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (6, N'King8', N'Điện Biên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (7, N'Ruben1956', N'Lào Cai', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (8, N'Muse176', N'Hà Nội', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (9, N'Jannet2001', N'Hưng Yên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (10, N'Marcel1988', N'Hà Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (11, N'Aubrey2', N'Vĩnh Phúc', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (12, N'Schubert399', N'Bắc Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (13, N'Clement2008', N'Quảng Ngãi', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (14, N'Kurtis148', N'Bắc Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (15, N'Pearline781', N'Hải Dương', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (16, N'Dana935', N'Hà Nội', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (17, N'Adolfo2006', N'Bạc Liêu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (18, N'Kent348', N'Đắk Lắk', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (19, N'Candelaria2017', N'Hà Nội', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (20, N'Hawkins2028', N'Hải Phòng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (21, N'Wynne2004', N'Cao Bằng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (22, N'Linkous5', N'Đồng Tháp', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (23, N'Crawford1962', N'Điện Biên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (24, N'Hanley2018', N'Hậu Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (25, N'Erline969', N'Đồng Nai', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (26, N'Graig2012', N'Quảng Ngãi', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (27, N'Hong1989', N'Đồng Tháp', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (28, N'Layman2006', N'Vĩnh Long', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (29, N'Francina2016', N'Ninh Bình', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (30, N'Cary2019', N'Quảng Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (31, N'Cathleen2009', N'Quảng Trị', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (32, N'Dane1956', N'Lạng Sơn', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (33, N'Sonja1950', N'Nghệ An', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (34, N'Boss1960', N'An Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (35, N'Martine949', N'Vĩnh Long', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (36, N'Alton2019', N'Quảng Trị', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (37, N'Max518', N'Tây Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (38, N'Mchenry415', N'Cà Mau', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (39, N'Shin1', N'Đà Nẵng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (40, N'Julian78', N'Lạng Sơn', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (41, N'Joshua855', N'Gia Lai', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (42, N'Zack381', N'Hậu Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (43, N'Manual448', N'Bắc Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (44, N'Nicolas1981', N'Gia Lai', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (45, N'Helm179', N'Kon Tum', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (46, N'Murray2026', N'Thái Bình', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (47, N'Karla422', N'Lai Châu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (48, N'Mariella7', N'Thái Nguyên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (49, N'Chantelle974', N'Điện Biên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (50, N'Arnoldo2027', N'Bắc Kạn', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (51, N'Ronnie1951', N'Hà Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (52, N'Carmelo7', N'Quảng Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (53, N'Adela4', N'Hà Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (54, N'Fernando449', N'Nghệ An', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (55, N'Efren3', N'Quảng Nam', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (56, N'Bob2027', N'Quảng Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (57, N'Allred1960', N'Hà Tĩnh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (58, N'Kenton7', N'Hà Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (59, N'Abrams4', N'Phú Yên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (60, N'Lira2006', N'Quảng Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (61, N'Keeley8', N'Cao Bằng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (62, N'Claudie86', N'Ninh Thuận', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (63, N'Adkins3', N'Kiên Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (64, N'Bowles1996', N'Sóc Trăng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (65, N'Nicolas2026', N'Hà Nội', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (66, N'Tawna2', N'Cao Bằng', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (67, N'Mervin144', N'Vĩnh Long', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (68, N'Idalia473', N'Ninh Thuận', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (69, N'Judie34', N'An Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (70, N'Philip873', N'Đồng Tháp', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (71, N'Adams576', N'Điện Biên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (72, N'Adam1968', N'Quảng Ninh', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (73, N'Conrad6', N'Hải Dương', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (74, N'Odell4', N'Phú Yên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (75, N'Hugh2019', N'Kon Tum', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (76, N'Bourque2014', N'Bạc Liêu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (77, N'Andersen2020', N'Hậu Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (78, N'Waylon963', N'Bà Rịa–Vũng Tàu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (79, N'Samson2004', N'Bình Thuận', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (80, N'Angel12', N'Quảng Nam', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (81, N'Mara2028', N'Nam Định', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (82, N'Eloy2012', N'Hưng Yên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (83, N'Aline2003', N'Phú Yên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (84, N'Bryan632', N'Cần Thơ', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (85, N'Goetz2011', N'Thanh Hóa', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (86, N'Abe2002', N'Bình Thuận', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (87, N'Bauman2', N'Thái Bình', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (88, N'Hicks3', N'Phú Thọ', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (89, N'Leblanc982', N'Quảng Bình', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (90, N'Dover7', N'Thái Nguyên', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (91, N'Still1999', N'Đắk Lắk', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (92, N'Munoz1977', N'Phú Thọ', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (94, N'Aiello351', N'Tiền Giang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (95, N'Joshua2024', N'Đồng Tháp', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (96, N'Turner2006', N'Vĩnh Phúc', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (97, N'Ada25', N'Đồng Nai', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (98, N'Margeret2011', N'Bạc Liêu', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (99, N'Lucas988', N'Tuyên Quang', NULL, NULL, NULL, NULL)
INSERT dbo.Warehouses(WarehouseID, WarehouseName, Location, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (100, N'Latashia1954', N'Quảng Nam', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Warehouses OFF
GO

-- 
-- Dumping data for table Users
--
PRINT (N'Dumping data for table Users')
SET IDENTITY_INSERT dbo.Users ON
GO
INSERT dbo.Users(UserId, Username, Password, Role, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (1, N'admin', N'$2a$11$QZi5O0cMxKgIDNukwwZQJeE5g9ub6ylbeXTTkWmHOXta3WhAE.HeC', N'ADMIN', '2023-08-17 23:27:04.910', NULL, '2023-08-20 23:01:59.963', NULL)
GO
SET IDENTITY_INSERT dbo.Users OFF
GO

-- 
-- Dumping data for table Suppliers
--
PRINT (N'Dumping data for table Suppliers')
SET IDENTITY_INSERT dbo.Suppliers ON
GO
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (1, N'Ayanna518', N'Ayanna Darling', N'Keven.Darling@nowhere.com', N'(561) 865-3569', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (2, N'Karima847', N'Adela Alba', N'Alves695@example.com', N'(671) 459-4786', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (3, N'Santos2004', N'Corinne Dugas', N'Abel.I.Boyer@example.com', N'(443) 178-1765', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (4, N'Erwin1951', N'Alonzo Aragon', N'JerroldRyder@nowhere.com', N'(638) 837-2161', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (5, N'Lekisha247', N'Waldo Knudsen', N'Adolph.Putnam@example.com', N'(136) 597-9874', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (6, N'Miguel82', N'Bronwyn Acker', N'Hung_Lundberg@example.com', N'(900) 174-2439', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (7, N'Talbott2017', N'Cedrick Frey', N'Allard633@example.com', N'(273) 376-3478', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (8, N'Neal434', N'Birgit Kozlowski', N'AbeHatch385@nowhere.com', N'(562) 718-6038', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (9, N'Darrin7', N'Lydia Linkous', N'Rubin78@example.com', N'(428) 668-4543', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (10, N'Christal1', N'Amanda Coe', N'Mcintyre@example.com', N'(403) 928-0239', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (11, N'Austin1959', N'Lauralee Hefner', N'Bueno485@example.com', N'(652) 259-5547', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (12, N'Devon82', N'Dick Moniz', N'Lafleur@nowhere.com', N'(590) 129-4993', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (13, N'Vannesa1999', N'Santo Smallwood', N'ShereeAbernathy1@nowhere.com', N'(796) 836-0895', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (14, N'Roger1983', N'Verona Reich', N'mlorpelv_xmfganzv@nowhere.com', N'(724) 615-3662', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (15, N'Addie5', N'Dallas Parrott', N'Lynsey_Bean@nowhere.com', N'(770) 734-1465', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (16, N'Milan2022', N'Ricardo Andres', N'DonteAbbott@example.com', N'(363) 434-2744', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (17, N'Abernathy1950', N'Adah Brewster', N'VerdinU274@example.com', N'(677) 314-9812', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (18, N'Rosalyn98', N'Giovanni Cavanaugh', N'Carlson@nowhere.com', N'(291) 371-6811', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (19, N'Kurt2016', N'Delmer Outlaw', N'Aguirre@example.com', N'(460) 545-2818', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (20, N'Herb83', N'Dorotha Wilhelm', N'wduks8170@example.com', N'(686) 207-1885', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (21, N'Anthony31', N'Lazaro Camarillo', N'Ackerman36@example.com', N'(837) 524-8846', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (23, N'Abby9', N'Bryan Eagle', N'Cameron.Yang@example.com', N'(448) 360-2062', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (24, N'Ada2015', N'Stacia Sturm', N'Terence.SRocha@nowhere.com', N'(903) 199-7541', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (25, N'Champion1', N'Milagros Brinkman', N'Zapata4@example.com', N'(978) 635-6401', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (27, N'Doretha2011', N'Keeley Burger', N'Arreola@example.com', N'(702) 921-8337', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (29, N'Marlena133', N'Anjelica Michel', N'Darrin_Z_Landers@nowhere.com', N'(499) 371-8671', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (30, N'Nutt2014', N'Minh Staples', N'AdellaAmos7@example.com', N'(332) 879-4789', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (31, N'Applegate5', N'Kimberley Mace', N'Treadwell952@example.com', N'(560) 984-5655', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (32, N'Arnulfo722', N'Adaline Gatlin', N'Carmichael6@example.com', N'(535) 006-8709', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (33, N'Alford1987', N'Brian Daley', N'Larry_Leal9@nowhere.com', N'(292) 282-3646', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (34, N'Sharilyn1961', N'Galen Justus', N'Stapleton@nowhere.com', N'(958) 835-2013', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (35, N'Maurice1993', N'Archie Abernathy', N'Smoot671@nowhere.com', N'(304) 475-3648', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (36, N'Rolando1997', N'Darius Eaves', N'Casper@nowhere.com', N'(920) 056-4004', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (37, N'Gallegos6', N'Adalberto Carmichael', N'Alicea396@example.com', N'(692) 366-3220', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (38, N'Newton671', N'Nick Foust', N'AbrahamW@example.com', N'(875) 248-6195', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (39, N'Tyrone4', N'Rafael Abernathy', N'FaustoAgnew@example.com', N'(835) 455-9921', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (40, N'Tim2022', N'Marquerite Wolfe', N'Culver754@example.com', N'(584) 321-1391', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (41, N'Darrel2008', N'Ahmad Burge', N'DelorseG.Bello111@example.com', N'(288) 288-2939', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (42, N'Brandon2013', N'Renato Oswald', N'TraceyIrving@example.com', N'(753) 266-8969', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (43, N'Krieger2011', N'Lavenia Andrus', N'Joyce@example.com', N'(455) 697-1856', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (44, N'Tanisha588', N'Hershel Greer', N'Cyril.Christian559@example.com', N'(554) 883-3553', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (45, N'Mel268', N'Teisha Mcvey', N'Lerner69@example.com', N'(440) 293-5380', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (47, N'Albert253', N'Tiara Albert', N'AlbinaAllen@nowhere.com', N'(441) 708-6471', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (48, N'Dominguez527', N'Denny Pierson', N'AlbertoFong1@example.com', N'(344) 509-0175', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (49, N'Taft537', N'Shayla Polanco', N'VirginaPulliam578@example.com', N'(676) 408-2458', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (50, N'Morgan1987', N'Gregorio Mcgovern', N'Rodrigues@example.com', N'(715) 677-8668', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (51, N'Sheena2008', N'Josue Mundy', N'Abreu@example.com', N'(437) 422-1089', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (52, N'Nicholas954', N'Karyn Acker', N'Glenn273@example.com', N'(367) 705-7350', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (54, N'Abney4', N'Williemae Nutt', N'EasleyY@example.com', N'(796) 239-0866', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (55, N'Debrah77', N'Hildegarde Mcneill', N'Sewell@example.com', N'(641) 200-2562', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (56, N'Shelby1958', N'Alva Valentine', N'LorrianeAckerman@example.com', N'(825) 089-0199', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (57, N'Anthony1962', N'Allen Wilmoth', N'MarcoJansen@nowhere.com', N'(277) 065-7941', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (58, N'Estes1989', N'Sanora Whiteside', N'Adame@nowhere.com', N'(458) 376-6371', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (59, N'Nanette1982', N'Lawanna Milligan', N'Vanmeter1@example.com', N'(449) 222-7650', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (60, N'Snead1994', N'Enriqueta Blue', N'Colton.HAbney387@example.com', N'(449) 596-1052', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (61, N'Isadora2013', N'Laverne Adams', N'GenaMCoon@nowhere.com', N'(844) 891-3782', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (62, N'Charline1956', N'Earnest Boothe', N'DamienHoyle5@nowhere.com', N'(266) 227-5184', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (63, N'Felicia437', N'Lashonda Bland', N'Forman@example.com', N'(580) 442-5164', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (64, N'Billy2020', N'Adan Andrus', N'Adam.UNelson9@example.com', N'(385) 336-3670', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (66, N'Darla2008', N'Rocky Devito', N'Felton.Pierce873@example.com', N'(794) 162-1903', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (67, N'Adelaida7', N'Abram Anders', N'swfyw7742@example.com', N'(396) 751-5718', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (68, N'Waite1999', N'Dustin Graff', N'Swift2@example.com', N'(654) 134-2220', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (69, N'Bernarda241', N'Kennith Abernathy', N'Arthur47@example.com', N'(993) 032-6526', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (70, N'Laney74', N'Robbie Shuler', N'Chavez414@example.com', N'(712) 218-8752', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (71, N'Paul13', N'Zula Troutman', N'Noel_Bourque392@example.com', N'(644) 824-8186', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (73, N'Sharla312', N'Arlen Stump', N'Burr@example.com', N'(505) 866-6355', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (74, N'Gilberto2010', N'Angelo Judd', N'Patrick67@example.com', N'(370) 821-0786', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (75, N'Ping2018', N'Riley Howe', N'Parra@nowhere.com', N'(212) 616-5640', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (76, N'Edda95', N'Hermina Menendez', N'Shalanda.Blevins@example.com', N'(942) 871-0755', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (77, N'Owen2015', N'Donte Rocha', N'Alia.Boudreau@example.com', N'(400) 455-2886', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (78, N'Zonia47', N'Margrett Beaver', N'kktcpy9@example.com', N'(726) 667-3612', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (79, N'Drummond413', N'Cameron Yang', N'Ada_Acker838@example.com', N'(205) 737-2413', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (80, N'Huntington2028', N'Darwin Harmon', N'AlfredoCarmichael24@example.com', N'(718) 208-8137', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (81, N'Abel343', N'Efrain Crawford', N'Dailey@nowhere.com', N'(884) 745-4132', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (82, N'Giuseppe1950', N'Denyse Milne', N'Ratcliff@example.com', N'(250) 635-2919', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (83, N'Noelle2012', N'Modesto Burley', N'DomingoBenitez683@example.com', N'(879) 531-0209', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (84, N'Maud1993', N'Kaycee Carter', N'Rayna.Priest@example.com', N'(363) 579-6521', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (86, N'Adalberto5', N'Tanner Barrett', N'Todd.Hodgson@example.com', N'(843) 600-5058', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (88, N'Darron2024', N'Abraham Gregg', N'IraNielson@nowhere.com', N'(310) 012-4333', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (89, N'Breanne816', N'Adan Farley', N'AnetteMccorkle@example.com', N'(221) 707-8580', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (90, N'Hien9', N'Elmo Hargrove', N'Dwain_Champion@nowhere.com', N'(224) 590-1422', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (91, N'Vernita488', N'Mason Carman', N'Bret_Hancock61@example.com', N'(307) 450-6317', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (92, N'Abby8', N'Quinn Alvarado', N'JameyI_Ackerman2@example.com', N'(833) 970-3392', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (93, N'Meier844', N'Vince Chen', N'Norton@example.com', N'(439) 849-4249', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (94, N'Dannielle28', N'Adan Acevedo', N'CamilleStoner@nowhere.com', N'(885) 441-3165', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (95, N'Fuchs2011', N'Keith Beavers', N'ZulaNAbernathy@example.com', N'(283) 434-3080', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (96, N'Fontenot2012', N'Kam Varney', N'Staples647@example.com', N'(271) 631-7979', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (97, N'Ahmed1996', N'Miesha Yarbrough', N'AdelaidaAbel582@nowhere.com', N'(341) 264-4406', NULL, NULL, NULL, NULL)
INSERT dbo.Suppliers(SupplierID, SupplierName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (99, N'Gerry1975', N'Elroy Scales', N'dxxbuteb_qnpj@example.com', N'(429) 718-0606', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Suppliers OFF
GO

-- 
-- Dumping data for table Products
--
PRINT (N'Dumping data for table Products')
SET IDENTITY_INSERT dbo.Products ON
GO
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (1, N'Stereowoofentor', 25, 79, 1042.00, 1142.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (2, N'Teculer', 25, 48, 1998.98, 2098.98, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (3, N'Combandaquer', 25, 32, 1444.00, 1544.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (4, N'Comleewer', 25, 61, 232.00, 332.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (5, N'Stereoceivedglet', 25, 14, 481.00, 581.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (6, N'Retary', 25, 65, 1263.00, 1363.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (7, N'Cabwoofscope', 25, 2, 648.00, 748.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (8, N'Playtopewentor', 25, 15, 1977.00, 2077.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (9, N'Tabtary', 25, 21, 1998.99, 2098.99, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (10, N'Subplottefor', 25, 78, 1797.00, 1897.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (11, N'Cartfindewentor', 25, 23, 99.02, 199.02, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (12, N'Charputar', 25, 23, 382.00, 482.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (13, N'Anculon', 25, 97, 1812.00, 1912.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (14, N'Transleaner', 25, 8, 1221.00, 1321.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (15, N'Biputar', 25, 86, 204.00, 304.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (16, N'Playcordridge', 25, 97, 254.00, 354.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (17, N'Speakputator', 25, 96, 1753.00, 1853.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (18, N'Montopommer', 25, 82, 111.00, 211.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (19, N'Armtopletor', 25, 4, 421.00, 521.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (20, N'Stereoholdonlet', 25, 34, 1471.00, 1571.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (21, N'Tabwoofepor', 25, 2, 862.00, 962.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (22, N'Transculaquscope', 25, 8, 99.01, 199.01, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (23, N'Supholdor', 25, 23, 1265.00, 1365.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (24, N'Printlictphone', 25, 75, 861.00, 961.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (25, N'Tabnientor', 25, 96, 244.00, 344.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (26, N'Readtopor', 25, 21, 999.00, 1099.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (27, N'Speakfindgaon', 25, 13, 680.00, 780.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (28, N'Ampputphone', 25, 35, 987.00, 1087.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (29, N'Commuterry', 25, 86, 355.00, 455.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (30, N'Printtoponra', 25, 16, 524.00, 624.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (31, N'Concordon', 25, 61, 556.00, 656.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (32, N'Anholdentor', 25, 95, 915.00, 1015.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (33, N'Speakniar', 25, 87, 1893.00, 1993.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (34, N'Conniedgra', 25, 76, 1999.00, 2099.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (35, N'Cartmutor', 25, 66, 1585.00, 1685.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (36, N'Playfindfier', 25, 71, 950.00, 1050.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (37, N'Playcyclor', 25, 18, 136.00, 236.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (38, N'Comcorder', 25, 36, 99.00, 199.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (39, N'Concycliner', 25, 39, 690.00, 790.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (40, N'Readtinator', 25, 31, 1822.00, 1922.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (41, N'Monmutedphone', 25, 75, 786.00, 886.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (42, N'Comjectiner', 25, 95, 1688.00, 1788.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (43, N'Playcycler', 25, 78, 653.00, 753.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (44, N'Comlifioner', 25, 95, 151.00, 251.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (45, N'Cableer', 25, 6, 493.00, 593.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (46, N'Rejectlet', 25, 65, 1568.00, 1668.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (47, N'Commutimator', 25, 22, 1580.00, 1680.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (48, N'Miccordar', 25, 89, 1149.00, 1249.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (49, N'Anmuter', 25, 27, 1464.00, 1564.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (50, N'Cartfindridge', 25, 8, 755.00, 855.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (51, N'Speakcordra', 25, 11, 536.00, 636.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (52, N'Retopor', 25, 54, 1024.00, 1124.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (53, N'Mictellator', 25, 86, 769.00, 869.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (54, N'Tabtopor', 25, 92, 300.00, 400.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (55, N'Concordedgon', 25, 29, 862.00, 962.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (56, N'Monotellupentor', 25, 60, 712.00, 812.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (57, N'Ampcordon', 25, 80, 954.00, 1054.00, 4, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (58, N'Commutphone', 25, 14, 201.00, 301.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (59, N'Ampwoofentor', 25, 96, 571.00, 671.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (60, N'Concyclaquor', 25, 13, 510.00, 610.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (61, N'Stereoleer', 25, 54, 597.00, 697.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (62, N'Processar', 25, 69, 165.00, 265.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (63, N'Comtinommor', 25, 20, 1369.00, 1469.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (64, N'Amplictlet', 25, 49, 229.00, 329.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (65, N'Cleancycler', 25, 97, 1959.00, 2059.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (66, N'Concessexentor', 25, 20, 1666.00, 1766.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (67, N'Cartwoofator', 25, 77, 1178.00, 1278.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (68, N'Micfindor', 25, 48, 186.00, 286.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (69, N'Speaktaommra', 25, 9, 1286.00, 1386.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (70, N'Tweetcyclar', 25, 8, 1891.00, 1991.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (71, N'Tejectadar', 25, 6, 911.00, 1011.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (72, N'Speakniefer', 25, 98, 125.00, 225.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (73, N'Tabholder', 25, 48, 882.00, 982.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (74, N'Reputletry', 25, 40, 559.00, 659.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (75, N'Chartopentor', 25, 31, 1128.00, 1228.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (76, N'Playculicer', 25, 33, 634.00, 734.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (77, N'Ampmutolllet', 25, 3, 1163.00, 1263.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (78, N'Cartcyclator', 25, 43, 637.00, 737.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (79, N'Tetinphone', 25, 1, 970.00, 1070.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (80, N'Procyclaquer', 25, 45, 278.00, 378.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (81, N'Subfindor', 25, 8, 1747.00, 1847.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (82, N'Cartcordeper', 25, 56, 694.00, 794.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (83, N'Charbandon', 25, 69, 480.00, 580.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (84, N'Tweetcessar', 25, 94, 1363.00, 1463.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (85, N'Tabniinry', 25, 90, 1331.00, 1431.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (86, N'Monomuterer', 25, 46, 1740.00, 1840.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (87, N'Cablictentor', 25, 69, 1598.00, 1698.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (88, N'Combandator', 25, 98, 457.00, 557.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (89, N'Combandadra', 25, 30, 1387.00, 1487.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (90, N'Processscope', 25, 7, 491.00, 591.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (91, N'Chartaer', 25, 36, 123.00, 223.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (92, N'Transtaor', 25, 33, 1917.00, 2017.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (93, N'Supcordridge', 25, 97, 1013.00, 1113.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (94, N'Procordscope', 25, 71, 853.00, 953.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (95, N'Cartholdry', 25, 71, 1428.00, 1528.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (96, N'Tabjectgaentor', 25, 68, 1756.00, 1856.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (97, N'Concessor', 25, 50, 174.00, 274.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (98, N'Cleanputer', 25, 28, 1537.00, 1637.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (99, N'Micnionentor', 25, 99, 159.00, 259.00, NULL, NULL, NULL, NULL, NULL)
INSERT dbo.Products(ProductID, ProductName, CategoryID, QuantityInStock, PurchasePrice, SalePrice, WarehouseID, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (100, N'Bilictry', 25, 1, 702.00, 802.00, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Products OFF
GO

-- 
-- Dumping data for table OutgoingOrders
--
PRINT (N'Dumping data for table OutgoingOrders')
-- Table InventoryManagement.dbo.OutgoingOrders does not contain any data (it is empty)

-- 
-- Dumping data for table OutgoingOrderDetails
--
PRINT (N'Dumping data for table OutgoingOrderDetails')
-- Table InventoryManagement.dbo.OutgoingOrderDetails does not contain any data (it is empty)

-- 
-- Dumping data for table IncomingReceipts
--
PRINT (N'Dumping data for table IncomingReceipts')
-- Table InventoryManagement.dbo.IncomingReceipts does not contain any data (it is empty)

-- 
-- Dumping data for table IncomingReceiptDetails
--
PRINT (N'Dumping data for table IncomingReceiptDetails')
-- Table InventoryManagement.dbo.IncomingReceiptDetails does not contain any data (it is empty)

-- 
-- Dumping data for table Customers
--
PRINT (N'Dumping data for table Customers')
SET IDENTITY_INSERT dbo.Customers ON
GO
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (1, N'Conrad1997', N'Stevie Frizzell', N'Conrad_Frizzell61@example.com', N'(951) 501-9191', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (2, N'Drew9', N'Jackeline Acker', N'Schuler@example.com', N'(873) 033-1497', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (3, N'Kim1953', N'Twila Bock', N'ZapataF@example.com', N'(286) 206-7080', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (4, N'Latonya2022', N'Reina Adkins', N'Sanford549@nowhere.com', N'(826) 193-9372', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (5, N'Stamm465', N'Lavonia Whiteside', N'Barr@nowhere.com', N'(967) 582-3086', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (6, N'Winkler2019', N'Kendrick Naranjo', N'Almanza@example.com', N'(812) 301-5300', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (7, N'Brendan547', N'Kim Desantis', N'Ron.Irish@example.com', N'(537) 222-1190', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (8, N'Gino2021', N'Raul Palma', N'ktercnnp_okcisx@example.com', N'(236) 929-0143', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (9, N'Abby664', N'Lorette Ortiz', N'mnksgeiq8021@example.com', N'(748) 666-0948', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (10, N'Jolene437', N'Jewel Plummer', N'Atwood@nowhere.com', N'(173) 265-2255', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (11, N'Alonso441', N'Carter Matlock', N'Sima_Call6@example.com', N'(131) 136-7890', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (12, N'Abby754', N'Clemente Craddock', N'Kirk.HKoehler@nowhere.com', N'(357) 166-5983', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (13, N'Simpson5', N'Rolland Watson', N'EdmundBenitez631@example.com', N'(640) 849-9808', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (14, N'Darius5', N'Kayleen Hogg', N'Salley69@nowhere.com', N'(121) 928-0709', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (15, N'Boling2025', N'Loise Mayers', N'Kiefer@nowhere.com', N'(838) 048-5399', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (17, N'Bernita1999', N'Debby Concepcion', N'Brinkman28@example.com', N'(870) 923-0471', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (18, N'Deborah2002', N'Kent Staton', N'Almeida24@example.com', N'(914) 555-5068', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (19, N'Earl2024', N'Emmett Moulton', N'LambF@nowhere.com', N'(723) 311-9006', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (20, N'Constance1951', N'Clarinda Acker', N'ShandraCarranza@nowhere.com', N'(241) 260-0002', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (21, N'Shon1986', N'Darrick Cardoza', N'JeraldAbraham529@example.com', N'(192) 966-7218', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (22, N'Justin1958', N'Kecia Adcock', N'Abel5@example.com', N'(361) 203-3649', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (23, N'Williams7', N'Maurice Mireles', N'Bachman@example.com', N'(932) 094-5575', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (24, N'Cathy1961', N'Ruben Simpson', N'FriedaAbreu99@example.com', N'(244) 448-4768', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (25, N'Rocky1969', N'Britt Malley', N'Barrett_Mcgowan@example.com', N'(164) 563-1078', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (26, N'Adaline2010', N'Jamie Creech', N'rvxkhcgk5666@example.com', N'(164) 347-4821', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (27, N'Drew35', N'Luis Cruse', N'Dodge@example.com', N'(651) 163-8918', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (28, N'Ray2015', N'Carol Abrams', N'Perkins@example.com', N'(190) 513-7373', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (29, N'Arvilla9', N'Adah Adair', N'NorrisBolt@example.com', N'(362) 919-2462', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (30, N'Bourgeois2010', N'Henry Crump', N'Barron@nowhere.com', N'(833) 067-7569', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (31, N'Ron2016', N'Magdalena Ogle', N'Duval@example.com', N'(576) 204-9105', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (32, N'Ada2007', N'Donovan Allison', N'Zenobia.Brunson@example.com', N'(583) 420-8609', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (33, N'Clelia1967', N'Jeremy Aranda', N'Adela_Alley61@example.com', N'(659) 344-2951', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (34, N'Dillon2027', N'Camie Burch', N'Abel313@example.com', N'(782) 164-8595', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (35, N'Washington5', N'Robbie Canty', N'Suggs@example.com', N'(982) 826-6553', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (36, N'Packard2000', N'Lavone Amos', N'Acker@example.com', N'(603) 260-6674', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (37, N'Bonilla2029', N'Johnnie Allard', N'aweyzjpd3111@example.com', N'(568) 730-2747', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (38, N'Đặng Việt Anh', N'Debbra Acuna', N'Arthur@example.com', N'(340) 205-9308', NULL, NULL, '2023-08-23 00:41:16.940', 0)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (39, N'Charla71', N'Abdul Bergstrom', N'Ruffin@nowhere.com', N'(494) 993-6629', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (40, N'Cher425', N'Nathanael Medina', N'EleanoreYEscamilla158@example.com', N'(907) 223-8253', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (41, N'Adah2028', N'Kasey Savoy', N'JerroldSAkins@example.com', N'(918) 918-5124', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (42, N'Mosby661', N'Raphael Beckman', N'Tackett@example.com', N'(584) 346-1791', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (43, N'Hunter2027', N'Eugenia Johansen', N'Chasidy.Nye82@example.com', N'(981) 682-5876', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (44, N'Anglin1953', N'Merissa Minter', N'wawwcqng.wmbvidy@example.com', N'(205) 787-0309', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (45, N'Albert381', N'Alejandro Norwood', N'Abney@example.com', N'(657) 216-0159', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (46, N'Ordonez879', N'Enoch Dortch', N'Joseph.Trapp@example.com', N'(915) 124-2175', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (47, N'Burrell393', N'Kathleen Burnside', N'Calkins615@example.com', N'(517) 598-5479', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (48, N'Athena521', N'Stevie Vallejo', N'AntoineLittlefield@nowhere.com', N'(691) 091-6995', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (49, N'Alonzo218', N'Gilda Abney', N'jfhbwpxk.jxmonkyjvl@example.com', N'(341) 787-2195', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (50, N'Nieto1959', N'Pearlene Starnes', N'pqjndav80@example.com', N'(957) 389-4429', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (51, N'Harlan2015', N'Kelley Hiatt', N'VellaOlivo14@example.com', N'(621) 665-4133', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (52, N'Tory1958', N'Brady Street', N'Manson@example.com', N'(205) 153-2362', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (53, N'Adalberto2008', N'Beau Poston', N'Julie_Ackerman45@nowhere.com', N'(425) 294-1719', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (54, N'Needham1951', N'Christeen Oconnor', N'Davina_Bragg91@example.com', N'(690) 147-8073', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (55, N'Darius1967', N'Aleisha Story', N'Buck.Y_Agnew669@example.com', N'(579) 163-9312', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (56, N'Acker2021', N'Greta Prosser', N'Hamblin72@nowhere.com', N'(357) 250-9278', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (57, N'Mattson2000', N'Shawn Deaton', N'Mario_Bivens@nowhere.com', N'(331) 554-4102', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (58, N'Elvie139', N'Ada Rapp', N'Shila.Darnell546@example.com', N'(548) 266-5843', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (59, N'Diggs44', N'Abe Christie', N'MayeAbrams@example.com', N'(984) 718-0347', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (60, N'Mccutcheon1967', N'Abbie Bullard', N'Jeffery_Nieves@example.com', N'(821) 104-7434', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (61, N'Collins23', N'Jenny Schulze', N'DeanaAgee@example.com', N'(729) 825-8915', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (62, N'Jimmie835', N'Jamel Washington', N'ErasmoA_Armenta@nowhere.com', N'(168) 173-2252', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (63, N'Kareen1', N'Augustus Barnette', N'wmunrid4218@example.com', N'(557) 294-9111', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (64, N'Lefebvre9', N'Rick Trevino', N'Hooks24@example.com', N'(317) 447-4928', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (65, N'Ambrose9', N'Azalee Wang', N'Marge.Kee32@example.com', N'(408) 482-4021', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (66, N'Orlando1962', N'Jackqueline Abraham', N'Abel_Stratton@example.com', N'(692) 189-7138', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (67, N'Myron77', N'Marcel Casas', N'Peek@example.com', N'(185) 010-8265', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (68, N'Scott4', N'Chiquita Headrick', N'ErnestBelanger@nowhere.com', N'(357) 642-4465', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (69, N'Abby789', N'Mitchell Tanner', N'Tomlin@nowhere.com', N'(591) 656-5652', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (70, N'Shapiro1998', N'Miesha Goldsmith', N'Baron964@nowhere.com', N'(854) 442-2903', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (71, N'Doyle1966', N'Ahmed Abernathy', N'GreggGaskin@example.com', N'(592) 896-0770', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (72, N'Les1989', N'Eddy Snodgrass', N'KingCarter@example.com', N'(191) 320-3421', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (73, N'Blum2012', N'Herschel Allison', N'RomeoDorris17@example.com', N'(458) 517-4112', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (74, N'Odelia1973', N'Carmelita Abel', N'Alec.Trejo21@nowhere.com', N'(745) 204-2485', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (75, N'Phipps1990', N'Daron Lowery', N'Cleveland_Hildreth@nowhere.com', N'(306) 348-8601', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (76, N'Alfreda2016', N'Rudolph Staley', N'GalenPino@example.com', N'(614) 935-9421', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (77, N'Matt1971', N'Seth Martin', N'Cash@example.com', N'(531) 501-3007', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (78, N'Phylis6', N'Theola Addison', N'kwmfds89@example.com', N'(189) 156-1406', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (79, N'Abram91', N'Isela Crittenden', N'Staley@nowhere.com', N'(677) 672-0737', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (80, N'Bragg8', N'Marvella Langston', N'Bernardo_Nance35@example.com', N'(822) 674-5067', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (81, N'Oneida9', N'Cassondra Quintana', N'BufordBills5@example.com', N'(721) 148-5318', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (82, N'Ferris962', N'Ada Barron', N'RobertoFinney@example.com', N'(245) 537-5028', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (83, N'Siler993', N'Bob Whitlow', N'tegaafuz6022@example.com', N'(562) 110-2959', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (84, N'Genna31', N'Aileen Ricks', N'CharlesGrimm@example.com', N'(959) 390-1824', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (85, N'Clay1991', N'Carter Wilburn', N'CaritaHSchmitz@nowhere.com', N'(467) 225-3273', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (86, N'Travis2021', N'Lewis Kurtz', N'Mindy.Albrecht@nowhere.com', N'(226) 699-4530', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (87, N'Carl172', N'Martin Carpenter', N'Keith51@nowhere.com', N'(283) 464-2386', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (88, N'Fowler1982', N'Maynard Mullins', N'LindsayMccord@example.com', N'(495) 003-4518', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (89, N'Darcie1963', N'Deena Seifert', N'zjnogqkv_umtich@example.com', N'(947) 515-0608', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (90, N'Valerie715', N'Sonny Epps', N'awpq00@example.com', N'(908) 776-3850', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (91, N'Alston1967', N'Darwin Aguirre', N'AbigailDunning59@example.com', N'(600) 635-4460', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (92, N'Fountain877', N'Audie Kearney', N'Abel@nowhere.com', N'(298) 241-4911', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (93, N'Owen181', N'Ettie Fountain', N'Wagner@example.com', N'(151) 534-0085', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (94, N'Adam4', N'Ada Ackerman', N'AbdulSoto@example.com', N'(400) 678-2082', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (95, N'Davidson9', N'Joey Seiler', N'PhilomenaLabbe@example.com', N'(520) 400-8474', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (96, N'Mandi293', N'Elbert Abrams', N'kcrx1294@nowhere.com', N'(255) 021-3614', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (97, N'Tristan98', N'Nicolas Dyer', N'Goff@example.com', N'(551) 003-4539', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (98, N'Stacy2011', N'Shawnda Cameron', N'Adam.Runyan27@example.com', N'(461) 398-5297', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (99, N'Bragg72', N'Catherin Gaither', N'Noe_Damico@example.com', N'(146) 915-5015', NULL, NULL, NULL, NULL)
INSERT dbo.Customers(CustomerID, CustomerName, ContactPerson, ContactEmail, ContactPhone, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (100, N'Newton2009', N'Quentin Abraham', N'Winkler51@nowhere.com', N'(437) 389-4694', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT dbo.Customers OFF
GO

-- 
-- Dumping data for table Categories
--
PRINT (N'Dumping data for table Categories')
SET IDENTITY_INSERT dbo.Categories ON
GO
INSERT dbo.Categories(CategoryID, CategoryName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (25, N'Acer', '2023-08-21 02:32:49.610', 0, NULL, NULL)
INSERT dbo.Categories(CategoryID, CategoryName, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy) VALUES (26, N'DELL', NULL, NULL, '2023-08-22 20:38:37.097', 0)
GO
SET IDENTITY_INSERT dbo.Categories OFF
GO

USE InventoryManagement
GO

IF DB_NAME() <> N'InventoryManagement' SET NOEXEC ON
GO

--
-- Create foreign key on table [dbo].[Products]
--
PRINT (N'Create foreign key on table [dbo].[Products]')
GO
ALTER TABLE dbo.Products WITH NOCHECK
  ADD FOREIGN KEY (CategoryID) REFERENCES dbo.Categories (CategoryID)
GO

--
-- Create foreign key on table [dbo].[Products]
--
PRINT (N'Create foreign key on table [dbo].[Products]')
GO
ALTER TABLE dbo.Products WITH NOCHECK
  ADD FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses (WarehouseID)
GO

--
-- Create foreign key on table [dbo].[OutgoingOrders]
--
PRINT (N'Create foreign key on table [dbo].[OutgoingOrders]')
GO
ALTER TABLE dbo.OutgoingOrders
  ADD FOREIGN KEY (CustomerID) REFERENCES dbo.Customers (CustomerID)
GO

--
-- Create foreign key on table [dbo].[OutgoingOrders]
--
PRINT (N'Create foreign key on table [dbo].[OutgoingOrders]')
GO
ALTER TABLE dbo.OutgoingOrders
  ADD FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses (WarehouseID)
GO

--
-- Create foreign key on table [dbo].[OutgoingOrderDetails]
--
PRINT (N'Create foreign key on table [dbo].[OutgoingOrderDetails]')
GO
ALTER TABLE dbo.OutgoingOrderDetails
  ADD FOREIGN KEY (OrderID) REFERENCES dbo.OutgoingOrders (OrderID)
GO

--
-- Create foreign key on table [dbo].[OutgoingOrderDetails]
--
PRINT (N'Create foreign key on table [dbo].[OutgoingOrderDetails]')
GO
ALTER TABLE dbo.OutgoingOrderDetails
  ADD FOREIGN KEY (ProductID) REFERENCES dbo.Products (ProductID)
GO

--
-- Create foreign key on table [dbo].[OutgoingOrderDetails]
--
PRINT (N'Create foreign key on table [dbo].[OutgoingOrderDetails]')
GO
ALTER TABLE dbo.OutgoingOrderDetails
  ADD FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses (WarehouseID)
GO

--
-- Create foreign key on table [dbo].[IncomingReceipts]
--
PRINT (N'Create foreign key on table [dbo].[IncomingReceipts]')
GO
ALTER TABLE dbo.IncomingReceipts
  ADD FOREIGN KEY (SupplierID) REFERENCES dbo.Suppliers (SupplierID)
GO

--
-- Create foreign key on table [dbo].[IncomingReceipts]
--
PRINT (N'Create foreign key on table [dbo].[IncomingReceipts]')
GO
ALTER TABLE dbo.IncomingReceipts
  ADD FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses (WarehouseID)
GO

--
-- Create foreign key on table [dbo].[IncomingReceiptDetails]
--
PRINT (N'Create foreign key on table [dbo].[IncomingReceiptDetails]')
GO
ALTER TABLE dbo.IncomingReceiptDetails
  ADD FOREIGN KEY (ProductID) REFERENCES dbo.Products (ProductID)
GO

--
-- Create foreign key on table [dbo].[IncomingReceiptDetails]
--
PRINT (N'Create foreign key on table [dbo].[IncomingReceiptDetails]')
GO
ALTER TABLE dbo.IncomingReceiptDetails
  ADD FOREIGN KEY (ReceiptID) REFERENCES dbo.IncomingReceipts (ReceiptID)
GO

--
-- Create foreign key on table [dbo].[IncomingReceiptDetails]
--
PRINT (N'Create foreign key on table [dbo].[IncomingReceiptDetails]')
GO
ALTER TABLE dbo.IncomingReceiptDetails
  ADD FOREIGN KEY (WarehouseID) REFERENCES dbo.Warehouses (WarehouseID)
GO
SET NOEXEC OFF
GO