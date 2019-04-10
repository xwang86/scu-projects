INSERT INTO `Guest` (`Guest_name`,`Guest_address`,`Guest_city`,`Guest_state`,`Guest_zipcode`,`Guest_country`,`Guest_ID`) VALUES ("Castor Gomez","497-8213 Malesuada Road","Vaughan","Ontario","13814","Guinea-Bissau",79),("Latifah Kelley","7688 Quisque Avenue","St. Petersburg","Florida","8023","Chile",51),("Cadman Reeves","Ap #381-7694 Non Av.","Manukau","NI","4833","Turks and Caicos Islands",69),("Xavier Watkins","4756 Rutrum Av.","Liverpool","LA","47550","Antarctica",26),("Azalia Campos","P.O. Box 552, 8034 Mi, Road","Alanya","Ant","60008","Jamaica",10),("Inga Simpson","P.O. Box 173, 7330 Aliquam St.","Słupsk","PM","97306","Turkey",40),("Charissa Wade","P.O. Box 906, 3645 Nulla Rd.","Saint Paul","Minnesota","3322 HM","United Arab Emirates",72),("Abel Lindsay","5949 Enim. Road","LiŽge","LU","20308","Kiribati",52),("Eliana Long","Ap #285-5694 Morbi Avenue","Istanbul","Istanbul","66186","Malaysia",99),("Chaim Walters","Ap #401-242 Adipiscing Rd.","Mantova","LOM","77752","Bahrain",19);
INSERT INTO `Guest` (`Guest_name`,`Guest_address`,`Guest_city`,`Guest_state`,`Guest_zipcode`,`Guest_country`,`Guest_ID`) VALUES ("Colt Rogers","P.O. Box 865, 9317 Orci Ave","Cairns","Queensland","NG6 3RY","Slovakia",62),("Uta Mendez","742-1358 Nulla St.","Grand Island","Nebraska","327065","Taiwan",42),("James Mullen","P.O. Box 823, 7855 Id St.","Fremantle","WA","86871","Antigua and Barbuda",53),("Salvador Barnes","4151 Nam Avenue","Jundiaí","São Paulo","833659","Uzbekistan",58),("Chadwick Huber","Ap #259-7184 Est, Av.","Lo Barnechea","RM","3909","Tonga",74),("Nigel Baldwin","Ap #510-1140 Sed Av.","Galway","C","8900","Dominican Republic",63),("Carter Woods","Ap #347-3019 A, Av.","Rueil-Malmaison","IL","6831","Christmas Island",31),("Joy Gould","P.O. Box 907, 5260 Hendrerit Avenue","San José de Alajuela","Alajuela","23717","Timor-Leste",68),("Sade Bates","Ap #141-8979 Ornare Road","Gboko","Benue","65703","Netherlands",36),("Zane Rollins","P.O. Box 560, 5893 Donec Avenue","Lleida","CA","66435-748","Trinidad and Tobago",77);

INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('1', '10');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('2', '19');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('3', '26');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('4', '31');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('5', '36');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('6', '40');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('7', '42');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('8', '51');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('9', '52');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('10', '53');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('11', '58');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('12', '62');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('13', '63');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('14', '68');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('15', '69');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('16', '72');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('17', '74');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('18', '26');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('19', '51');
INSERT INTO `hotel`.`Booking` (`Booking_ID`, `Guest_ID`) VALUES ('20', '63');

UPDATE `hotel`.`Booking` SET `Special_request` = 'extra bed' WHERE (`Booking_ID` = '5');
UPDATE `hotel`.`Booking` SET `Special_request` = 'fruit ' WHERE (`Booking_ID` = '14');
UPDATE `hotel`.`Booking` SET `Special_request` = 'wheel chair' WHERE (`Booking_ID` = '17');
UPDATE `hotel`.`Booking` SET `Special_request` = 'corner room' WHERE (`Booking_ID` = '20');

INSERT INTO `hotel`.`Room_Type` (`Room_type_ID`, `Room_type_name`, `Room_type_description`) VALUES ('1', 'ocean', 'ocean view');
INSERT INTO `hotel`.`Room_Type` (`Room_type_ID`, `Room_type_name`, `Room_type_description`) VALUES ('2', 'pool', 'pool view');

INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('1', '1');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('2', '2');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('3', '1');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('4', '1');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('5', '2');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('6', '1');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('7', '2');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('8', '1');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('9', '2');
INSERT INTO `hotel`.`Room` (`Room_ID`, `Room_type_ID`) VALUES ('10', '2');

INSERT INTO `hotel`.`Room_Rate` (`Date_from`, `Date_to`, `Room_rate`, `Room_type_ID`) VALUES ('2018-01-01', '2019-04-30', '315.90', '1');
INSERT INTO `hotel`.`Room_Rate` (`Date_from`, `Date_to`, `Room_rate`, `Room_type_ID`) VALUES ('2018-05-01', '2019-12-31', '500.90', '1');
INSERT INTO `hotel`.`Room_Rate` (`Date_from`, `Date_to`, `Room_rate`, `Room_type_ID`) VALUES ('2018-01-01', '2019-04-30', '289.90', '2');
INSERT INTO `hotel`.`Room_Rate` (`Date_from`, `Date_to`, `Room_rate`, `Room_type_ID`) VALUES ('2018-05-01', '2019-12-31', '460.90', '2');

UPDATE `hotel`.`Room_Rate` SET `Rate_type` = 'standard' WHERE (`Date_from` = '2019-01-01') and (`Date_to` = '2019-04-30') and (`Room_type_ID` = '1');
UPDATE `hotel`.`Room_Rate` SET `Rate_type` = 'standard' WHERE (`Date_from` = '2019-01-01') and (`Date_to` = '2019-04-30') and (`Room_type_ID` = '2');
UPDATE `hotel`.`Room_Rate` SET `Rate_type` = 'holiday' WHERE (`Date_from` = '2019-05-01') and (`Date_to` = '2019-12-31') and (`Room_type_ID` = '1');
UPDATE `hotel`.`Room_Rate` SET `Rate_type` = 'holiday' WHERE (`Date_from` = '2019-05-01') and (`Date_to` = '2019-12-31') and (`Room_type_ID` = '2');

#need price
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('948','2018-04-15', '2018-04-18', '1', '1');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('290','2018-04-15', '2018-04-16', '2', '2');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('2004','2018-05-10', '2018-05-14', '3', '3');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('2004','2018-05-11', '2018-05-15', '4', '4');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('922','2018-05-12', '2018-05-14', '5', '5');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1002','2018-05-09', '2018-05-11', '6', '6');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('461','2018-05-14', '2018-05-15', '7', '7');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('632','2018-04-28', '2018-04-30', '8', '8');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1844','2018-05-04', '2018-05-08', '9', '9');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1383','2018-05-06', '2018-05-09', '10', '10');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('2505','2018-05-03', '2018-05-08', '1', '11');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1844','2018-05-10', '2018-05-14', '2', '12');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1264','2018-04-20', '2018-04-24', '3', '13');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('632','2018-04-28', '2018-04-30', '4', '14');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('922','2018-05-05', '2018-05-07', '5', '15');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1002','2018-05-11', '2018-05-13', '6', '16');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('870','2018-04-17', '2018-04-20', '7', '17');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('2004','2018-05-01', '2018-05-05', '8', '18');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('461','2018-05-01', '2018-05-02', '9', '19');
INSERT INTO `hotel`.`Room_Booking` (`price`,`Date_from`, `Date_to`, `Room_ID`, `Booking_ID`) VALUES ('1844','2018-05-01', '2018-05-05', '10', '20');
