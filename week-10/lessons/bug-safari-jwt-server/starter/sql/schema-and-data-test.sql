drop database if exists bug_safari_test;
create database bug_safari_test;
use bug_safari_test;

create table bug_order (
	bug_order_id int primary key auto_increment,
    `name` varchar(50) not null,
    `description` varchar(250) not null
);

create table sighting (
	sighting_id int primary key auto_increment,
    bug_type varchar(50) not null,
    `description` text,
    sighting_date date not null,
    interest double not null,
    image_url varchar(250) null,
    bug_order_id int not null,
    constraint fk_sighting_bug_order_id
		foreign key (bug_order_id)
		references bug_order(bug_order_id)
);

delimiter //

create procedure set_known_good_state()
begin

	delete from sighting;
	alter table sighting auto_increment = 1;
	delete from bug_order;
	alter table bug_order auto_increment = 1;

	-- data
	insert into bug_order (bug_order_id, `name`, `description`) values
		(1, 'Coleptera', 'beetles'),
		(2, 'Lepidoptera', 'butterflies, moths'),
		(3, 'Hymenoptera', 'ants, bees, wasps');
		
	insert into sighting(bug_type, `description`, sighting_date, interest, image_url, bug_order_id) values
		('Ladybug', 'mature ladybug in the grass', 
		'2020-08-12', 5.5, 
		'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Coccinella_magnifica01.jpg/640px-Coccinella_magnifica01.jpg', 
		1),
		('Cicadas', 'the cicadas are singing in the trees', 
		'2020-09-12', 7.0, 
		'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Neotibicen_linnei.jpg/536px-Neotibicen_linnei.jpg', 
		2),
		('Darkling Beetle', 'found an interesting beetle crawling in the compost', 
		'2020-09-11', 9.75, 
		'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Darkling_beetle.jpg/640px-Darkling_beetle.jpg', 
		1);

end //

delimiter ;


