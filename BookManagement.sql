-- new database
create database LibraryManagement7;
use LibraryManagement7;

create table user(
userID varchar(10) not null primary key,
firstname varchar(30),
lastname varchar(30),
gender varchar(10),
password varchar(30),
DateofBirth date,
email varchar(30),
phone varchar(11),
StreetNo varchar(30),
City varchar(30),
State varchar(30),
userType varchar(20),
numBorrow int,
maxBorrow int,
fine decimal(10, 2),
userStatus varchar(15),
memberStatus bool null,
MembershipEndDate date null,
program varchar(30) null,
position varchar(30) null,
department varchar(30) null);

create table member_payment(
paymentID int not null auto_increment unique,
userID varchar(10),
amount decimal(10, 2),
paymentWay varchar(30),
addDays int,
operationTime timestamp default(current_timestamp()),
foreign key fk_userID(userID) references user(userID)
);

create table publisher(
publisherID varchar(10) not null primary key,
publisherName varchar(30),
establishedTime year,
publishNum int, 
publishPhone varchar(11));

create table location(
locationID varchar(10) not null primary key,
floorID varchar(10),
sectionID varchar(10),
shelfID varchar(10));

create table asset(
assetID varchar(10) not null primary key,
assetName varchar(30),
author varchar(30),
publishTime year,
assetType varchar(20),
publisherID varchar(10),
subjects varchar(30),
borrowTimes int,
locationID varchar(10) NULL,
physicalType varchar(15) NULL,
assetStatus varchar(15) NULL,
ISBN varchar(30) NULL,
totalNum int NULL,
remainNum int NULL,
price DECIMAL(10,2) NULL,
digitalType varchar(15) NULL,
URL varchar(50) NULL,
foreign key fk_publisherID(publisherID) references publisher(publisherID),
foreign key fk_locationID(locationID) references location(locationID)
);

create table borrow(
borrowID int not null auto_increment unique,
userID varchar(10),
foreign key fk_userID(userID) references user(userID),
assetID varchar(10),
foreign key fk_assetID(assetID) references asset(assetID),
userType varchar(20),
assetType varchar(20),
dueDate timestamp, -- 截止日期
borrowTime timestamp default (current_timestamp()), -- 如果设置为default就不再是显示，不能有任何东西动他
returnTime timestamp null -- 实际归还日期
);


create table fine(
paymentID int not null auto_increment primary key,
borrowID int,
foreign key fk_borrowID(borrowID) references borrow(borrowID),
assetID varchar(10),
userID varchar(10),
amount decimal(10, 2) null,
reason varchar(50),
paymentStatus varchar(10),
operationTime timestamp default (current_timestamp()),
processStatus varchar(15));


CREATE TABLE event_log (
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    message TEXT
);






-- Insert students
INSERT INTO user (userID, firstname, lastname, gender, password, DateofBirth, email, phone, StreetNo, City, State, userType, program)
VALUES
('U001', 'Charlie', 'Brown', 'Male', 'pass789', '1995-09-14', 'charlie.brown@example.com', '1122334455', '103', 'CityC', 'StateC', 'student', 'CYS'),
('U002', 'Sophia', 'Green', 'Female', 'pass111', '2002-07-19', 'sophia.green@example.com', '7788996655', '104', 'CityD', 'StateD', 'student', 'CST'),
('U003', 'Liam', 'Johnson', 'Male', 'pass222', '1997-02-10', 'liam.johnson@example.com', '6677889900', '105', 'CityE', 'StateE', 'student', 'ECE'),
('U007', 'Lucas', 'Scott', 'Male', 'pass666', '1998-01-23', 'lucas.scott@example.com', '6677889911', '109', 'CityI', 'StateI', 'student', 'CYS'),
('U010', 'Isabella', 'Brown', 'Female', 'pass999', '2003-04-18', 'isabella.brown@example.com', '9988774455', '112', 'CityL', 'StateL', 'student', 'SWE');

