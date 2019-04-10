#Use case Queries: 

# 1. Hotel Manager would like to check the number of bookings made on a night 
SET @total_rooms = (SELECT COUNT(DISTINCT Room_ID) FROM Room);
SET @room_count = (SELECT COUNT(DISTINCT Room_ID) FROM Room_Booking 
WHERE '2018-05-01' >= Date_from AND '2018-05-01' < Date_to);
SELECT @room_count/@total_rooms;

# 2. Hotel Manager would like to know the revenue of a month
SELECT SUM(Price) FROM Room_Booking AS Revenue
WHERE Date_from >= '2018-04-01' AND Date_from< '2018-04-30';

# 3. Hotel Manager would like to know the demographics of guests to run prmotions
SELECT guest_country, COUNT(guest_ID)
FROM guest
GROUP BY guest_country; 

# 4. Receptionist would like to check-in guests by looking up their reservation information. 
SELECT * FROM Room_Booking rb, Guest g, booking b
WHERE g.guest_ID = b.guest_ID and b.booking_ID = rb.booking_ID 
and guest_name = 'Carter Woods' and b.booking_id = 4; 

# 5. Receptionist would like to look up the availability of rooms for guests to book. 
DELIMITER //
create procedure room_availability_count (date_in date, date_out date)
begin
select count(room_id) from room
where room_id not in 
(select rb.room_id from room_booking rb, room r
where r.room_id = rb.room_id 
and date_in >= rb.date_from
and date_out <= rb.date_to);
end //
Delimiter ;

call room_availability_count ('2018-04-18','2018-04-18');

call room_availability_count ('2018-04-18','2018-04-27');

# 6. Receptionist would like to provide rates of a room type for a specific night to guests
SELECT room_rate FROM ROOM_RATE
WHERE room_type_id = 2 and '2018-05-01' >= Date_from AND '2018-05-01' < Date_to;

# 7. Receptionist would like to assist guest with check-out based on guest name.
SELECT * FROM Room_Booking rb, Guest g, booking b
WHERE g.guest_ID = b.guest_ID and b.booking_ID = rb.booking_ID 
and guest_name = 'Carter Woods'; 

# 8. Housekeepers would like to know check-in and check-out date information of rooms for checking and cleaning.
SELECT Room_ID, Date_from as Checkin_Date, Date_to as Checkout_Date 
FROM Room_Booking 
WHERE Room_ID = '3';

# 9. Housekeepers would like to prepare a room based on guests’ special requests at booking.
SELECT rb.date_from, rb.date_to, rb.room_id, b.special_request 
FROM room_booking rb, booking b
WHERE rb.booking_id = b.booking_id
and special_request is not null;