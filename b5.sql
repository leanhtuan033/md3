USE QuanLyBanHang;
insert into Customer (cID, cName, cAge)
values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
insert into `Order` (oID, cID, oDate, oTotalPrice)
values
(1, 1, '2006-03-21', NULL),
(2, 2, '2006-03-23', NULL),
(3, 1, '2006-03-16', NULL);
insert into Product (pID, pName, pPrice)
values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);
insert into OrderDetail (oID, pID, odQTY)
values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(3, 1, 8),
(2, 5, 4),
(2, 3, 3);

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
    oID,
    oDate,
    oTotalPrice as oPrice
from `Order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select
    Customer.cName,
    Product.pName
from Customer
join `Order`
    on Customer.cID = `Order`.cID
join OrderDetail
    on `Order`.oID = OrderDetail.oID
join Product
    on OrderDetail.pID = Product.pID;
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select Customer.cName
from Customer
left join `Order`
   on Customer.cID = `Order`.cID
where `Order`.oID is null;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select
    `Order`.oID,
    `Order`.oDate,
    SUM(OrderDetail.odQTY * Product.pPrice) as oPrice
from `Order`
join OrderDetail
    on `Order`.oID = OrderDetail.oID
join Product
    on OrderDetail.pID = Product.pID
group by
    `Order`.oID,
    `Order`.oDate;classclass