-- Insert faculty
INSERT INTO user (userID, firstname, lastname, gender, password, DateofBirth, email, phone, StreetNo, City, State, userType, position)
VALUES
('U011', 'William', 'Smith', 'Male', 'pass101', '1985-05-12', 'william.smith@example.com', '1234567890', '113', 'CityM', 'StateM', 'faculty', 'Lecturer'),
('U012', 'Olivia', 'Jones', 'Female', 'pass102', '1980-11-21', 'olivia.jones@example.com', '3344556677', '114', 'CityN', 'StateN', 'faculty', 'Professor'),
('U013', 'James', 'Taylor', 'Male', 'pass103', '1978-07-10', 'james.taylor@example.com', '5566778899', '115', 'CityO', 'StateO', 'faculty', 'Assistant Professor'),
('U014', 'Charlotte', 'White', 'Female', 'pass104', '1990-03-15', 'charlotte.white@example.com', '6677889900', '116', 'CityP', 'StateP', 'faculty', 'Dean'),
('U018', 'Emily', 'Martin', 'Female', 'pass108', '1988-12-03', 'emily.martin@example.com', '2233445566', '120', 'CityT', 'StateT', 'faculty', 'Researcher');

-- Insert staff
INSERT INTO user (userID, firstname, lastname, gender, password, DateofBirth, email, phone, StreetNo, City, State, userType, department)
VALUES
('U019', 'Michael', 'Miller', 'Male', 'pass201', '1982-05-10', 'michael.miller@example.com', '7788992233', '121', 'CityU', 'StateU', 'staff', 'Admission'),
('U020', 'Ella', 'Davis', 'Female', 'pass202', '1983-03-18', 'ella.davis@example.com', '3344556677', '122', 'CityV', 'StateV', 'staff', 'Finance'),
('U021', 'Jack', 'Clark', 'Male', 'pass203', '1991-11-30', 'jack.clark@example.com', '4455667788', '123', 'CityW', 'StateW', 'staff', 'IT'),
('U022', 'Aria', 'Hill', 'Female', 'pass204', '1985-07-29', 'aria.hill@example.com', '5566778899', '124', 'CityX', 'StateX', 'staff', 'HR'),
('U024', 'Harper', 'Allen', 'Female', 'pass206', '1986-09-14', 'harper.allen@example.com', '7788991122', '126', 'CityZ', 'StateZ', 'staff', 'Operations');

-- Insert off-campus users
INSERT INTO user (userID, firstname, lastname, gender, password, DateofBirth, email, phone, StreetNo, City, State, userType)
VALUES
('U025', 'Logan', 'Young', 'Male', 'pass301', '1993-01-09', 'logan.young@example.com', '9988775544', '127', 'CityAA', 'StateAA', 'off_campus'),
('U026', 'Zoe', 'King', 'Female', 'pass302', '1997-04-22', 'zoe.king@example.com', '6677889911', '128', 'CityBB', 'StateBB', 'off_campus'),
('U027', 'Henry', 'Wright', 'Male', 'pass303', '1995-06-18', 'henry.wright@example.com', '7788992233', '129', 'CityCC', 'StateCC', 'off_campus'),
('U028', 'Lily', 'Baker', 'Female', 'pass304', '1992-08-12', 'lily.baker@example.com', '5566778899', '130', 'CityDD', 'StateDD', 'off_campus'),
('U029', 'Alexander', 'Green', 'Male', 'pass305', '1994-05-25', 'alex.green@example.com', '9988774455', '131', 'CityEE', 'StateEE', 'off_campus');


