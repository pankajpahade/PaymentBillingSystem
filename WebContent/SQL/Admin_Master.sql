
CREATE TABLE `collegeinfo` (
  `CId` INT(11) NOT NULL AUTO_INCREMENT,
  `CName` VARCHAR(255) DEFAULT NULL,
  `CAdd` VARCHAR(255) DEFAULT NULL,
  `CCity` VARCHAR(50) DEFAULT NULL,
  `CState` VARCHAR(50) DEFAULT NULL,
  `CZip` INT(30) DEFAULT NULL,
  `CRegNo` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`CId`)
);

CREATE TABLE department (
    deptId INT NOT NULL AUTO_INCREMENT,
    dName VARCHAR(255) UNIQUE,
    PRIMARY KEY (deptId)
);

CREATE TABLE branches (
    branchId INT NOT NULL AUTO_INCREMENT,
    deptId INT,
    bName VARCHAR(255),
    PRIMARY KEY (branchId),
    CONSTRAINT FK_deptId FOREIGN KEY (deptId)
    REFERENCES department(deptId)
);


CREATE TABLE adminmaster (
    id INT NOT NULL AUTO_INCREMENT,
    cId INT UNIQUE,
    deptIds VARCHAR(255),
    branchIds VARCHAR(255),
    PRIMARY KEY(id),
    CONSTRAINT FK_coll FOREIGN KEY (CId)
    REFERENCES collegeinfo(CId)
);


/*Sample data for collegeinfo table*/
INSERT  INTO `collegeinfo`(`CId`,`CName`,`CAdd`,`CCity`,`CState`,`CZip`,`CRegNo`) VALUES 
(101,'NYSS','Wanadongari Nagpur','Nagpur','Maharashtra',440012,'NYSS88933'),
(102,'YCC','Hingna Nagpur','Nagpur','Maharashtra',89888,'YCC88733'),
(103,'COEP','Pinpari chinchavad','Pune','Maharashtra',88311,'COEP883222');

/*Sample data for department table*/
INSERT INTO department VALUES(1,'Engineering');
INSERT INTO department VALUES(2,'MBA');
INSERT INTO department VALUES(3,'MTech');

/*Sample data for branches table*/
INSERT INTO branches(deptId,bName) VALUES(1,'Computer Engineering');
INSERT INTO branches(deptId,bName) VALUES(1,'Mechanical Engineering');
INSERT INTO branches(deptId,bName) VALUES(1,'Civil Engineering');
INSERT INTO branches(deptId,bName) VALUES(1,'Electronics Engineering');
INSERT INTO branches(deptId,bName) VALUES(1,'Information Technology');
INSERT INTO branches(deptId,bName) VALUES(1,'Chemical Engineering');

/*Sample data for branches table*/
INSERT INTO branches(deptId,bName) VALUES(2,'MBA in Finance');
INSERT INTO branches(deptId,bName) VALUES(2,'MBA in HR');
INSERT INTO branches(deptId,bName) VALUES(2,'MBA in Accounts');

/*Sample data for branches table*/
INSERT INTO branches(deptId,bName) VALUES(3,'Computer Science Engineering');
INSERT INTO branches(deptId,bName) VALUES(3,'Mechanical Engineering');
INSERT INTO branches(deptId,bName) VALUES(3,'Civil Engineering');
INSERT INTO branches(deptId,bName) VALUES(3,'Electronics Engineering');

/*Sample data for adminmaster table*/
INSERT INTO adminmaster(cId,deptIds,branchIds) VALUES(101,'1,3','1,2,5,3,11,12');
INSERT INTO adminmaster(cId,deptIds,branchIds) VALUES(101,'1,3','1,2,5,3,11,12');







