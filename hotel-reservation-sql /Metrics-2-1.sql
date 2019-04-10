#Occupancy rate
SET @total_rooms = (SELECT COUNT(DISTINCT Room_ID) FROM Room);
SET @room_count = (SELECT COUNT(DISTINCT Room_ID) FROM Room_Booking 
WHERE '2018-05-01' >= Date_from AND '2018-05-01' < Date_to);
SELECT @room_count/@total_rooms;

#Monthly Revenue
SELECT SUM(Price) FROM Room_Booking AS Revenue
WHERE Date_from >= '2018-04-01' AND Date_from< '2018-04-30';

#RevPar measures the average room revenue per available room. 
SELECT SUM(Price)/10 FROM Room_Booking AS RevPar
WHERE '2018-05-01' >= Date_from AND '2018-05-01' < Date_to;



