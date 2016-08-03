-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.52-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema courtdb
--

CREATE DATABASE IF NOT EXISTS courtdb;
USE courtdb;

--
-- Definition of table `attachment`
--

DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `casenum` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `location` varchar(45) NOT NULL,
  `party` varchar(45) NOT NULL,
  PRIMARY KEY (`casenum`,`name`),
  CONSTRAINT `FK_attachment_1` FOREIGN KEY (`casenum`) REFERENCES `casedata` (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attachment`
--

/*!40000 ALTER TABLE `attachment` DISABLE KEYS */;
INSERT INTO `attachment` (`casenum`,`name`,`location`,`party`) VALUES 
 ('DDR-8-16','qwert','h:poyu','Plaintiff'),
 ('DHP-3-16','PROXY','C:UsersEwisDesktopucsc-cs','Plaintiff'),
 ('DHP-4-16','proxy','c:proxy','Plaintiff'),
 ('DMB-35-16','Agreement','c:po12','Plaintiff'),
 ('DMB-35-16','c:dmb-35-16','evidence','Defendant'),
 ('DMB-35-16','Proxy','c:po','Plaintiff'),
 ('DMB-36-16','c:dmb-36-16','agreement','Plaintiff'),
 ('DMR-2-16','proxy','c:p','Plaintiff'),
 ('DMS-17-16','proxy','c:\rwerw','Defendant');
/*!40000 ALTER TABLE `attachment` ENABLE KEYS */;


--
-- Definition of table `backup`
--

DROP TABLE IF EXISTS `backup`;
CREATE TABLE `backup` (
  `backupNum` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `userID` varchar(45) NOT NULL,
  PRIMARY KEY (`backupNum`),
  KEY `FK_backup_1` (`userID`),
  CONSTRAINT `FK_backup_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `backup`
--

/*!40000 ALTER TABLE `backup` DISABLE KEYS */;
/*!40000 ALTER TABLE `backup` ENABLE KEYS */;


--
-- Definition of table `casedata`
--

DROP TABLE IF EXISTS `casedata`;
CREATE TABLE `casedata` (
  `casenum` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `value` double NOT NULL,
  `nature` varchar(45) NOT NULL,
  `procedure` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `hearingDate` date NOT NULL,
  `tempcasenum` int(10) unsigned NOT NULL,
  PRIMARY KEY (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `casedata`
--

/*!40000 ALTER TABLE `casedata` DISABLE KEYS */;
INSERT INTO `casedata` (`casenum`,`type`,`value`,`nature`,`procedure`,`status`,`hearingDate`,`tempcasenum`) VALUES 
 ('DDR-7-16','Debt Recovery',34500,'Money Case','Regular','stampduty','0000-00-00',7),
 ('DDR-8-16','Debt Recovery',30000,'Money Case','Regular','stampduty','0000-00-00',8),
 ('DHP-1-16','Hire Purchase',12000,'Money Case','Regular','stampduty','0000-00-00',1),
 ('DHP-2-16','Hire Purchase',13000,'Money Case','Regular','stampduty','0000-00-00',2),
 ('DHP-3-16','Hire Purchase',45000,'Money Case','Regular','stampduty','0000-00-00',3),
 ('DHP-4-16','Hire Purchase',14500,'Money Case','Regular','stampduty','0000-00-00',4),
 ('DMB-34-16','Mortgage Bond',124000,'Money Case','Regular','stampduty','0000-00-00',34),
 ('DMB-35-16','Mortgage Bond',124500,'Money Case','Regular','stampduty','0000-00-00',35),
 ('DMB-36-16','Mortgage Bond',15890,'Money Case','Regular','stampduty','0000-00-00',36),
 ('DMR-1-16','Money Matters',15000,'Money Case','Regular','stampduty','0000-00-00',1),
 ('DMR-2-16','Money Matters',125000,'Money Case','Regular','stampduty','0000-00-00',2),
 ('DMS-16-16','Money Summary',30000,'Money Summary','Summary','defendantinformed','2012-05-24',16),
 ('DMS-17-16','Money Summary',13000,'Money Summary','Summary','defendantinformed','2012-05-24',17),
 ('DMS-18-16','Money Summary',12345,'Money Case','Regular','stampduty','0000-00-00',18);
/*!40000 ALTER TABLE `casedata` ENABLE KEYS */;


--
-- Definition of table `decision`
--

DROP TABLE IF EXISTS `decision`;
CREATE TABLE `decision` (
  `caseNumber` varchar(45) NOT NULL,
  `judgeNumber` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `result` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`,`judgeNumber`),
  KEY `FK_decision_1` (`judgeNumber`),
  CONSTRAINT `FK_decision_1` FOREIGN KEY (`judgeNumber`) REFERENCES `judge` (`judgeNumber`),
  CONSTRAINT `FK_decision_2` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `decision`
--

/*!40000 ALTER TABLE `decision` DISABLE KEYS */;
/*!40000 ALTER TABLE `decision` ENABLE KEYS */;


--
-- Definition of table `defcase`
--

DROP TABLE IF EXISTS `defcase`;
CREATE TABLE `defcase` (
  `caseNumber` varchar(45) NOT NULL,
  `defID` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`,`defID`),
  KEY `FK_defcase_2` (`defID`),
  CONSTRAINT `FK_defCase_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`),
  CONSTRAINT `FK_defcase_2` FOREIGN KEY (`defID`) REFERENCES `defendant` (`defID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defcase`
--

/*!40000 ALTER TABLE `defcase` DISABLE KEYS */;
INSERT INTO `defcase` (`caseNumber`,`defID`) VALUES 
 ('DMR-2-16','2312'),
 ('DHP-3-16','2324'),
 ('DHP-3-16','234678678'),
 ('DDR-8-16','423q'),
 ('DMS-17-16','456546'),
 ('DDR-8-16','4567q'),
 ('DMB-35-16','78123423v'),
 ('DMB-35-16','78123456v'),
 ('DMB-36-16','a123'),
 ('DHP-4-16','temp1');
/*!40000 ALTER TABLE `defcase` ENABLE KEYS */;


--
-- Definition of table `defendant`
--

DROP TABLE IF EXISTS `defendant`;
CREATE TABLE `defendant` (
  `defID` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `profession` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`defID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `defendant`
--

/*!40000 ALTER TABLE `defendant` DISABLE KEYS */;
INSERT INTO `defendant` (`defID`,`name`,`address`,`profession`) VALUES 
 ('2312','test','test','null'),
 ('2324','tania','jaffna','null'),
 ('234678678','tissa','col8','null'),
 ('423q','sarath','kelaniya','null'),
 ('456546','sdfsd','sdfsdf','null'),
 ('4567q','reeta','kelaniya','null'),
 ('78123423v','Shyamali','Colombo3','null'),
 ('78123456v','Shyama','Colombo','null'),
 ('a123','Ranee','Kelaniya','null'),
 ('temp1','tempplai','tempadd','null');
/*!40000 ALTER TABLE `defendant` ENABLE KEYS */;


--
-- Definition of table `fiscalreport`
--

DROP TABLE IF EXISTS `fiscalreport`;
CREATE TABLE `fiscalreport` (
  `caseNumber` varchar(45) NOT NULL,
  `reason` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`),
  CONSTRAINT `FK_fiscalreport_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fiscalreport`
--

/*!40000 ALTER TABLE `fiscalreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `fiscalreport` ENABLE KEYS */;


--
-- Definition of table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE `inquiry` (
  `caseNumber` varchar(45) NOT NULL,
  `decreeIssueDate` date NOT NULL,
  `inquiryReceiDate` date NOT NULL,
  `reason` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`),
  CONSTRAINT `FK_inquiry_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inquiry`
--

/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;


--
-- Definition of table `judge`
--

DROP TABLE IF EXISTS `judge`;
CREATE TABLE `judge` (
  `judgeNumber` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`judgeNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `judge`
--

/*!40000 ALTER TABLE `judge` DISABLE KEYS */;
/*!40000 ALTER TABLE `judge` ENABLE KEYS */;


--
-- Definition of table `lawyer`
--

DROP TABLE IF EXISTS `lawyer`;
CREATE TABLE `lawyer` (
  `lawyerNumber` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`lawyerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawyer`
--

/*!40000 ALTER TABLE `lawyer` DISABLE KEYS */;
INSERT INTO `lawyer` (`lawyerNumber`,`name`,`address`) VALUES 
 ('law123','Peter','Colombo3'),
 ('lawyer1','Gamini','Col3'),
 ('lawyer2','Sarath','Col3'),
 ('LLB01','A.B.Perera','Bartleet law firm'),
 ('LLB09','Grace','Horana'),
 ('LLB092','Frank','Hokandara'),
 ('llb1','test','test'),
 ('LLB12','Cooray','Bartleet law firm'),
 ('LLB2','Udaya','HNB'),
 ('llb34','srr','werwe'),
 ('LLK34','erl','ratnapura'),
 ('templaw1','lawname','lawadd');
/*!40000 ALTER TABLE `lawyer` ENABLE KEYS */;


--
-- Definition of table `lawyercase`
--

DROP TABLE IF EXISTS `lawyercase`;
CREATE TABLE `lawyercase` (
  `caseNumber` varchar(45) NOT NULL,
  `lawyerNumber` varchar(45) NOT NULL,
  `party` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`,`lawyerNumber`),
  KEY `FK_lawyerCase_2` (`lawyerNumber`),
  CONSTRAINT `FK_lawyerCase_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`),
  CONSTRAINT `FK_lawyerCase_2` FOREIGN KEY (`lawyerNumber`) REFERENCES `lawyer` (`lawyerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lawyercase`
--

/*!40000 ALTER TABLE `lawyercase` DISABLE KEYS */;
INSERT INTO `lawyercase` (`caseNumber`,`lawyerNumber`,`party`) VALUES 
 ('DDR-8-16','LLK34','Plaintiff'),
 ('DHP-3-16','LLB2','Plaintiff'),
 ('DHP-4-16','templaw1','Plaintiff'),
 ('DMB-35-16','lawyer1','Defendant'),
 ('DMB-35-16','lawyer2','Defendant'),
 ('DMB-35-16','LLB01','Plaintiff'),
 ('DMB-35-16','LLB12','Plaintiff'),
 ('DMB-36-16','law123','Plaintiff'),
 ('DMR-2-16','llb1','Plaintiff'),
 ('DMS-17-16','llb34','Plaintiff');
/*!40000 ALTER TABLE `lawyercase` ENABLE KEYS */;


--
-- Definition of table `plaintiff`
--

DROP TABLE IF EXISTS `plaintiff`;
CREATE TABLE `plaintiff` (
  `plaintiffID` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`plaintiffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plaintiff`
--

/*!40000 ALTER TABLE `plaintiff` DISABLE KEYS */;
INSERT INTO `plaintiff` (`plaintiffID`,`name`,`address`) VALUES 
 ('12345v','reetaert','panaduraert'),
 ('1234v','reeta','panadura'),
 ('12367v','janith','kadawatha'),
 ('3456v','lal','panadura'),
 ('423q','sarath','kelaniya'),
 ('45673va','test','test'),
 ('4567q','reeta','kelaniya'),
 ('94561234v','Deric','Kotte'),
 ('948190702V','Eric','Kottawa'),
 ('a123','Ranee','Kelaniya'),
 ('temp1','tempplai','tempadd');
/*!40000 ALTER TABLE `plaintiff` ENABLE KEYS */;


--
-- Definition of table `plaintiffcase`
--

DROP TABLE IF EXISTS `plaintiffcase`;
CREATE TABLE `plaintiffcase` (
  `caseNumber` varchar(45) NOT NULL,
  `plaintiffID` varchar(45) NOT NULL,
  PRIMARY KEY (`caseNumber`,`plaintiffID`),
  KEY `FK_plaintiffcase_2` (`plaintiffID`),
  CONSTRAINT `FK_plaintiffCase_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`),
  CONSTRAINT `FK_plaintiffcase_2` FOREIGN KEY (`plaintiffID`) REFERENCES `plaintiff` (`plaintiffID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plaintiffcase`
--

/*!40000 ALTER TABLE `plaintiffcase` DISABLE KEYS */;
INSERT INTO `plaintiffcase` (`caseNumber`,`plaintiffID`) VALUES 
 ('DMS-17-16','12345v'),
 ('DMS-17-16','1234v'),
 ('DHP-3-16','12367v'),
 ('DHP-3-16','3456v'),
 ('DDR-8-16','423q'),
 ('DMR-2-16','45673va'),
 ('DDR-8-16','4567q'),
 ('DMB-35-16','94561234v'),
 ('DMB-35-16','948190702V'),
 ('DMB-36-16','a123'),
 ('DHP-4-16','temp1');
/*!40000 ALTER TABLE `plaintiffcase` ENABLE KEYS */;


--
-- Definition of table `receipt`
--

DROP TABLE IF EXISTS `receipt`;
CREATE TABLE `receipt` (
  `receiptNumber` varchar(45) NOT NULL,
  `amount` double NOT NULL,
  `date` date NOT NULL,
  `description` varchar(45) NOT NULL,
  `caseNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`receiptNumber`),
  KEY `FK_receipt_1` (`caseNumber`),
  CONSTRAINT `FK_receipt_1` FOREIGN KEY (`caseNumber`) REFERENCES `casedata` (`casenum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receipt`
--

/*!40000 ALTER TABLE `receipt` DISABLE KEYS */;
/*!40000 ALTER TABLE `receipt` ENABLE KEYS */;


--
-- Definition of table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE `report` (
  `repID` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `timePeriod` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `judgeNumber` varchar(45) NOT NULL,
  `userID` varchar(45) NOT NULL,
  PRIMARY KEY (`repID`),
  KEY `FK_report_1` (`judgeNumber`),
  KEY `FK_report_2` (`userID`),
  CONSTRAINT `FK_report_1` FOREIGN KEY (`judgeNumber`) REFERENCES `judge` (`judgeNumber`),
  CONSTRAINT `FK_report_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `report`
--

/*!40000 ALTER TABLE `report` DISABLE KEYS */;
/*!40000 ALTER TABLE `report` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userID` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `nationality` varchar(45) NOT NULL,
  `civilStatus` varchar(45) NOT NULL,
  `occupation` varchar(45) NOT NULL,
  `contactNum` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