INSERT INTO publisher (publisherID, publisherName, establishedTime, publishNum, publishPhone)
VALUES
('P001', 'Pearson', 1990, 200, '1234567890'),
('P002', 'O\'Reilly Media', 1985, 300, '0987654321'),
('P003', 'Springer', 2000, 500, '1122334455'),
('P004', 'Wiley', 1995, 400, '2233445566'),
('P005', 'Cambridge University Press', 1980, 350, '3344556677'),
('P006', 'Oxford University Press', 1975, 600, '4455667788'),
('P007', 'MIT Press', 1998, 250, '5566778899'),
('P008', 'McGraw-Hill', 1992, 450, '6677889900'),
('P009', 'Elsevier', 2005, 700, '7788990011'),
('P010', 'CRC Press', 2010, 150, '8899001122'),
('P011', 'Taylor & Francis', 1988, 180, '9988776655'),
('P012', 'SAGE Publications', 1993, 320, '8877665544'),
('P013', 'Palgrave Macmillan', 2001, 275, '7766554433'),
('P014', 'Thomson Reuters', 1997, 500, '6655443322'),
('P015', 'Cengage Learning', 2003, 420, '5544332211'),
('P016', 'Hachette Livre', 1982, 310, '4433221100'),
('P017', 'HarperCollins', 1986, 370, '3322110099'),
('P018', 'Simon & Schuster', 1994, 290, '2211009988'),
('P019', 'Macmillan Publishers', 1978, 610, '1100998877'),
('P020', 'Random House', 1980, 450, '0099887766');


INSERT INTO location (locationID, floorID, sectionID, shelfID)
VALUES
('L001', 'F1', 'S1', 'SH1'),
('L002', 'F2', 'S2', 'SH2'),
('L003', 'F3', 'S3', 'SH3'),
('L004', 'F1', 'S2', 'SH4'),
('L005', 'F2', 'S3', 'SH5'),
('L006', 'F3', 'S1', 'SH6'),
('L007', 'F1', 'S3', 'SH7'),
('L008', 'F2', 'S1', 'SH8'),
('L009', 'F3', 'S2', 'SH9'),
('L010', 'F4', 'S4', 'SH10');

-- Insert physical assets
INSERT INTO asset (assetID, assetName, author, publishTime, assetType, publisherID, subjects, locationID, physicalType, ISBN, totalNum, price)
VALUES
('A001', 'Database Systems', 'Elmasri', 2020, 'physical', 'P001', 'CS', 'L001', 'book', '9780136086208', 10, 22.5),
('A002', 'Python Programming', 'Mark Lutz', 2019, 'physical', 'P002', 'Programming', 'L002', 'book', '9781449355739', 7, 33.4),
('A003', 'Networking Basics', 'Kurose', 2018, 'physical', 'P001', 'Networking', 'L003', 'book', '9780133594140', 5, 66.7),
('A004', 'Computer Architecture', 'Hennessy', 2016, 'physical', 'P004', 'Hardware', 'L004', 'book', '9780123838728', 8, 45.5),
('A005', 'Discrete Mathematics', 'Rosen', 2021, 'physical', 'P005', 'Math', 'L005', 'book', '9780321335722', 6, 39.9),
('A006', 'Linear Algebra', 'Gilbert Strang', 2017, 'physical', 'P006', 'Math', 'L006', 'book', '9780980232776', 12, 50.0),
('A007', 'Operating Systems', 'Silberschatz', 2018, 'physical', 'P007', 'CS', 'L007', 'book', '9781119456339', 10, 60.3),
('A008', 'Clean Code', 'Robert C. Martin', 2008, 'physical', 'P008', 'Programming', 'L008', 'book', '9780132350884', 5, 28.9),
('A009', 'Cybersecurity Principles', 'Whitman', 2019, 'physical', 'P009', 'Security', 'L009', 'book', '9781284116458', 7, 35.2),
('A010', 'Data Science Handbook', 'Field Cady', 2017, 'physical', 'P010', 'Data Science', 'L010', 'book', '9781119446188', 4, 42.0);

