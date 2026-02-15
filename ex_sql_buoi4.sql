--khởi tạo database
CREATE DATABASE IF NOT EXISTS ex_sql_buoi4


--tạo bảng
CREATE TABLE `User` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`fullName` VARCHAR(255),
	`email` VARCHAR(255) NOT NULL UNIQUE,
	`password` VARCHAR(255)
)

CREATE TABLE `Food` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`food_Name` VARCHAR(255),
	`image` VARCHAR(255),
	`price` FLOAT,
	`desc` VARCHAR(255),
	`type_id` INT,
	FOREIGN KEY (`type_id`) REFERENCES `Food_type`(`id`)
)

CREATE TABLE `Food_type` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`type_name` VARCHAR(255)
)

CREATE TABLE `Restaurant` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`res_Name` VARCHAR(255),
	`image` VARCHAR(255),
	`desc` VARCHAR(255)
)

CREATE TABLE `Order` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`user_id`  INT,
	`food_id` INT,
	`amount` INT,
	`code` VARCHAR(255),
	`arr_sub_id` VARCHAR(255),
	FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
	FOREIGN KEY (`food_id`) REFERENCES `Food`(`id`)
)

CREATE TABLE `Sub_food` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`sub_name` VARCHAR(255),
	`sub_price` FLOAT,
	`food_id` INT,
	FOREIGN KEY (`food_id`) REFERENCES `Food`(`id`)
)

CREATE TABLE `Like_res` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`user_id`  INT,
	`res_id`  INT,
	`date_like` DATETIME,
	FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
	FOREIGN KEY (`res_id`) REFERENCES `Restaurant`(`id`)
)

CREATE TABLE `Rate_res` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`user_id`  INT,
	`res_id`  INT,
	`amount` INT,
	`date_res` DATETIME,
	FOREIGN KEY (`user_id`) REFERENCES `User`(`id`),
	FOREIGN KEY (`res_id`) REFERENCES `Restaurant`(`id`)
)

--thêm dữ liệu vào bảng
INSERT INTO `User` (`fullname`,`email`,`password` ) VALUES
					("nguyen van A", "A@gmail.com", "12345"),
					("nguyen van B", "B@gmail.com", "12345"),
					("nguyen van C", "C@gmail.com", "12345"),
					("nguyen van D", "D@gmail.com", "12345"),
					("nguyen van E", "E@gmail.com", "12345"),
					("nguyen van F", "F@gmail.com", "12345"),
					
INSERT INTO `Restaurant` (`res_name`, `Image`, `desc`) VALUES
						('Pizza House', 'pizza.jpg', 'Best pizza in town'),
						('Sushi Tokyo', 'sushi.jpg', 'Fresh sushi daily'),
						('BBQ King', 'bbq.jpg', 'Delicious grilled food'),
						('Vegan Life', 'vegan.jpg', 'Healthy vegan meals'),
						('Coffee Chill', 'coffee.jpg', 'Cozy coffee shop');



INSERT INTO `Food_type` (`type_name`) VALUES
						("trái cây"),
						("rau củ"),
						("thịt"),
						("đồ ăn nhanh"),
						("đồ chay")
						
INSERT INTO `Food` (`food_Name`,`image`,`price`,`desc`,`type_id`) VALUES
					("cơm gà xối mở", "combaxoimo",100000,"ngon",4 ),
					("cháo hàu", "chauhau",120000,"hàu vũng tàu",3 ),
					("cơm chay", "comchay",90000,"ngonlam",5 ),
					("bún rêu", "bunreu",80000,"ngon",4 ),
					("trái cây tô", "traicayto",140000,"trái cây bến tre",1 )

INSERT INTO `Sub_food` (`sub_name`, `sub_price`, `food_id`) VALUES
						('Extra Cheese', 20000, 1),
						('Extra Salmon', 30000, 2),
						('BBQ Sauce', 10000, 3),
						('Avocado Topping', 20000, 4),
						('Extra Milk', 10000, 5);

INSERT INTO `Order` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`) VALUES
					(1, 1, 2, 'ORD001', '1'),
					(2, 2, 1, 'ORD002', '2'),
					(1, 3, 3, 'ORD003', '3'),
					(4, 4, 1, 'ORD004', '4'),
					(5, 5, 2, 'ORD005', '5');

INSERT INTO `Like_res` (`user_id`, `res_id`, `date_like`) VALUES
						(1, 1, '2024-01-10 08:30:00'),
						(2, 2, '2024-03-15 14:20:00'),
						(1, 3, '2024-06-05 19:45:00'),
						(1, 4, '2025-01-12 11:10:00'),
						(5, 5, '2025-02-01 21:05:00');

INSERT INTO `Rate_res` (`user_id`, `res_id`, `amount`, `date_res`) VALUES
					(1, 1, 5, '2024-01-10 09:00:00'),
					(2, 2, 4, '2024-03-16 15:00:00'),
					(3, 3, 5, '2024-06-06 20:00:00'),
					(4, 4, 3, '2025-01-13 12:00:00'),
					(5, 5, 4, '2025-02-02 22:00:00');



-- Tìm 5 người đã like nhà hàng nhiều nhất.
SELECT  COUNT(`user_id`) AS `Số lần like nhà hàng`,`user_id`, `fullName`, `email`
FROM `Like_res`
INNER JOIN `User` ON `Like_res`.`user_id` = `User`.`id`
GROUP BY `user_id`
ORDER BY `Số lần like nhà hàng` DESC
LIMIT 5


--Tìm 2 nhà hàng có lượt like nhiều nhất.
SELECT COUNT(`res_id`) AS `Số lượt like nhà hàng`,`res_id`, `res_Name`
FROM `Like_res`
INNER JOIN `Restaurant` ON `Like_res`.`res_id` = `Restaurant`.`id`
GROUP BY `res_id`
ORDER BY `Số lượt like nhà hàng` DESC
LIMIT 2


--Tìm người đã đặt hàng nhiều nhất.
SELECT COUNT(`user_id`) AS `số lần order`, `user_id`, `fullName`
FROM `Order`
INNER JOIN `User` ON `Order`.`user_id` = `User`.`id`
GROUP BY `user_id`
ORDER BY `số lần order` DESC
LIMIT 1


--Tìm người dùng không hoạt động trong hệ thống (không đặt hàng, không like, không đánh giá nhà hàng).
SELECT *
FROM `User`
LEFT JOIN `Order` ON `Order`.`user_id` = `User`.`id`
LEFT JOIN `Like_res` ON `Like_res`.`user_id` = `User`.`id`
LEFT JOIN `Rate_res` ON `Rate_res`.`user_id` = `User`.`id`
WHERE `Order`.`user_id` IS NULL AND `Like_res`.`user_id` IS NULL AND `Rate_res`.`user_id` IS NULL









