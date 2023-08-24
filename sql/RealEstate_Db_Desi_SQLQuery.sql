/* Create the "realestate" database */
create database realestate
on primary
	(
		name = N'Realest_data',
		filename = N'E:\SQL practice\defult instance 16\realestdb\Realest.mdf',
		size = 8192kb,
		filegrowth = 65536kb
	)
Log on
	(
		name = N'Realest_log',
		filename = N'E:\SQL practice\defult instance 16\realestdb\Realest_log.mdf',
		size = 8192kb,
		filegrowth = 65536kb
	)

/* 1. Requirement: Property*/
	
create table property
	(
		id int,
		address_line varchar(20),
		address_line2 varchar(20),
		city varchar(20),
		region varchar(20),
		property_type_id int,
		property_size int,
		block_size int,
		num_bedrooms int,
		num_bathrooms int,
		num_carspaces int,
		description varchar(20),
		constraint pk_property_id
		primary key (id),
		constraint fk_Property_type_id
		foreign key (property_type_id) references Property_type(id),
	)
create table Property_type
	(
		id int,
		description varchar(20), 
		--Note: 'Examples: house, Unit, Townhouse'
		constraint pk_Property_type_id
		primary key (id)
	)

go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Examples: house, Unit, Townhouse',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'Property_type';
go

select *
from sys.extended_properties
where major_id = OBJECT_ID('Property_type')

/* 2. Requirement: Sale or rent */

create table listing_type
	(
		id int,
		description varchar(20),
		--Note: 'stores either for rent or for sale'
		constraint pk_listing_type_id
		primary key (id)
	)
go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: stores either for rent or for sale',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'listing_type';
go

create table listing_status
	(
		id int,
		description varchar(20), 
		--Note: 'Stores the life cycle of property'
		constraint pk_listing_status_id
		primary key (id)
	)

go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Stores the life cycle of property',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'listing_status';
go

/* 4. Requirement: features */
create table feature 
	(
		id int,
		feature_name varchar,
		--Note: 'Examples are washing machine, alarm, garage'
		constraint pk_feature_id
		primary key (id)
	)
	
go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Examples are washing machine, alarm, garage',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'feature';
go

create table property_feature
	(
		property_id int,
		feature_id int,
		constraint fk_property_feature_property_id
		foreign key (property_id) references Property(id),
		constraint fk_property_feature_feature_id
		foreign key (feature_id) references feature(id)
	)

/* 5. Requirement: process */
create table listing
	(
		id int,
		property_id int,
		listing_type_id int,
		listing_status_id int,
		price int ,
		--[Note: 'stores either a sale price or a rental price']
		created_date date,
		constraint fk_listing_property_id
		foreign key (property_id) references property(id),
		constraint fk_listing_listing_type_id
		foreign key (listing_type_id) references listing_type(id),
		constraint fk_listing_listing_status_id
		foreign key (listing_status_id) references listing_status(id)
	)
	
go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: stores either a sale price or a rental price',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'listing';
go

/* 
6. Requirement: employees on a property
7. Requirement: employee details
*/
create table employee
	(
		id int,
		first_name varchar(20),
		last_name varchar(20),
		start_date date,
		end_date date,
		job_title varchar(20),
		constraint pk_employee_id
		primary key (id)
	)
create table property_employee
	(
		property_id int,
		employee_id int,
		role_type_id int,
		start_date date,
		end_date date,
		constraint fk_property_employee_property_id
		foreign key (property_id) references property(id),
		constraint fk_property_employee_employee_id
		foreign key (employee_id) references employee(id),
		constraint fk_property_employee_role_type_id
		foreign key (role_type_id) references role_type(id)
	)
create table role_type
	(
		id int,
		description varchar(20),
		--Note: 'Examples are Property Manager or Selling Agent'
		constraint pk_role_type_id
		primary key (id)
	)
	
go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Examples are Property Manager or Selling Agent',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'role_type';
go

/* 8. Requirement: inspection */
create table inspection
	(
		id int,
		property_id int,
		inspection_datetime datetime,
		responsible_employee_id int
		constraint pk_inspection_id
		primary key (id),
		constraint fk_inspection_property_id
		foreign key (property_id) references property(id),
		constraint fk_inspection_responsible_employee_id
		foreign key (responsible_employee_id) references employee(id)
	)

/* 9. Requirement: clients */
create table client
	(
		id int,
		first_name varchar(20),
		last_name varchar(20),
		email_address varchar(20),
		phone_number int,
		constraint pk_client_id
		primary key (id)
	)

create table client_property_interest
	(
		client_id int,
		property_id int,
		constraint fk_client_property_interest_client_id
		foreign key (client_id) references client(id),
		constraint fk_client_property_interest_property_id
		foreign key (property_id) references property(id)
	)
create table client_inspection
	(
		client_id int,
		inspection_id int,
		constraint fk_client_inspection_client_id
		foreign key (client_id) references client(id),
		constraint fk_client_inspection_inspection_id
		foreign key (inspection_id) references inspection(id)
	)

/* 10. Requirement: offers */
create table offer
	(
		id int,
		client_id int,
		property_id int,
		offer_status_id int,
		offer_amount int,
		constraint pk_offer_id
		primary key (id),
		constraint fk_offer_client_id
		foreign key (client_id) references client(id),
		constraint fk_offer_property_id
		foreign key (property_id) references property(id),
		constraint fk_offer_offer_status_id
		foreign key (offer_status_id) references offer_status(id)
	)
create table offer_status
	(
		id int,
		description varchar(20),
		--Note: 'Stores values such as Accepted, Rejected, In Review'
		constraint pk_offer_status_id
		primary key (id)
	)
	
go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Stores values such as Accepted, Rejected, In Review',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'offer_status';
go

/* 11. Requirement: sale */
create table contract
	(
		id int,
		property_id int,
		listing_type_id int,
		contract_document varchar(20),
		responsible_employee_id int,
		client_id int,
		contract_status_id int,
		signed_date date,
		start_date date,
		end_date date,
		constraint pk_contract_id
		primary key (id),
		constraint fk_contract_property_id
		foreign key (property_id) references property(id),
		constraint fk_contract_listing_type_id
		foreign key (listing_type_id) references listing_type(id),
		constraint fk_contract_responsible_employee_id
		foreign key (responsible_employee_id) references employee(id),
		constraint fk_contract_client_id
		foreign key (client_id) references client(id),
		constraint fk_contract_contract_status_id
		foreign key (contract_status_id) references contract_status(id)
	)
create table contract_status
	(
		id int,
		description varchar(20),
		--Note: 'Examples such as Signed or In Progress'
		constraint pk_contract_status_id
		primary key (id)
	)

go
EXEC sp_addextendedproperty
@name = N'Table_Description',
@value = N'Note: Examples such as Signed or In Progress',
@level0type = N'Schema', @level0name = 'dbo',
@level1type = N'Table',  @level1name = 'contract_status';
go
