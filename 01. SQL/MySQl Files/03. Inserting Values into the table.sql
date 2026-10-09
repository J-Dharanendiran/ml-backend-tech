-- select * from users;
-- alter table users modify column date_of_birth DATETIME after gender;
-- select * from users;

-- alter table users modify column email varchar(150) after name;
-- Undoing the previous exercises to get a proper table format!!

insert into users values
(1, 'Alice', 'alice@example.com', 'Female', '1995-05-14', DEFAULT);
select * from users;
-- Insert by Specifying Column Names 

insert into users (name, email, gender, date_of_birth)
values ('Bob','bob@example.com','Male','2008-05-08');

select * from users;
-- Insert Multiple Rows effectively

INSERT INTO users
(name, email, gender, date_of_birth)
VALUES
('Charlie', 'charlie@example.com', 'Other', '1988-02-17'),
('David', 'david@example.com', 'Male', '2000-08-09'),
('Eva', 'eva@example.com','Female', '1993-12-30');

select * from users;

