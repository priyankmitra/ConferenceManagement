create table Organizer(
				UserName VARCHAR(25), 
				Name VARCHAR(50) NOT NULL, 
				EmailID VARCHAR(50) UNIQUE NOT NULL, 
				PhoneNo VARCHAR(13) NOT NULL, 
				Password VARCHAR(50) NOT NULL, 
				PRIMARY KEY(UserName)
);


create table Conference(
				ConfID int AUTO_INCREMENT, 
				Name VARCHAR (100) NOT NULL UNIQUE, 
				FromDate DATE NOT NULL, 
				ToDate DATE NOT NULL, 
				Time VARCHAR (25) NOT NULL, 
				Keywords VARCHAR (100) NOT NULL, 
				Venue VARCHAR (150) NOT NULL, 
				Description TEXT NOT NULL, 
				RegFees INT NOT NULL,  
				RegCount INT DEFAULT 0, 
				PhoneNo VARCHAR(13) NOT NULL,
				Email VARCHAR(40) NOT NULL,
				CreaterName VARCHAR(40) NOT NULL,
				PRIMARY KEY(ConfID)
);

CREATE TABLE Atendee(
				UserID VARCHAR(20) NOT NULL, 
				NAME VARCHAR(30) NOT NULL,
				EmailID VARCHAR(30) NOT NULL,
				PhoneNo VARCHAR(13) NOT NULL,
				ConfID INT, 
				TransactionID VARCHAR(15) UNIQUE, 
				PRIMARY KEY(UserID,ConfID), 
				FOREIGN KEY(ConfID) REFERENCES Conference (ConfID) ON DELETE CASCADE
);