-- Insert digital assets
INSERT INTO asset (assetID, assetName, author, publishTime, assetType, publisherID, subjects, ISBN, digitalType, URL)
VALUES
('A011', 'AI: A Modern Approach', 'Russell', 2021, 'digital', 'P003', 'AI', '9780136042594', 'magazine', 'https://www.example-ai.com'),
('A012', 'Deep Learning', 'Goodfellow', 2016, 'digital', 'P011', 'AI', '9780262035613', 'book', 'https://www.example-deeplearning.com'),
('A013', 'Blockchain Revolution', 'Tapscott', 2020, 'digital', 'P012', 'Blockchain', '9781101980132', 'book', 'https://www.example-blockchain.com'),
('A014', 'Cloud Computing Basics', 'Smith', 2019, 'digital', 'P013', 'Cloud', '9781119786194', 'magazine', 'https://www.example-cloud.com'),
('A015', 'JavaScript: The Good Parts', 'Douglas Crockford', 2008, 'digital', 'P014', 'Programming', '9780596517748', 'book', 'https://www.example-js.com'),
('A016', 'Digital Marketing Strategies', 'Chaffey', 2021, 'digital', 'P015', 'Marketing', '9781292241579', 'magazine', 'https://www.example-digitalmarketing.com'),
('A017', 'Big Data Analytics', 'Foster', 2018, 'digital', 'P016', 'Data Science', '9781491972922', 'book', 'https://www.example-bigdata.com'),
('A018', 'Game Development Essentials', 'Novak', 2020, 'digital', 'P017', 'Gaming', '9781337620079', 'magazine', 'https://www.example-gamedev.com'),
('A019', 'Quantum Computing', 'Nielsen', 2019, 'digital', 'P018', 'Quantum', '9781107002177', 'book', 'https://www.example-quantum.com'),
('A020', 'Mobile App Development', 'Murach', 2022, 'digital', 'P019', 'Mobile', '9781943872786', 'magazine', 'https://www.example-mobileapp.com');




-- user trigger
DROP TRIGGER IF EXISTS user_before_insert;
DELIMITER //

-- user before insert
    
CREATE TRIGGER user_before_insert
BEFORE INSERT ON user
FOR EACH ROW
BEGIN
	SET NEW.numBorrow = 0;
    SET NEW.userStatus = 'available';
    SET NEW.MembershipEndDate = NULL;
    SET NEW.fine = 0;
    
    IF NEW.userType = 'faculty' THEN
		SET NEW.maxBorrow = 30;
	ELSEIF NEW.userType = 'staff' THEN
		SET NEW.maxBorrow = 10;
	ELSEIF NEW.userType = 'off_campus' THEN
		SET NEW.maxBorrow = 0;
	else
		SET NEW.maxBorrow = 15;
	END IF;
    
    IF NEW.userType = 'off_campus' THEN
		SET NEW.memberStatus = 0;
	else
		SET NEW.memberStatus = NULL;
	END IF;
END//

DROP TRIGGER IF EXISTS user_before_delete;//

CREATE TRIGGER user_before_delete
BEFORE DELETE ON user
FOR EACH ROW
BEGIN
	IF OLD.fine > 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete user with unpaid fines.';
	END IF;
END;
	

// DELIMITER ;

-- asset trigger

DELIMITER //

DROP TRIGGER IF EXISTS asset_before_insert;//

CREATE TRIGGER asset_before_insert
BEFORE INSERT ON asset
FOR EACH ROW
BEGIN
	SET NEW.borrowTimes = 0;
    SET NEW.assetStatus = 'available';
    IF NEW.remainNum IS NULL THEN
        SET NEW.remainNum = NEW.totalNum;
    END IF;
END//



CREATE TRIGGER asset_before_delete
BEFORE DELETE ON asset
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM borrow WHERE assetID = OLD.assetID AND returnTime IS NULL) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete this asset, because still some havent return';
	END IF;
END;


// DELIMITER ;


-- borrow trigger

