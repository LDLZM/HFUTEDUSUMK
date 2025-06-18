/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.26 : Database - hfut_edusupermarket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hfut_edusupermarket` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hfut_edusupermarket`;

/*Table structure for table `approved_purchase_demands` */

DROP TABLE IF EXISTS `approved_purchase_demands`;

CREATE TABLE `approved_purchase_demands` (
  `approved_id` varchar(20) NOT NULL,
  `demand_id` varchar(20) DEFAULT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `demand_quantity` int NOT NULL COMMENT '需求数量',
  `demand_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '需求创建日期',
  `approved_at` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `deadline_date` timestamp NOT NULL COMMENT '报价截止日期',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态：0-开放报价，1-关闭报价',
  `winning_supplier_id` varchar(20) DEFAULT NULL,
  `winning_price` decimal(10,2) DEFAULT NULL COMMENT '中标价格',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`approved_id`),
  UNIQUE KEY `uniq_demand_id` (`demand_id`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_status` (`status`),
  KEY `idx_deadline_date` (`deadline_date`),
  KEY `fk_approved_supplier` (`winning_supplier_id`),
  CONSTRAINT `fk_approved_demand` FOREIGN KEY (`demand_id`) REFERENCES `purchase_demands` (`demand_id`),
  CONSTRAINT `fk_approved_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_approved_supplier` FOREIGN KEY (`winning_supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `approved_purchase_demands` */

insert  into `approved_purchase_demands`(`approved_id`,`demand_id`,`product_id`,`demand_quantity`,`demand_date`,`approved_at`,`deadline_date`,`status`,`winning_supplier_id`,`winning_price`,`created_at`,`updated_at`) values ('AD2506001','D2505001','G01010101',100,'2025-06-18 10:57:44','2025-06-18 10:57:48','2025-06-25 10:57:48',1,'S001','20.00','2025-06-18 10:57:48','2025-06-18 10:59:09'),('AD2506002','D2505002','G01010201',200,'2025-06-18 17:14:07','2025-06-18 14:26:49','2025-06-25 14:26:49',1,'S001','100.00','2025-06-18 14:26:49','2025-06-18 14:31:09');

/*Table structure for table `edu_supermarket_roles` */

DROP TABLE IF EXISTS `edu_supermarket_roles`;

CREATE TABLE `edu_supermarket_roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `home_page` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_supermarket_roles` */

insert  into `edu_supermarket_roles`(`role_id`,`role_name`,`home_page`,`description`) values (1,'总经理','manager\\manage','系统管理员，拥有最高权限'),(2,'商品信息中心','products\\list','负责商品信息管理'),(3,'采购部门','demand\\list','负责商品采购管理'),(4,'审核部门','check\\what','负责业务审核管理'),(5,'仓库部门','inventory\\list','负责仓库库存管理'),(6,'销售部门','sales\\list','负责商品销售管理'),(7,'财务部门','finance\\list','负责财务管理'),(8,'供应商','approvedDemand\\list','外部供应商用户'),(9,'人事部门','users\\list','负责人力资源管理');

/*Table structure for table `edu_supermarket_users` */

DROP TABLE IF EXISTS `edu_supermarket_users`;

CREATE TABLE `edu_supermarket_users` (
  `id` varchar(20) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `status` tinyint DEFAULT '1' COMMENT '用户状态：1-正常，0-禁用',
  PRIMARY KEY (`id`),
  KEY `fk_edu_supermarket_users_role_id` (`role_id`),
  CONSTRAINT `fk_edu_supermarket_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `edu_supermarket_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_supermarket_users` */

insert  into `edu_supermarket_users`(`id`,`username`,`password`,`role_id`,`status`) values ('E200307001','cw','123',7,1),('E200906001','xs','123',6,1),('E201105001','ck','123',5,1),('E201904001','sh','123',4,1),('E202008001','rs','123',8,1),('E202103001','cg','123',3,1),('E202302001','spxx','123',2,1),('E202501001','root','123',1,1),('E202501003','super','123',1,1),('S001','gys1','123',8,1),('S002','gys2','123',8,1);

/*Table structure for table `financial_records` */

DROP TABLE IF EXISTS `financial_records`;

CREATE TABLE `financial_records` (
  `record_id` varchar(20) NOT NULL,
  `order_id` varchar(20) DEFAULT NULL,
  `bid_id` varchar(20) DEFAULT NULL,
  `transaction_type` tinyint(1) NOT NULL COMMENT '交易类型：1-收入，2-支出',
  `amount` decimal(10,2) NOT NULL COMMENT '金额',
  `transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '交易日期',
  `payment_method` varchar(50) DEFAULT NULL COMMENT '支付方式',
  `description` varchar(255) DEFAULT NULL COMMENT '交易描述',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-取消，1-有效',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`record_id`),
  KEY `idx_order_id` (`order_id`),
  KEY `idx_bid_id` (`bid_id`),
  KEY `idx_transaction_date` (`transaction_date`),
  KEY `idx_transaction_type` (`transaction_type`),
  CONSTRAINT `fk_financial_bid` FOREIGN KEY (`bid_id`) REFERENCES `supplier_bids` (`bid_id`),
  CONSTRAINT `fk_financial_order` FOREIGN KEY (`order_id`) REFERENCES `sales_orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `financial_records` */

insert  into `financial_records`(`record_id`,`order_id`,`bid_id`,`transaction_type`,`amount`,`transaction_date`,`payment_method`,`description`,`status`,`created_at`,`updated_at`) values ('F100001','S01250617001',NULL,1,'5.00','2025-06-18 11:04:24',NULL,'销售订单 #S01250617001 收入',1,'2025-06-18 11:04:24','2025-06-18 11:04:24'),('F100002','S01250617002',NULL,1,'30.00','2025-06-18 14:48:41','现金','销售订单 #S01250617002 收入',1,'2025-06-18 14:48:41','2025-06-18 14:48:41'),('F200001',NULL,'BS001AD2506001',2,'20.00','2025-06-18 10:59:09','系统自动生成',NULL,1,'2025-06-18 10:59:09','2025-06-18 10:59:09'),('F200002',NULL,'BS001AD2506002',2,'100.00','2025-06-18 14:31:09','系统自动生成',NULL,1,'2025-06-18 14:31:09','2025-06-18 14:31:09');

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `inventory_id` varchar(20) NOT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `quantity` int NOT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `inventory` */

insert  into `inventory`(`inventory_id`,`product_id`,`quantity`,`last_updated`,`event`) values ('I100001','G01010101',100,'2025-06-18 11:03:12','验收货物入库（关联 product_check ID:C2506001）'),('I100002','G01010101',99,'2025-06-18 11:04:24','销售出库（订单#S01250617001）'),('I100003','G01010201',200,'2025-06-18 14:40:38','验收货物入库（关联 product_check ID:C2506002）'),('I100004','G01010201',190,'2025-06-18 14:48:41','销售出库（订单#S01250617002）');

/*Table structure for table `logtable` */

DROP TABLE IF EXISTS `logtable`;

CREATE TABLE `logtable` (
  `value` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `logtable` */

insert  into `logtable`(`value`) values ('1'),('1000'),('10'),('1010101'),('01010101');

/*Table structure for table `product_check` */

DROP TABLE IF EXISTS `product_check`;

CREATE TABLE `product_check` (
  `id` varchar(20) NOT NULL,
  `approved_id` varchar(20) DEFAULT NULL,
  `is_ok` int DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_check_ibfk_1` (`approved_id`),
  CONSTRAINT `product_check_ibfk_1` FOREIGN KEY (`approved_id`) REFERENCES `approved_purchase_demands` (`approved_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product_check` */

insert  into `product_check`(`id`,`approved_id`,`is_ok`,`remarks`) values ('C2506001','AD2506001',1,NULL),('C2506002','AD2506002',1,'');

/*Table structure for table `products` */

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `product_id` varchar(20) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `products` */

insert  into `products`(`product_id`,`product_name`,`category`,`unit_price`) values ('G01010101','XX薯片','食品','5.00'),('G01010201','YY饼干','食品','3.00'),('G03010101','XX尺子','文具','3.00'),('G03010201','YY橡皮','文具','2.00'),('G03010202','KKK橡皮','文具','6.00');

/*Table structure for table `purchase_demands` */

DROP TABLE IF EXISTS `purchase_demands`;

CREATE TABLE `purchase_demands` (
  `demand_id` varchar(20) NOT NULL,
  `product_id` varchar(20) DEFAULT NULL,
  `demand_quantity` int NOT NULL,
  `demand_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_closed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`demand_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `purchase_demands_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `purchase_demands` */

insert  into `purchase_demands`(`demand_id`,`product_id`,`demand_quantity`,`demand_date`,`is_closed`) values ('D2505001','G01010101',100,'2025-06-18 10:57:44',1),('D2505002','G01010201',200,'2025-06-18 17:14:07',1);

/*Table structure for table `sales_orders` */

DROP TABLE IF EXISTS `sales_orders`;

CREATE TABLE `sales_orders` (
  `order_id` varchar(20) NOT NULL,
  `order_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` varchar(20) DEFAULT NULL,
  `quantity` int NOT NULL DEFAULT '1' COMMENT '销售数量',
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL COMMENT '支付方式',
  `payment_status` tinyint(1) DEFAULT '0' COMMENT '支付状态：0-未支付，1-已支付',
  `remarks` varchar(255) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`order_id`),
  KEY `idx_order_date` (`order_date`),
  KEY `idx_product_id` (`product_id`),
  KEY `idx_payment_status` (`payment_status`),
  CONSTRAINT `fk_sales_order_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sales_orders` */

insert  into `sales_orders`(`order_id`,`order_date`,`product_id`,`quantity`,`total_amount`,`payment_method`,`payment_status`,`remarks`) values ('S01250617001','2025-06-18 11:04:20','G01010101',1,'5.00',NULL,1,NULL),('S01250617002','2025-06-18 14:45:25','G01010201',10,'30.00','现金',1,'123'),('S01250617003','2025-06-18 14:51:01','G01010101',12,'60.00',NULL,0,'23');

/*Table structure for table `supplier_bids` */

DROP TABLE IF EXISTS `supplier_bids`;

CREATE TABLE `supplier_bids` (
  `bid_id` varchar(20) NOT NULL,
  `approved_id` varchar(20) DEFAULT NULL,
  `supplier_id` varchar(20) DEFAULT NULL,
  `bid_price` decimal(10,2) NOT NULL COMMENT '报价',
  `delivery_days` int NOT NULL COMMENT '交货天数',
  `bid_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '报价时间',
  `is_winning` tinyint(1) DEFAULT '0' COMMENT '是否中标',
  `bid_remarks` varchar(255) DEFAULT NULL COMMENT '报价备注',
  PRIMARY KEY (`bid_id`),
  KEY `idx_approved_id` (`approved_id`),
  KEY `idx_supplier_id` (`supplier_id`),
  KEY `idx_is_winning` (`is_winning`),
  CONSTRAINT `fk_bid_approved_demand` FOREIGN KEY (`approved_id`) REFERENCES `approved_purchase_demands` (`approved_id`),
  CONSTRAINT `fk_bid_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `supplier_bids` */

insert  into `supplier_bids`(`bid_id`,`approved_id`,`supplier_id`,`bid_price`,`delivery_days`,`bid_time`,`is_winning`,`bid_remarks`) values ('BS001AD2506001','AD2506001','S001','20.00',10,'2025-06-18 10:59:03',1,NULL),('BS001AD2506002','AD2506002','S001','100.00',10,'2025-06-18 14:28:51',1,'');

/*Table structure for table `suppliers` */

DROP TABLE IF EXISTS `suppliers`;

CREATE TABLE `suppliers` (
  `supplier_id` varchar(20) NOT NULL,
  `supplier_name` varchar(100) NOT NULL COMMENT '供应商名称',
  `contact_person` varchar(50) DEFAULT NULL COMMENT '联系人姓名',
  `contact_phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `contact_email` varchar(50) DEFAULT NULL COMMENT '联系邮箱',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态：0-禁用，1-启用',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`supplier_id`),
  UNIQUE KEY `uniq_supplier_name` (`supplier_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `suppliers` */

insert  into `suppliers`(`supplier_id`,`supplier_name`,`contact_person`,`contact_phone`,`contact_email`,`status`,`created_at`) values ('S001','gys1','AAA','3243567','4',1,'2025-06-07 09:26:39'),('S002','gys2','BBB',NULL,NULL,1,'2025-06-17 21:50:51');

/* Trigger structure for table `approved_purchase_demands` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insert_into_check_product` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insert_into_check_product` AFTER UPDATE ON `approved_purchase_demands` FOR EACH ROW BEGIN
    -- 仅在 winning_supplier_id 从 NULL 变为非空时触发
    IF OLD.winning_supplier_id IS NULL AND NEW.winning_supplier_id IS NOT NULL THEN
        INSERT INTO product_check (id, approved_id, is_ok)
        VALUES (generate_check_product_id(), NEW.approved_id, 0);
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `product_check` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_inventory_after_check` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_inventory_after_check` AFTER UPDATE ON `product_check` FOR EACH ROW BEGIN
    -- 声明变量存储 product_id、demand_quantity 和流水号等
    DECLARE v_product_id varchar(20);
    DECLARE v_demand_quantity INT;
    DECLARE next_sequence INT;
    DECLARE new_inventory_id VARCHAR(20);
    DECLARE latest_quantity INT DEFAULT 0; -- 初始化为0
    DECLARE inventory_exists INT DEFAULT 0; -- 标记是否存在库存记录
    
    -- 仅在 is_ok 从 0 变为 1 时触发逻辑
    IF OLD.is_ok = 0 AND NEW.is_ok = 1 THEN
        -- 从 approved_purchase_demands 表获取 product_id 和 demand_quantity
        SELECT product_id, demand_quantity 
        INTO v_product_id, v_demand_quantity
        FROM approved_purchase_demands
        WHERE approved_id = NEW.approved_id;
        
        -- 检查是否存在该产品的库存记录
        SELECT COUNT(*) INTO inventory_exists
        FROM inventory
        WHERE product_id = v_product_id;
        
        -- 如果存在记录，获取最新库存数量
        IF inventory_exists > 0 THEN
            SELECT quantity
            INTO latest_quantity
            FROM inventory
            WHERE product_id = v_product_id
            ORDER BY last_updated DESC
            LIMIT 1;
        END IF;
        
        -- 获取当前最大流水号，生成新的 inventory_id（格式：I1 + 五位流水码）
        SELECT IFNULL(MAX(CAST(SUBSTRING(inventory_id, 3) AS UNSIGNED)), 0) + 1 
        INTO next_sequence
        FROM inventory
        WHERE SUBSTRING(inventory_id, 1, 2) = 'I1';
        
        SET new_inventory_id = CONCAT('I1', LPAD(next_sequence, 5, '0'));
        
        -- 插入新的库存变动记录
        INSERT INTO inventory (
            inventory_id, 
            product_id, 
            quantity, 
            last_updated, 
            `event`
        ) VALUES (
            new_inventory_id,
            v_product_id,
            latest_quantity + v_demand_quantity, -- 直接计算，初始时为0+需求数量
            NOW(),
            CONCAT('验收货物入库（关联 product_check ID:', NEW.id, '）')
        );
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `purchase_demands` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_sync_approved_demands` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_sync_approved_demands` AFTER UPDATE ON `purchase_demands` FOR EACH ROW BEGIN
  IF OLD.is_closed = 0 AND NEW.is_closed = 1 THEN
    INSERT INTO approved_purchase_demands (
      approved_id, demand_id, product_id, demand_quantity, 
      demand_date, approved_at, deadline_date, STATUS
    ) VALUES (
      generate_approved_id(), 
      NEW.demand_id, 
      NEW.product_id, 
      NEW.demand_quantity,
      NEW.demand_date, 
      NOW(), 
      DATE_ADD(NOW(), INTERVAL 7 DAY), 
      0
    );
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `sales_orders` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_calculate_order_total_on_insert` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_calculate_order_total_on_insert` BEFORE INSERT ON `sales_orders` FOR EACH ROW BEGIN
  -- 从products表获取单价并计算总金额
  DECLARE product_price DECIMAL(10,2);
  SELECT unit_price INTO product_price FROM products WHERE product_id = NEW.product_id;
  
  -- 设置订单的总金额
  SET NEW.total_amount = product_price * NEW.quantity;
END */$$


DELIMITER ;

/* Trigger structure for table `sales_orders` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_calculate_order_total_on_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_calculate_order_total_on_update` BEFORE UPDATE ON `sales_orders` FOR EACH ROW BEGIN
  -- 声明变量必须在BEGIN块的最开始
  DECLARE new_product_price DECIMAL(10,2);
  
  -- 如果product_id或quantity发生变化，重新计算总金额
  IF OLD.product_id != NEW.product_id OR OLD.quantity != NEW.quantity THEN
    SELECT unit_price INTO new_product_price FROM products WHERE product_id = NEW.product_id;
    
    -- 设置新的总金额
    SET NEW.total_amount = new_product_price * NEW.quantity;
  END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `sales_orders` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_update_inventory_and_create_income` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_update_inventory_and_create_income` AFTER UPDATE ON `sales_orders` FOR EACH ROW BEGIN
    DECLARE current_quantity INT;
    DECLARE inventory_exists INT DEFAULT 0;
    DECLARE next_sequence_i INT;
    DECLARE next_sequence_f INT;
    DECLARE new_inventory_id VARCHAR(20);
    DECLARE new_F_record_id VARCHAR(20);
    -- 只处理订单状态从"未完成"变为"已完成"的情况
    IF OLD.payment_status != 1 AND NEW.payment_status = 1 THEN
        -- 检查产品是否存在于库存中
        SELECT COUNT(*) INTO inventory_exists
        FROM inventory
        WHERE product_id = NEW.product_id;
        
        -- 如果产品不存在于库存中，抛出错误
        IF inventory_exists = 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = '产品不存在于库存中', MYSQL_ERRNO = 1002;
        END IF;
        
        -- 获取当前库存数量并加锁
        SELECT quantity INTO current_quantity
        FROM inventory
        WHERE product_id = NEW.product_id
        ORDER BY last_updated DESC
        LIMIT 1
        FOR UPDATE; -- 添加行锁，防止并发问题
        
        -- 检查库存是否足够
        IF current_quantity < NEW.quantity THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = '库存不足，无法完成订单', MYSQL_ERRNO = 1001;
        ELSE
            -- 获取当前的最大流水号（修复逻辑）
            SELECT IFNULL(MAX(CAST(SUBSTRING(inventory_id, 3) AS UNSIGNED)), 0) + 1 
            INTO next_sequence_i
            FROM inventory
            WHERE SUBSTRING(inventory_id, 1, 2) = 'I1'; -- 匹配I0开头的记录
            
            SELECT IFNULL(MAX(CAST(SUBSTRING(record_id, 3) AS UNSIGNED)), 0) + 1 
            INTO next_sequence_f
            FROM `financial_records`
            WHERE SUBSTRING(record_id, 1, 2) = 'F1'; -- 匹配F0开头的记录
            
            -- 生成新的inventory_id（格式：I+0+五位流水码）
            SET new_inventory_id = CONCAT('I1', LPAD(next_sequence_i, 5, '0'));
            
            -- 生成新的financial record_id（格式：F+0+五位流水码）
            SET new_F_record_id = CONCAT('F1', LPAD(next_sequence_f, 5, '0'));
            
            -- 库存足够，插入新的库存记录
            INSERT INTO inventory (
                inventory_id, 
                product_id, 
                quantity, 
                last_updated, 
                EVENT
            ) VALUES (
                new_inventory_id,
                NEW.product_id,
                current_quantity - NEW.quantity,
                NOW(),
                CONCAT('销售出库（订单#', NEW.order_id, '）')
            );
            
            -- 创建财务收入记录
            INSERT INTO financial_records (
                record_id, order_id, transaction_type, amount, transaction_date, 
                payment_method, description, STATUS
            ) VALUES (
                new_F_record_id, NEW.order_id, 1, NEW.total_amount, NOW(), NEW.payment_method, 
                CONCAT('销售订单 #', NEW.order_id, ' 收入'), 1
            );
        END IF;
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `supplier_bids` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `update_demand_status_after_bid_update` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `update_demand_status_after_bid_update` AFTER UPDATE ON `supplier_bids` FOR EACH ROW BEGIN
    IF NEW.is_winning = 1 AND OLD.is_winning = 0 THEN
        UPDATE approved_purchase_demands apd
        SET apd.`status` = 1,
	    apd.winning_supplier_id = New .supplier_id,
	    apd.winning_price = new .bid_price
        WHERE approved_id = NEW.approved_id;
    END IF;
END */$$


DELIMITER ;

/* Trigger structure for table `supplier_bids` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trg_create_financial_expense` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `trg_create_financial_expense` AFTER UPDATE ON `supplier_bids` FOR EACH ROW BEGIN
    -- 声明变量
    DECLARE demand_quantity INT;
    DECLARE product_name VARCHAR(255);
    DECLARE next_sequence_f INT;
    DECLARE new_F_record_id VARCHAR(20);
    
    IF OLD.is_winning = 0 AND NEW.is_winning = 1 THEN
        -- 获取需求数量
        SELECT demand_quantity INTO demand_quantity
        FROM purchase_demands
        WHERE demand_id = (
            SELECT demand_id 
            FROM approved_purchase_demands 
            WHERE approved_id = NEW.approved_id
        );
        
        -- 获取产品名称
        SELECT product_name INTO product_name
        FROM products
        WHERE product_id = (
            SELECT product_id 
            FROM approved_purchase_demands 
            WHERE approved_id = NEW.approved_id
        );
        
        -- 获取当前的最大流水号
        SELECT IFNULL(MAX(CAST(SUBSTRING(record_id, 3) AS UNSIGNED)), 0) + 1 
        INTO next_sequence_f
        FROM `financial_records`
        WHERE SUBSTRING(record_id, 1, 2) = 'F2'; -- 匹配F1开头的记录
        
        -- 生成新的financial record_id（格式：F1+五位流水码）
        SET new_F_record_id = CONCAT('F2', LPAD(next_sequence_f, 5, '0'));
        
        -- 创建财务支出记录
        INSERT INTO financial_records (
            record_id, bid_id, transaction_type, amount, transaction_date, 
            payment_method, description, STATUS
        ) VALUES (
            new_F_record_id, NEW.bid_id, 2, NEW.bid_price , NOW(), '系统自动生成', 
            CONCAT('采购产品 "', product_name, '" 支出'), 1
        );
    END IF;
END */$$


DELIMITER ;

/* Function  structure for function  `generate_approved_id` */

/*!50003 DROP FUNCTION IF EXISTS `generate_approved_id` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `generate_approved_id`() RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
    SQL SECURITY INVOKER
BEGIN
    DECLARE date_part VARCHAR(6);  -- 避免使用保留关键字
    DECLARE seq_part VARCHAR(3);
    DECLARE today_count INT DEFAULT 0;
    DECLARE result_id VARCHAR(12);
    
    -- 获取当前日期的年份后两位和月份日期
    SET date_part = DATE_FORMAT(NOW(), '%y%m');
    
    -- 统计今天已经生成的数量
    SELECT COUNT(*) 
    INTO today_count 
    FROM approved_purchase_demands 
    WHERE approved_id LIKE CONCAT('AD', date_part, '%');
    
    -- 生成三位流水号，不足三位前面补0
    SET seq_part = LPAD(today_count + 1, 3, '0');
    
    -- 组合生成最终ID
    SET result_id = CONCAT('AD', date_part, seq_part);
    
    RETURN result_id;
END */$$
DELIMITER ;

/* Function  structure for function  `generate_check_product_id` */

/*!50003 DROP FUNCTION IF EXISTS `generate_check_product_id` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `generate_check_product_id`() RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    -- 提取年份后两位、月份（补0）
    DECLARE year_part CHAR(2) DEFAULT RIGHT(YEAR(NOW()), 2);
    DECLARE month_part CHAR(2) DEFAULT LPAD(MONTH(NOW()), 2, '0');
    
    -- 查询当前最大流水号（按规则截取后3位转换为数字）
    DECLARE max_seq INT DEFAULT 0;
    SELECT COALESCE(MAX(SUBSTRING(id, -3)), 0) 
    INTO max_seq 
    FROM product_check
    WHERE id LIKE CONCAT('C', year_part, month_part, '%');
    
    -- 流水号自增（补0到3位）
    SET max_seq = max_seq + 1;
    RETURN CONCAT('C', year_part, month_part, LPAD(max_seq, 3, '0'));
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
