create database shop;
use shop;


create table user(
id int auto_increment primary key,
username varchar(30) not null,
password char(68) not null,
name varchar(20),
lname varchar(20),
email varchar(50),
telephone varchar(20),
country varchar(50),
city varchar(50),
address varchar(50),
postal_code varchar(10),
unique(username)
);

insert into user
values(1, 'afroditi', '$2a$10$zb2yH7iMiINVRuqVCnoOIO/0IaxTtHY.Elp62pYkJEHOyWabEXv.S', 'Afroditi', 'Vlachou', 'vlachou.af@gmail.com', '6989583728', 'Greece', 'Athens', 'Grevenon 1', '11855');

insert into user
values(2, 'michalis', '$2a$10$zb2yH7iMiINVRuqVCnoOIO/0IaxTtHY.Elp62pYkJEHOyWabEXv.S', 'Michalis', 'Mantouvalos', 'mike.mantouvalos@gmail.com', '6978417355', 'Greece', 'Athens', 'Aristomenous 121', 12445);

insert into user(username, password)
values('anonymous', 'anonymous');
insert into user values
(4,'nikos', '$2a$10$zb2yH7iMiINVRuqVCnoOIO/0IaxTtHY.Elp62pYkJEHOyWabEXv.S', 'Nikolaos','Giannopoulos','giannop.nik@gmail.com', '6983458416', 'Greece', 'Patra', 'Ileias 95','26500');

create table role(
id int auto_increment primary key,
name varchar(30),
unique(name)
);

insert into role(name) values('ROLE_ADMIN');
insert into role(name) values('ROLE_USER');

create table user_role(
uid int,
rid int,
primary key(uid,rid),
constraint userrolefk1 foreign key (uid) references user(id),
constraint userrolefk2 foreign key (rid) references role(id)
);

insert into user_role
values(1,1);
insert into user_role
values(2,1), (4,1);


create table orders(
	id int auto_increment primary key,
    user_id int not null,
    country varchar(50),
    city varchar(50),
    address varchar(50),
    postal_code varchar(10),
    telephone varchar(10),
    email varchar(50),
    price decimal(8,2),
    submitDate date,
    constraint user_fk foreign key (user_id) references user(id)
);

insert into orders values
(1, 2, "Greece", "Athens", "Grevenon 1", "10052", "6987593228", "afro@gmail.com", 256.27, '2020-01-21');

create table category(
	id int auto_increment primary key,
    pcategory varchar(30)
);

insert into category values
(1, 'Tower'),
(2, 'Motherboard'),
(3, 'CPU'),
(4, 'GPU'),
(5, 'RAM'),
(6, 'Storage'),
(7, 'PSU'),
(8, 'Monitor'),
(9, 'Mouse'),
(10, 'Keyboard')
;

create table product(
	id int auto_increment primary key,
    name varchar(80) unique not null,
    pcode varchar(30) unique not null,
    price decimal(6,2) not null,
    sales decimal(6,2) default 0,
    quantity int,
    description text,
    category int not null, 
    constraint category_fk foreign key (category) references category(id) 
);