DELIMITER //

DROP TRIGGER IF EXISTS borrow_before_insert;//


-- borrow before insert

CREATE TRIGGER borrow_before_insert
BEFORE INSERT ON borrow
FOR EACH ROW
BEGIN
    
    IF (SELECT memberStatus FROM user WHERE userID = NEW.userID) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Non-members are not allowed to borrow assets.';
    END IF;

    IF (SELECT userStatus FROM user WHERE userID = NEW.userID) = 'unavailable' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'You have fine to pay';
    END IF;
    
    IF (SELECT numBorrow FROM user WHERE userID = NEW.userID) >= (SELECT maxBorrow FROM user WHERE userID = NEW.userID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User has exceeded maximum borrow limit.';
    END IF;
    
    SET NEW.assetType = (SELECT assetType FROM asset WHERE assetID = NEW.assetID);
    SET NEW.userType = (SELECT userType FROM user WHERE userID = NEW.userID);
    
    -- physical assets
    IF NEW.assetType = 'physical' THEN
        IF (SELECT remainNum FROM asset WHERE assetID = NEW.assetID) = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'The requested physical asset is not available for borrowing.';
        END IF;

        UPDATE asset
		SET remainNum = remainNum - 1,
			borrowTimes = borrowTimes + 1,
			assetStatus = CASE 
                    WHEN remainNum - 1 = 0 THEN 'unavailable' 
                    ELSE assetStatus
				END
		WHERE assetID = NEW.assetID;
		
        IF NEW.userType = 'faculty' THEN
			SET NEW.dueDate = DATE_ADD(NEW.borrowTime, INTERVAL 60 DAY);
		ELSE
			SET NEW.dueDate = DATE_ADD(NEW.borrowTime, INTERVAL 1 MINUTE); -- 记得改回DAY
		END IF;
        
	-- digital assets
    ELSEIF NEW.assetType = 'digital' THEN
        SET NEW.dueDate = CURRENT_TIMESTAMP;
        SET NEW.returnTime = CURRENT_TIMESTAMP;

        UPDATE asset
        SET borrowTimes = borrowTimes + 1
        WHERE assetID = NEW.assetID;
    END IF;

    
END//

DROP TRIGGER IF EXISTS borrow_after_insert;//
-- borrow after insert

CREATE TRIGGER borrow_after_insert
AFTER INSERT ON borrow
FOR EACH ROW
BEGIN
    -- update user's number of borrow
    IF NEW.assetType = 'physical' THEN
		UPDATE user
		SET numBorrow = numBorrow + 1
		WHERE userID = NEW.userID;
	END IF;
END//


-- borrow after update
CREATE TRIGGER borrow_after_update
AFTER UPDATE ON borrow
FOR EACH ROW
BEGIN
	IF OLD.returnTime IS NULL AND NEW.returnTime IS NOT NULL THEN
		UPDATE asset
        SET
			remainNum = remainNum + 1,
            assetStatus = CASE
				WHEN remainNum + 1 > 0 THEN 'available'
                ELSE assetStatus
			END
		WHERE assetID = NEW.assetID;
        
        UPDATE user
        SET numBorrow = numBorrow - 1
        WHERE userID = NEW.userID;
	END IF;
END;


//
DELIMITER ;



-- fine

DELIMITER //

DROP TRIGGER IF EXISTS fine_before_insert;//

CREATE TRIGGER fine_before_insert
BEFORE INSERT ON fine
FOR EACH ROW
BEGIN
    SET NEW.paymentStatus = 'unpaid';
    SET NEW.processStatus = 'unprocessed';
    
    IF NEW.reason = 'Broken' THEN
        -- read the price of book and set the amount of fine
        SET NEW.amount = (SELECT a.price * 2 + 30
                          FROM asset a
                          JOIN borrow b ON b.assetID = a.assetID
                          WHERE b.borrowID = NEW.borrowID LIMIT 1);
		SET NEW.userID = (SELECT b.userID
						  FROM borrow b
                          WHERE b.borrowID = NEW.borrowID LIMIT 1);
        SET NEW.assetID = (SELECT b.assetID
                           FROM borrow b
                           WHERE b.borrowID = NEW.borrowID LIMIT 1);
                          
		UPDATE asset
        SET 
        totalNum = totalNum - 1,
        remainNum = remainNum -1
        WHERE assetID = NEW.assetID;
    END IF;
		
END//

DELIMITER ;

DELIMITER //

DROP TRIGGER IF EXISTS fine_after_insert//

CREATE TRIGGER fine_after_insert
AFTER INSERT ON fine
FOR EACH ROW
BEGIN
    -- update the fine of user
    UPDATE user
    SET fine = (SELECT SUM(amount) FROM fine WHERE userID = NEW.userID AND paymentStatus = 'unpaid'),
    userStatus = 'unavailable'
    WHERE userID = NEW.userID;
END//

DELIMITER ;
DELIMITER //

DROP TRIGGER IF EXISTS fine_after_update//

CREATE TRIGGER fine_after_update
AFTER UPDATE ON fine
FOR EACH ROW
BEGIN
	-- check all the fine record
    IF NEW.paymentStatus = 'paid' AND NEW.reason = 'Overduefine' THEN
        -- update the return time in the borrow table
        UPDATE borrow
        SET returnTime = CURRENT_TIMESTAMP
        WHERE borrowID = NEW.borrowID;
    END IF;

    -- update the user's total amount of fine
    UPDATE user
    SET fine = (
        SELECT IFNULL(SUM(amount), 0)
        FROM fine
        WHERE userID = NEW.userID AND paymentStatus = 'unpaid'
    )
    WHERE userID = NEW.userID;

    -- update the user status
    UPDATE user
    SET userStatus = (
        SELECT CASE
            WHEN EXISTS (
                SELECT 1
                FROM fine
                WHERE userID = NEW.userID AND paymentStatus = 'unpaid'
            ) THEN 'unavailable'
            ELSE 'available'
        END
    )
    WHERE userID = NEW.userID;
END//

DELIMITER ;


-- member_payment trigger

DELIMITER //

DROP TRIGGER IF EXISTS member_payment_before_insert;//

-- member_payment berfore insert
CREATE TRIGGER member_payment_before_insert
BEFORE INSERT ON member_payment
FOR EACH ROW
BEGIN
    
	IF NEW.amount < 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Amount must be a positive value.';
	END IF;
    
    IF (SELECT userType FROM user WHERE userID = NEW.userID) != 'off_campus' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Only off-campus users can purchase membership.';
    END IF;
    
    SET NEW.addDays = FLOOR(NEW.amount / 100) * 365;    
END//

DROP TRIGGER IF EXISTS member_payment_after_insert;//

-- member_payment after insert

CREATE TRIGGER member_payment_after_insert
AFTER INSERT ON member_payment
FOR EACH ROW
BEGIN
	UPDATE USER
    SET
		MembershipEndDate = CASE
			WHEN memberStatus = 0 THEN
				DATE_ADD(CURRENT_DATE, INTERVAL NEW.addDays DAY)
			ELSE
				DATE_ADD(MembershipEndDate, INTERVAL NEW.addDays Day)
		END,
        memberStatus = 1
	WHERE userID = NEW.userID;
    
    UPDATE user
    SET maxBorrow = 15
        WHERE userID = NEW.userID;
    
END//

DELIMITER ;


-- events

SET GLOBAL event_scheduler = ON;


DELIMITER //

CREATE EVENT check_membership_status
ON SCHEDULE EVERY 1 DAY
STARTS current_timestamp
DO
BEGIN
	UPDATE user
    SET memberStatus = 0
    WHERE MembershipEndDate < CURRENT_DATE;
END//



DROP EVENT IF EXISTS daily_update_fines//

CREATE EVENT daily_update_fines
ON SCHEDULE EVERY 1 MINUTE
DO
BEGIN
    -- log message to check whether it works
    INSERT INTO event_log (message) VALUES ('Daily fine update executed successfully');

    -- insert new fine record
    INSERT INTO fine (borrowID, amount, reason, paymentStatus, assetID, userID)
    SELECT 
        b.borrowID,
        TIMESTAMPDIFF(MINUTE, b.dueDate, CURRENT_TIMESTAMP) * 0.2 AS amount,
        'Overduefine' AS reason,
        'unpaid' AS paymentStatus,
        b.assetID,
        b.userID
    FROM borrow b
    WHERE 
        b.returnTime IS NULL
        AND b.dueDate < CURRENT_TIMESTAMP
        AND NOT EXISTS (
            SELECT 1 FROM fine f 
            WHERE f.borrowID = b.borrowID AND f.reason = 'Overduefine'
        );

    -- update old fine record
    UPDATE fine f
    JOIN (
        SELECT borrowID, TIMESTAMPDIFF(MINUTE, b.dueDate, CURRENT_TIMESTAMP) * 0.2 AS new_amount
        FROM borrow b
        WHERE b.returnTime IS NULL AND b.dueDate < CURRENT_TIMESTAMP
    ) AS updates ON f.borrowID = updates.borrowID
    SET f.amount = updates.new_amount,
    f.operationTime = CURRENT_TIMESTAMP
    WHERE f.reason = 'Overduefine'
		AND f.paymentStatus = 'unpaid';

    
END//

//
DELIMITER ;





SELECT * FROM user;
SELECT * FROM asset;
SELECT * FROM borrow;
SELECT * FROM fine;
SELECT * FROM location;
SELECT * FROM publisher;
SELECT * FROM member_payment;
SELECT * FROM event_log;

SHOW TRIGGERS;
SHOW EVENTS;

-- 经过验证的插入命令

-- membership
-- staff
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U019', 150, 'credit card');

-- off-campus
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U025', 200, 'debit card');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U026', 200, 'paypal');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U027', 300, 'credit card');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U028', 100, 'debit card');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U028', 200, 'paypal');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U027', 200, 'credit card');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U026', 100, 'debit card');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U025', 300, 'paypal');
INSERT INTO member_payment (userID, amount, paymentWay)
VALUES ('U012', 230, 'credit card');

