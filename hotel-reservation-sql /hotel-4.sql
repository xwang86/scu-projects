
CREATE TABLE `Room` (
`Room_ID` int(11) NOT NULL,
`Room_type_ID` int(11) NOT NULL,
PRIMARY KEY (`Room_ID`) 
);

CREATE TABLE `Room_Type` (
`Room_type_ID` int(11) NOT NULL,
`Room_type_name` varchar(11) NOT NULL,
`Room_type_description` varchar(11) NULL,
PRIMARY KEY (`Room_type_ID`) 
);

CREATE TABLE `Room_Rate` (
`Date_from` date NOT NULL,
`Date_to` date NOT NULL,
`Room_rate` decimal(5,0) NOT NULL,
`Room_type_ID` int(11) NOT NULL,
PRIMARY KEY (`Date_from`, `Date_to`, `Room_type_ID`) 
);

CREATE TABLE `Room_Booking` (
`Date_from` date NOT NULL,
`Date_to` date NOT NULL,
`Price` decimal(5,0) NOT NULL,
`Room_ID` int(11) NOT NULL,
`Booking_ID` int(11) NOT NULL,
`Create_date` datetime not null default current_timestamp(),
`Modified_date`datetime null,
PRIMARY KEY (`Room_ID`, `Date_from`, `Date_to`) 
);

CREATE TABLE `Booking` (
`Booking_ID` int(11) NOT NULL,
`Special_request` varchar(11) NULL,
`Guest_ID` int(11) NOT NULL,
PRIMARY KEY (`Booking_ID`) 
);

CREATE TABLE `Guest` (
`Guest_ID` int(11) NOT NULL,
`Guest_name` char(30) NOT NULL,
`Guest_address` varchar(40) NULL,
`Guest_city` char(25) NULL,
`Guest_state` char(25) NULL,
`Guest_zipcode` varchar(11) NULL,
`Guest_country` char(25) NULL,
PRIMARY KEY (`Guest_ID`) 
);

CREATE TABLE `Room_Booking_history` (
`Date_from` date not NULL,
`Date_to` date not NULL,
`Price` decimal(10,2) NULL,
`Room_ID` int(11) NOT NULL,
`Booking_ID` int(11) NOT NULL,
`Create_date` datetime not null,
`Modified_date`datetime null,
`action_type` char(6) not null
);


ALTER TABLE `Room Rate` ADD CONSTRAINT `fk_Room Rate` FOREIGN KEY (`Room_type_ID`) REFERENCES `Room Type` (`Room_type_ID`);
ALTER TABLE `Booking` ADD CONSTRAINT `fk_Booking` FOREIGN KEY (`Guest_ID`) REFERENCES `Guest` (`Guest_ID`);
ALTER TABLE `Room_Booking` ADD CONSTRAINT `fk_Room_Booking` FOREIGN KEY (`Booking_ID`) REFERENCES `Booking` (`Booking_ID`);
ALTER TABLE `Room` ADD CONSTRAINT `fk_Room` FOREIGN KEY (`Room_type_ID`) REFERENCES `Room Type` (`Room_type_ID`);
ALTER TABLE `Room_Booking` ADD CONSTRAINT `fk_Room_Booking_1` FOREIGN KEY (`Room_ID`) REFERENCES `Room` (`Room_ID`);


create trigger update_modified_date before update on room_booking
for each row
set new.modified_date = current_timestamp();

#Procedure for room availability
DELIMITER //
create procedure room_availability (date_in date, date_out date)
begin
select room_id from room
where room_id not in 
(select rb.room_id from room_booking rb, room r
where r.room_id = rb.room_id 
and date_in >= rb.date_from
and date_out <= rb.date_to);
end //
Delimiter ;

call room_availability ('2018-04-30', '2018-04-30');

#trigger for price update
Delimiter //
create trigger update_price before insert on room_booking
for each row
begin
set new.price = 
(select (rr.room_rate * datediff(new.Date_to, new.Date_from)) from Room_rate rr, room r
where r.room_type_id = rr.room_type_id
and new.date_from  >= rr.date_from and new.date_from <= rr.date_to 
and r.room_id = new.room_id);
end; //
Delimiter ;