insert into product values
(1, 'CASE INNOVATOR DAYBREAK', '001-ACID-3306', 45.00, 5, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(2, 'LG FLATRON 17', '001-BCDA-7896', 150.00, 40, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(3, 'MOTHERBOARD ASROCK H110M-DVS R3.0 RETAIL', '001-ABFU-9623', 50.90, 10, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(4, 'CPU AMD Ryzen 5 3400G 3,70 GHz', 'BDU-980003', 168.58, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(5, 'GPU VGA GIGABYTE GEFORCE GTX1050 OC 2G GV-N1050OC-2GD 2GB GDDR5 PCI-E RETAIL', '001-STUD-2224', 300, 12, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4)
;

insert into product values (6, 'SSD INTENSO 3813430 HIGH PERFORMANCE 120GB 2.5 7MM SATA3', '030-PSAB-8523', 27.90, 7, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6);
insert into product values (7, 'GEMBIRD MUSW-4B-02-BS WIRELESS OPTICAL MOUSE BLACK/SILVER', '035-ACID-3455', 8.90, 2, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9);
insert into product values (8, 'KEYBOARD LOGITECH K120', '105-ACID-3899', 22.00, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10);
insert into product values (9, 'RAM KINGSTON KVR13N9S6/2 2GB DDR3 PC3-10600 1333MHZ VALUE RAM', '155-ACID-3789', 23.48, 0, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5);
insert into product values (10, 'PSU THERMALTAKE W0391RE MUNICH 430W', '130-PSUI', 54.90, 0, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7);

insert into product values 
(11, 'CC-COUGAR Case MX330-X Middle ATX BLACK USB 3.0', '140-08-CCMX330X', 39.00, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(12, 'Thermaltake Level 20 MT ARGB TG CA-1M7-00M1WN-00 Midi Tower no PSU Black', '001-3178', 83.41, 0, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(13, 'Cooler Master MasterCase H500 Midi-Tower Grey', 'FS027340', 111.50, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(14, 'COUGAR PANZER MAX', '200036656', 129.00, 0, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(15, 'THERMALTAKE V200 TG RGB TOWER CHASSIS TEMPERED GLASS', 'CA-1K8-00M1WN-01', 64.69, 0, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(16, 'AEROCOOL CYLON MIDI-TOWER BLACK ACCM-PV10012.11', 'ACCM-PV10012.11', 36.94, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(17, 'NZXT H510 WHITE TEMPERED GLASS', 'S105375', 86.99, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(18, 'LC POWER LC-988B-ON', '0067-DARU-9687', 55.25, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1),
(19, 'Inter-Tech CXC2', 'MUB029186', 50.45, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 1)
;

insert into product values
(20, 'MONITOR ACER K242HYLBBIDX 24 LED FULL HD', 'PER.156177', 129.00, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(21, 'MONITOR ASUS VP228DE 22 LED FULL HD', 'PER.156169', 84.90, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(22, 'MONITOR DELL E2216HV 21.5 LED FULL HD', 'PER.156026', 104.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(23, 'MONITOR HP 24O X0J60AA 24 LED FULL HD BLACK', 'PER.152258', 144.90, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(24, 'MONITOR PHILIPS 243V7QSB 23.8 LED FULL HD', 'PER.156080', 99.90, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(25, 'MONITOR SAMSUNG S24E450B 24 LED FULL HD BLACK', 'PER.170667', 139.90, 0, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(26, 'MONITOR 22W 1CA83AA 21.5 LED FULL HD', 'PER.168396', 99.90, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(27, 'MONITOR LG 24MK430H-B 24 IPS LED FULL HD', 'PER.156153', 115.00, 15, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(28, 'MONITOR SAMSUNG LS27E330HZX/EN 27 LED FULL HD', 'PER.170898', 151.90, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8),
(29, 'MONITOR DELL ULTRASHARP U2412M 24 FULL HD BLACK', 'PER.161880', 193.59, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 8)
;

insert into product values
(30, 'MOTHERBOARD ASROCK H370M-ITX/AC RETAIL', '845-MOTH-26UO', 109.90, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(31, 'MOTHERBOARD ASROCK H270M PRO4 RETAIL', '687-TJHF-84A', 77.90, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(32, 'MOTHERBOARD ASUS H110M-C RETAIL', 'PER.524428', 62.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(33, 'MOTHERBOARD ASUS ROG STRIX B250H GAMING RETAIL', 'ABDU3279', 129.00, 0, 8, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(34, 'MOTHERBOARD GIGABYTE GA-H110M-S2H RETAIL', '845HUKL', 54.90, 0, 21, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(35, 'MOTHERBOARD GIGABYTE X399 AORUS PRO RETAIL', 'HUP-0321', 328.90, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(36, 'MOTHERBOARD MSI MPG X570 GAMING EDGE WIFI RETAIL', '54640AU', 229.00, 0, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(37, 'MOTHERBOARD MSI B450 TOMAHAWK MAX RETAIL', 'PER.524041', 121.90, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(38, 'MOTHERBOARD ASUS TUF Z390-PLUS GAMING RETAIL', 'BHUO89486', 158.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2),
(39, 'MOTHERBOARD ASROCK Z390 PHANTOM GAMING 4 RETAIL', 'TEW8955-3', 177.00, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 2)
;

insert into product values 
(40, 'CPU INTEL CORE I3-7320 4.10GHZ LGA1151 - BOX', 'RHY852RFT', 219.00, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(41, 'CPU AMD ATHLON 200GE 3.20GHZ BOX', 'PER.559723', 48.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(42, 'CPU AMD RYZEN 3 2200G 3.70GHZ 4-CORE WITH WRAITH STEALTH BOX', '825TY-JHT0', 88.40, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(43, 'CPU INTEL CORE I7-6800K 3.4GHZ LGA2011-3 - BOX', 'YH85-003', 348.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(44, 'CPU INTEL CORE I5-8600K 3.60GHZ LGA1151 - BOX', 'YTJ.8596', 284.90, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(45, 'CPU AMD RYZEN 5 1600 3.60GHZ 6-CORE WITH WRAITH SPIRE BOX', 'PER.559703', 116.90, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(46, 'CPU INTEL CORE I3-8100 3.60GHZ LGA1151 - BOX', '001-TJHE-8569', 138.30, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(47, 'CPU AMD RYZEN THREADRIPPER 1920X 12-CORE 4.0GHZ BOX', 'ABU-0126-C3O', 276.90, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(48, 'CPU AMD RYZEN 3 1200 3.40GHZ 4-CORE WITH WRAITH STEALTH BOX', '004-967-AORS', 48.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3),
(49, 'CPU AMD RYZEN 5 1500X 3.70GHZ 4-CORE WITH WRAITH SPIRE BOX', 'PER.559704', 124.90, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 3)
;

insert into product values
(50, 'GPU VGA MSI NVIDIA GEFORCE GT710 2GB GT710 2GD3H LP 2GB DDR3 PCI-E RETAIL', 'DFB-9620', 44.90, 0, 21, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(51, 'GPU VGA GIGABYTE GT1030 GV-N1030OC-2GI 2GB GDDR5 64BIT PCI-E', '4226AUO', 91.90, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(52, 'GPU VGA ASUS CERBERUS GEFORCE GTX1050 GTX1050TI-O4G 4GB GDDR5 PCI-E RETAIL', '78561203', 178.90, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(53, 'GPU VGA GIGABYTE GEFORCE GTX1650 4G GV-N1650WF2OC-4GD 4GB GDDR5 PCI-E RETAIL', '3648659AST', 199.90, 0, 8, '', 4),
(54, 'GPU VGA EVGA GEFORCE RTX2060 XC GAMING 6GB GDDR6 PCI-E RETAIL', 'GFEJT85247F', 454.90, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(55, 'GPU VGA XFX AMD RADEON RX580 GTS XXX EDITION 4GB GDDR5 PCI-E RETAIL', 'VSRH2574FD', 239.90, 0, 5, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(56, 'GPU VGA ASROCK RADEON RX5700 8G 8GB GDDR6 PCI-E RETAIL', '045-YGKU-58', 404.90, 0, 3, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(57, 'GPU VGA XFX AMD RADEON RX5700 8GB GDDR6 RX-57XL8LBD6 8GB GDDR6 PCI-E RETAIL', '7528SRGB0', 399.90, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(58, 'GPU VGA MSI NVIDIA GEFORCE GT710 1GB GT710 1GD3H LP 1GB DDR3 PCI-E RETAIL', 'OIBGU89-3', 39.90, 0, 23, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4),
(59, 'GPU VGA GAINWARD 4313 GEFORCE RTX2060 PHOENIX GS 6GB GDDR6 PCI-E RETAIL', '461PKIJO9', 409.90, 0, 4, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 4)
;

insert into product values
(60, 'PSU AKASA 80W DC TO DC ATX POWER SUPPLY FOR SMALL FORM FACTOR CHASSIS', '745R7DB', 29.90, 0, 26, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(61, 'PSU BE QUIET! SFX-L POWER 500W', '7542O-TY8', 99.00, 0, 15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(62, 'PSU COOLERMASTER MASTERWATT MAKER 1200 (NO BLUETOOTH)', '2452UO-87', 439.90, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(63, 'PSU CORSAIR CX SERIES CX750M ATX - 750W 80 PLUS BRONZE CERTIFIED MODULAR', '725THD65', 106.60, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(64, 'PSU COUGAR GX-F AURUM 650 80PLUS GOLD 650W', '54HGUKI-26A', 92.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(65, 'PSU THERMALTAKE TPD-0850M TOUGHPOWER 850W GOLD', '67YEHGT', 185.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(66, 'PSU ZALMAN ZM650-EBT 650W 80 PLUS GOLD', 'RH6J856', 99.90, 0, 27, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(67, 'PSU CORSAIR CX SERIES MODULAR CX450M-450W', '758.FRY', 68.90, 0, 15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(68, 'PSU THERMALTAKE W0393RE BERLIN 630W ATX23', 'PSU26-39', 77.90, 0, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7),
(69, 'PSU CORSAIR AX760 ATX - 760W 80 PLUS PLATINUM CERTIFIED', '694-PSU-36', 217.88, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 7)
;

insert into product values
(70, 'SSD CRUCIAL CT120BX500SSD1 BX500 120GB 3D NAND SATA 3', '596636AUY', 23.85, 0, 28, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(71, 'SSD CRUCIAL CT2000MX500SSD1 MX500 2TB 2.5 7MM INTERNAL SATA3', 'POR-T6786', 256.90, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(72, 'SSD GOODRAM IRIDIUM PRO 240GB 2.5 7MM SATA3', '9648HFR', 89.90, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(73, 'SSD INTEL OPTANE MEMORY SERIES 16GB M.2 80MM PCIE 3.0', '8965PLOU', 33.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(74, 'SSD INTENSO 3813450 HIGH PERFORMANCE 480GB 2.5 7MM SATA3', 'POT.1526', 59.90, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(75, 'SSD KINGSTON SUV500M8/960G UV500 960GB M.2 2280 SATA 3.0', '5692LOP', 155.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(76, 'SSD SAMSUNG MZ-76E1T0B/EU 860 EVO SERIES 1TB 2.5 SATA3', 'TH72568', 132.45, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(77, 'SSD SAMSUNG MZ-76E500B/EU 860 EVO SERIES 500GB 2.5 SATA3', 'SBH-8516', 77.90, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(78, 'SSD SANDISK SDSSDA-240G-G26 PLUS 240GB 2.5 SATA3', 'RY6J568-1', 37.25, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(79, 'HDD TOSHIBA DT01ACA100 1TB 3.5 SATA3', 'SRBG-27-BU', 40.90, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6),
(80, 'HDD TOSHIBA X300 HIGH PERFORMANCE 6TB', 'SFV8585', 209.00, 0, 7, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 6)
;

insert into product values
(81, 'ASUS ROG GX1000 V2 GAMING MOUSE SILVER', '46JYG-96', 59.38, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(82, 'LOGITECH M170 WIRELESS MOUSE GREY', 'OP7808', 9.50, 0, 27, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(83, 'HP OMEN 600 WIRED MOUSE 1KF75AA', 'HP89-0326', 38.50, 0, 21, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(84, 'XIAOMI MI PORTABLE BLUETOOTH MOUSE GOLD', 'XIA-5697', 24.99, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(85, 'MICROSOFT SCULPT COMFORT MOUSE', 'MOUS-9637-ADU', 33.25, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(86, 'COOLERMASTER GAMING MOUSE WITH INTELLIGENT RGB ILLUMINATION', 'OPOY455', 41.90, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(87, 'LOGITECH G903 LIGHTSPEED WIRELESS GAMING MOUSE', '762776-AWE', 122.90, 0, 15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(88, 'HP COMFORT GRIP WIRELESS MOUSE H2L63AA', '43250TY', 19.90, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(89, 'MICROSOFT COMFORT MOUSE 4500 RETAIL', 'OUYI894', 18.25, 0, 29, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9),
(90, 'COOLERMASTER SGM-6020-KLOW1 MOUSE SENTINEL III', '6789AD-2', 57.90, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 9)
;

insert into product values
(91, 'RAM MUSHKIN 990614 DIMM 256MB SDRAM ESSENTIALS SERIES', 'RAM-E456', 15.90, 0, 17, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(92, 'RAM CORSAIR VS512SDS333 512MB SO-DIMM DDR PC-2700 333MHZ', '234WER', 19.90, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(93, 'RAM TRANSCEND TS128MSK64V3U 1GB SO-DIMM DDR3 1333MHZ', 'UJR83WR', 18.90, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(94, 'RAM CRUCIAL CT25664AA667 2GB PC5300 DDR2 667MHZ', 'JUD583414', 35.94, 0, 13, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(95, 'RAM ADATA AD4U2400W4G17-S PREMIER 4GB DDR4 2400MHZ RETAIL', '736-RAM-OU3', 23.90, 0, 15, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(96, 'RAM KINGSTON 32GB DDR3 PC3-10600 1333MHZ CL9 VALUE RAM QUAD KIT', '24734-DTNB', 163.90, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(97, 'RAM ADATA AD4U240038G17-S PREMIER 8GB DDR4 2400MHZ RETAIL', '2347677IOP', 56.90, 0, 14, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(98, 'RAM CORSAIR VALUE SELECT 64GB DDR4 2400MHZ QUAD KIT', 'CMXHD346', 296.00, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(99, 'RAM KINGSTON KVR24N17S8K2/16 VALUE RAM 16GB (2X8GB) DDR4 2400MHZ DUAL KIT', '3542PO-8O9', 76.90, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5),
(100, 'APACER GIANT II 4GB (2X2GB) DDR3 PC12800 P55 DUAL CHANNEL KIT', 'DSGTNJ85', 117.85, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 5)
;

insert into product values
(101, 'APPLE MAGIC KEYBOARD ENGLISH', '364RNTE', 115.80, 0, 16, '', 10),
(102, 'GENESIS THOR 200 MECHANICAL RGB + GENESIS NMG-1162 XENON 750 MOUSE', 'VUL.633', 53.80, 0, 11, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(103, 'GENESIS NKG-1237 THOR 200 HYBRID MECHANICAL RGB GAMING', 'GIL-2554', 29.90, 0, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(104, 'HYPERX ALLOY FPS PRO MECHANICAL GAMING KEYBOARD - CHERRY MX RED, RED LED', 'RYNE588', 78.90, 0, 16, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(105, 'HYPERX ALLOY FPS RGB MECHANICAL GAMING SILVER SPEED US', 'DGTNJ86', 108.50, 0, 6, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(106, 'LOGITECH WIRELESS ILLUMINATED KEYBOARD K800', '7354-7U8', 124.10, 0, 9, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(107, 'MICROSOFT DESIGNER BLUETOOTH DESKTOP EN', 'DGN658-3', 89.90, 0, 18, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(108, 'RAZER HUNTSMAN OPTO-MECHANICAL GAMING GR', 'RAZ-3254', 138.21, 0, 19, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(109, 'LOGITECH MK235 WIRELESS DESKTOP GERMAN (QWERTZ) LAYOUT', '6354-555', 24.90, 0, 21, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10),
(110, 'RAZER BLACKWIDOW CHROMA ELITE MECHANICAL GR', 'SH53657', 151.47, 0, 12, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem aliquam sint ipsam debitis ab sapiente iste cumque enim voluptatum, possimus soluta quis id quam quod nam similique recusandae ut maxime.', 10)
;

create table tower_type(
	id int auto_increment primary key,
    name varchar(20)
);

insert into tower_type values 
(1, 'Mini Tower'), 
(2, 'Middi Tower'), 
(3, 'HTPC'), 
(4, 'Full Tower'), 
(5, 'Desktop');

create table tower_manufacturer(
	id int auto_increment primary key,
    name varchar(30)
);

insert into tower_manufacturer values
(1, 'COUGAR'),
(2, 'AEROCOOL'),
(3, 'COOLER MASTER'),
(4, 'INNOVATOR'),
(5, 'NZXT'),
(6, 'LC-POWER'),
(7, 'THERMALTAKE')
;

create table tower(
	id int auto_increment primary key,
    type int,
    manufacturer int,
    constraint foreign key (id) references product(id),
    constraint foreign key (type) references tower_type(id),
    constraint foreign key (manufacturer) references tower_manufacturer(id)
);

insert into tower values(1, 2, 4);
insert into tower values
(11, 2, 1),
(12, 2, 7),
(13, 2, 3),
(14, 4, 1),
(15, 2, 7),
(16, 2, 2),
(17, 2, 6),
(18, 2, 5),
(19, 2, 4)
;


create table monitor_manufacturer(
	id int auto_increment primary key,
    name varchar(30)
);

insert into monitor_manufacturer values
(1, 'ACER'),
(2, 'ASUS'),
(3, 'DELL'),
(4, 'HP'),
(5, 'LG'),
(6, 'PHILIPS'),
(7, 'SAMSUNG'),
(8, 'PACKARD')
;

create table Monitor(
	id int primary key,
    Hz int,
    inches int,
    manufacturer int,
    constraint foreign key (id) references product(id),
    constraint foreign key (manufacturer) references monitor_manufacturer(id)
);

insert into monitor values (2, 60, 17, 5);
insert into monitor values 
(20, 60, 24, 1),
(21, 60, 22, 2),
(22, 60, 22, 3),
(23, 60, 24, 4),
(24, 60, 24, 6),
(25, 60, 24, 7),
(26, 60, 22, 8),
(27, 60, 24, 5),
(28, 60, 27, 7),
(29, 60, 24, 3)
;

create table motherboard_manufacturer(
	id int auto_increment primary key,
    name varchar(30) 
);

insert into motherboard_manufacturer values
	(1, 'ASROCK'),
    (2, 'ASUS'),
    (3, 'GIGABYTE'),
    (4, 'MSI')
;

create table motherboard_socket(
	id int auto_increment primary key,
    name varchar(50)
);

insert into motherboard_socket values
	(1, '1151 (Core i5, Core i7)'),
    (2, '2066 (Core i7)'),
    (3, 'TR4'),
    (4, 'AM4')
;

create table motherboard_size(
	id int auto_increment primary key,
    name varchar(30)
);

insert into motherboard_size values
(1, 'Mini ITX'),
(2, 'Micro ATX'),
(3, 'Full ATX')
;

create table motherboard_chipset(
	id int auto_increment primary key,
    name varchar(30)
);

insert into motherboard_chipset values
(1, 'B250'),
(2, 'B450'),
(3, 'H110'),
(4, 'H270'),
(5, 'H370'),
(6, 'X399'),
(7, 'X570'),
(8, 'Z390')
;

create table motherboard_port(
	id int auto_increment primary key,
    name varchar(30)
);

insert into motherboard_port values
(1, 'USB2'),
(2, 'USB3'),
(3, 'USB3.1'),
(4, 'USB-C'),
(5, 'Optical'),
(6, 'HDMI'),
(7, 'DisplayPort'),
(8, 'Parallel'),
(9, 'COM port (Serial)')
;

create table motherboard(
	id int primary key,
    manufacturer int not null,
    socket int not null,
    size int not null,
    chipset int not null,
    ports int not null,
    constraint foreign key (id) references product(id),
    constraint foreign key (manufacturer) references motherboard_manufacturer(id),
    constraint foreign key (socket) references motherboard_socket(id),
    constraint foreign key (size) references motherboard_size(id),
    constraint foreign key (chipset) references motherboard_chipset(id),
    constraint foreign key (ports) references motherboard_port(id)
);
select * from motherboard;

insert into motherboard values 
(3, 1, 2, 2, 3, 4)
;

insert into motherboard values
(30, 1, 1, 1, 5, 1),
(31, 1, 1, 2, 4, 3),
(32, 2, 1, 2, 3, 6),
(33, 2, 1, 3, 1, 9),
(34, 3, 1, 2, 3, 8),
(35, 3, 3, 3, 6, 5),
(36, 4, 4, 3, 7, 3),
(37, 4, 4, 3, 2, 7),
(38, 2, 1, 3, 8, 2),
(39, 1, 1, 3, 8, 1)
;

create table cpu_manufacturer(
id int auto_increment primary key,
name varchar(30)
);

insert into cpu_manufacturer values
(1, 'AMD'),
(2, 'INTEL')
;

create table cpu_chip(
id int auto_increment primary key,
name varchar(30)
);

insert into cpu_chip values
(1, 'Core i3'),
(2, 'Core i5'),
(3, 'Core i7'),
(4, 'Athlon'),
(5, 'A10'),
(6,'Ryzen')
;

create table cpu(
id int primary key,
manufacturer int,
chip int,
cores_number int,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references cpu_manufacturer(id),
constraint foreign key (chip) references cpu_chip(id)
);

insert into cpu values
(4, 1, 5, 4)
;

insert into cpu values
(40, 2, 1, 2),
(41, 1, 4, 2),
(42, 1, 6, 4),
(43, 2, 3, 6),
(44, 2, 2, 6),
(45, 1, 6, 6),
(46, 2, 1, 4),
(47, 1, 6, 12),
(48, 1, 6, 4),
(49, 1, 6, 4)
;

create table gpu_manufacturer(
id int auto_increment primary key,
name varchar(50) not null
);

insert into gpu_manufacturer values 
(1,'ASROCK'),
(2,'ASUS'),
(3,'EVGA'),
(4,'GAINWARD'),
(5,'GIGABYTE'),
(6,'MSI'),
(7,'XFX');

create table gpu_chipset(
id int auto_increment primary key,
name varchar(50) not null
);

insert into gpu_chipset values 
(1,'GT 710'),
(2,'GT 1030'),
(3,'GTX 1050'),
(4,'GTX 1650'),
(5,'RTX 2060'),
(6,'RX 580'),
(7,'RX 5700'),
(8, 'AMD chipset'),
(9,'NVIDIA chipset');

create table GPU(
id int primary key,
manufacturer int not null,
chipset int not null,
memory int not null,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references gpu_manufacturer(id),
constraint foreign key (chipset) references gpu_chipset(id)
);
insert into GPU values (5, 5, 3, 2);
insert into GPU values
(50, 6, 1, 2),
(51, 5, 2, 2),
(52, 2, 3, 4),
(53, 5, 4, 4),
(54, 3, 5, 6),
(55, 7, 6, 4),
(56, 1, 7, 8),
(57, 7, 8, 8),
(58, 6, 9, 1),
(59, 4, 5, 6)
;

create table psu_manufacturer(
id int auto_increment primary key,
name varchar(50) not null
);

insert into psu_manufacturer values 
(1, 'AKASA'),
(2, 'BE_QUIET'),
(3, 'COOLERMASTER'),
(4, 'CORSAIR'),
(5, 'COUGAR'),
(6, 'THERMALTAKE'),
(7, 'ZALMAN');

create table psu_efficiency(
id int auto_increment primary key,
name varchar(50) not null
);

insert into psu_efficiency values 
(1, '80 Plus White'),
(2, '80 Plus Bronze'),
(3, '80 Plus Gold'),
(4, '80 Plus Platinum'),
(5, '80 Plus Titanium'),
(6, 'Not Supported');

create table psu_cable_management(
id int auto_increment primary key,
name varchar(50) not null
); 

insert into psu_cable_management values
(1, 'Full Modular'),
(2, 'Semi Modular'),
(3, 'No Modular');

create table PSU(
id int primary key,
manufacturer int not null,
watt int not null,
efficiency int not null,
cable_management int not null,
constraint foreign key (id) references product (id),
constraint foreign key (manufacturer) references psu_manufacturer (id),
constraint foreign key (efficiency) references psu_efficiency (id),
constraint foreign key (cable_management) references psu_cable_management (id)
);


insert into PSU values (10, 6, 430, 6, 3); 

insert into PSU values 
(60, 1, 80, 5, 3),
(61, 2, 500, 3, 1),
(62, 3, 1200, 5, 1),
(63, 4, 750, 2, 1),
(64, 5, 650, 3, 1),
(65, 6, 850, 3, 1),
(66, 7, 650, 3, 1),
(67, 4, 450, 2, 2),
(68, 6, 630, 1, 1),
(69, 4, 760, 4, 1)
;

create table storage_manufacturer(
id int auto_increment primary key,
name varchar(50) not null
);

insert into storage_manufacturer values 
(1, 'CRUCIAL'), 
(2,'GOODRAM'),
(3,'INTEL'), 
(4,'INTENSO'), 
(5,'KINGSTON'), 
(6,'SAMSUNG'), 
(7,'SANDISK'),  
(8,'TOSHIBA');

create table storage_type(
id int auto_increment primary key,
name varchar(50) not null
);

insert into storage_type values
(1, 'HDD'),
(2, 'SSD')
;

create table storage_inches(
id int auto_increment primary key,
name decimal(2,1) not null
);

insert into storage_inches values
(1, 1.8),
(2, 2.5),
(3, 3.5)
;

create table storage(
id int primary key,
manufacturer int,
type int,
inches int,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references storage_manufacturer(id),
constraint foreign key (type) references storage_type(id),
constraint foreign key (inches) references storage_inches(id)
);

insert into storage values
(6, 4, 2, 2)
;

insert into storage values
(70, 1, 2, 2),
(71, 1, 2, 2),
(72, 2, 2, 2),
(73, 3, 2, 1),
(74, 4, 2, 2),
(75, 5, 2, 1),
(76, 6, 2, 2),
(77, 6, 2, 2),
(78, 7, 2, 2),
(79, 8, 1, 3),
(80, 8, 1, 3)
;

create table mouse_manufacturer(
id int primary key,
name varchar(50) not null
);

insert into mouse_manufacturer values 
(1, 'ASUS'), 
(2,'LOGITECH'), 
(3,'HEWLETT PACKARD'), 
(4,'XIAOMI'), 
(5,'MICROSOFT'), 
(6,'COOLERMASTER');

create table mouse_type(
id int auto_increment primary key,
name varchar(50) not null
); 

insert into mouse_type values
(1, 'Wireless'),
(2, 'Wired');

create table mouse(
id int primary key,
manufacturer int,
type int,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references mouse_manufacturer(id),
constraint foreign key (type) references mouse_type(id)
);

insert into mouse values
(7, 1, 1)
;

insert into mouse values
(81, 1 ,2),
(82, 2, 1),
(83, 3, 2),
(84, 4, 1),
(85, 5, 1),
(86, 6, 2),
(87, 2, 1),
(88, 3, 1),
(89, 5, 2),
(90, 6, 2)
;

create table ram_manufacturer(
id int auto_increment primary key,
name varchar(50) not null
);

insert into ram_manufacturer values 
(1, 'ADATA'),
(2, 'APACER'),
(3, 'CORSAIR'),
(4, 'CRUCIAL'),
(5, 'KINGSTON'),
(6, 'TRANSCEND'),
(7, 'MUSHKIN')
;

create table ram_type(
id int auto_increment primary key,
name varchar(50) not null
);

insert into ram_type values
(1,'SDRAM'),
(2,'DDR SDRAM'),
(3,'DDR2 SDRAM'),
(4,'DDR3 SDRAM'),
(5,'DDR4 SDRAM');

create table ram_size(
id int auto_increment primary key,
name varchar(50) not null
);

insert into ram_size values
(1,'256MB'),
(2,'512MB'),
(3,'1GB'),
(4,'2GB'),
(5,'4GB'),
(6,'8GB'),
(7,'16GB'),
(8,'32GB'),
(9,'64GB');

create table ram(
id int key,
manufacturer int not null,
type int not null,
size int not null,
frequency int,
voltage decimal(4,2) not null,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references ram_manufacturer (id),
constraint foreign key (type) references ram_type (id),
constraint foreign key (size) references ram_size(id)
);

insert into ram values
(9, 5, 4, 4, 1600, 1.5)
;

insert into ram values
(91, 7, 1, 1, 133, 3.3),
(92, 3, 2, 2, 333, 2.5),
(93, 6, 4, 3, 1333, 1.5),
(94, 4, 3, 4, 667, 1.8),
(95, 1, 5, 5, 2400, 1.2),
(96, 5, 4, 8, 1333, 1.2),
(97, 1, 5, 6, 2400, 1.2),
(98, 3, 5, 9, 2400, 1.2),
(99, 5, 5, 7, 2400, 1.2),
(100, 2, 4, 5, 1600, 1.65)
;


create table keyboard_manufacturer(
id int auto_increment primary key,
name varchar(50) not null
);

insert into keyboard_manufacturer values 
(1,'APPLE'),
(2, 'CRYPTO'), 
(3,'GENESIS'), 
(4,'HYPERX'), 
(5,'LOGITECH'), 
(6,'MICROSOFT'), 
(7,'RAZER');

create table keyboard_type(
id int auto_increment primary key,
name varchar(50) not null
);

insert into keyboard_type values
(1, 'Wireless'),
(2, 'Wired')
;

create table keyboard(
id int primary key,
manufacturer int,
type int,
constraint foreign key (id) references product(id),
constraint foreign key (manufacturer) references keyboard_manufacturer(id),
constraint foreign key (type) references keyboard_type(id)
);

insert into keyboard values
(8, 5, 2)
;

insert into keyboard values
(101, 1, 1),
(102, 2, 2),
(103, 2, 2),
(104, 3, 2),
(105, 3, 2),
(106, 4, 1),
(107, 5, 1),
(108, 6, 2),
(109, 4, 1),
(110, 6, 2)
;