-- insert borrow
INSERT INTO borrow (userID, assetID) VALUES ('U002', 'A003');
INSERT INTO borrow (userID, assetID) VALUES ('U003', 'A004');
INSERT INTO borrow (userID, assetID) VALUES ('U019', 'A005');
INSERT INTO borrow (userID, assetID) VALUES ('U020', 'A006');
INSERT INTO borrow (userID, assetID) VALUES ('U025', 'A007');
INSERT INTO borrow (userID, assetID) VALUES ('U007', 'A008');
INSERT INTO borrow (userID, assetID) VALUES ('U026', 'A009');
INSERT INTO borrow (userID, assetID) VALUES ('U012', 'A010');
INSERT INTO borrow (userID, assetID) VALUES ('U010', 'A001');
INSERT INTO borrow (userID, assetID) VALUES ('U028', 'A002');


-- return book (normal)
UPDATE borrow
SET returnTime = CURRENT_TIMESTAMP
WHERE borrowID = 8;

-- return book (overdue)
	-- once the fine was paid, return the book automatically
UPDATE fine
SET paymentStatus = 'paid'
WHERE paymentID = 14;
    
    
-- no matter pay what kind of fine, the book will be return automatically
-- set broken fine
INSERT INTO fine (borrowID, reason)
VALUES
(9, 'Broken');

-- pay broken fine
UPDATE fine
SET paymentStatus = 'paid'
WHERE paymentID = 13;









