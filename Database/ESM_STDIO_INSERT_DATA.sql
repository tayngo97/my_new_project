use esm_stdio;

SET FOREIGN_KEY_CHECKS =0;
insert into skill_types (`name`,`description`) values ('Technical Skills','Technical skills involve skills that give the managers the ability 
and the knowledge to use a variety of techniques to achieve their objectives. These skills not only involve operating machines and software, 
production tools, and pieces of equipment but also the skills needed to boost sales, design different types of products and services, and market the services and the products.'),

('Conceptual Skills ','These involve the skills managers present in terms of the knowledge and ability for abstract thinking and formulating ideas.
 The manager is able to see an entire concept, analyse and diagnose a problem, and find creative solutions. 
This helps the manager to effectively predict hurdles their department or the business as a whole may face. '),

('Human or Interpersonal Skills ','The human or the interpersonal skills are the skills that present the managers’ ability to interact, work or relate effectively with people. 
These skills enable the managers to make use of human potential in the company and motivate the employees for better results. '),

('Language skills','Language skills are communication skills that help you convey your ideas with clarity and precision.
 Not only do you learn to speak well but also listen attentively. Writing clearly with brevity is another skill that’s considered crucial in a professional setting.
 Reading helps you make sense of vast amounts of data and information.');
 
 insert into level_of_skill (`name`,`description`) values ('Novice','Has just rudimentary or textbook knowledge that is not linked to practice. 
Requires constant monitoring or guiding. 
Has little or no understanding of how to cope with ambiguity. 
When it comes to behaviours, he has a tendency to look at them in isolation.'),

 ('Advanced Beginner','Has basic knowledge of key aspects of the practice. 
Straightforward tasks are likely to be done to an acceptable standard. 
Is able to achieve some steps using own judgment, but needs supervision for the overall task. 
Appreciates complex situations, but is only able to achieve partial resolution. 
Sees actions as a series of steps.'),

 ('Competent','Has good working and background knowledge of area of ​​practice. 
Results can be achieved for open tasks, though may lack refinement. 
Is able to achieve most tasks using own judgment. 
Copes with complex situations through deliberate analysis and planning. 
Sees actions at least partly in terms of longer-term goals.'),

 ('Proficient','Depth of understanding of discipline and area of ​​practice. 
Fully acceptable standard achieved, results are also achieved for open tasks. 
Able to take full responsibility for own work (and that of others where applicable). 
Deals with complex situations holistically, confident decision-making. 
Sees the overall picture and how individual actions fit within it.'),

 ('Expert','Authoritative knowledge of discipline and deep tacit understanding across area of ​​practice. 
Excellence achieved with relative ease. 
Able to take responsibility for going beyond existing standards and creating own interpretations. 
Holistic grasp of complex situations, moves between intuitive and analytical approaches with ease. 
Sees overall picture and alternative approaches, has vision of what may be possible.');

 insert into skill (`name`,skill_type_id,delete_flag) values 
('Java',1,0),
('Php',1,0),
('Javascript',1,0),
('Ruby',1,0),
('Nodejs',1,0),
('Flutter',1,0);

insert into project_status( `name` ) values 
('Start'),
('Inprogress'),
('Done'),
('Release');

insert into project( `name`,start_time,end_time,`description`,`status_id`,delete_flag ) values 
('Shoppee','2022-12-31','2023-12-31','This project can help sell product to customers','2',0),
('Vinagame','2022-12-31','2023-12-31','This project provide F04 to young peaple','2',0),
('Grap','2023-12-31','2024-12-31','This project about logictic','2',0);

INSERT INTO `esm_stdio`.`project_skills` (`project_id`, `skills_id`) VALUES
 ('1', '2'),
 ('1', '3'),
 ('1', '1');

INSERT INTO `employee` (`id`, `name`, `date_of_birth`, `address`, `job_title`, `email`, `phone_number`, `place_of_birth`, `nationality`, `avatar_img`, `start_date`, `create_at`, `modify_at`, `delete_flag`, `gender`, `website`, `professional_summary`)
VALUES (1, 'Ly', '2022-12-31', 'Da nang', 'java developer', 'ly@gmaail.com', '0123456789', 'hue', 'Vietnam', 'image1', '2022-12-31', '2022-12-31', '2022-12-31', 0, 'MALE', 'https://stdiohue.com/', NULL),
       (2, 'Nguyễn Văn Hùng', '2022-12-31', '123 Hùng Vương, Huế', 'Java Developer', 'hung@gmaail.com', '0123456789', 'hue', 'Vietnam', 'https://coreui.io/react/docs/static/1-34eedf58c0876517e8587997f9625944.jpg', '2022-12-31', '2022-12-31', '2022-12-31', 0, 'MALE', 'https://stdiohue.com/', NULL),
       (3, 'Nhan', '2022-12-31', 'Quang nam', 'java developer', 'nhan@gmaail.com', '0123456789', 'hue', 'Vietnam', 'image3', '2022-12-31', '2022-12-31', '2022-12-31', 0, 'FEMALE', 'https://stdiohue.com/', NULL);

INSERT INTO `account` (`id`, `username`, `password`, `create_at`, `modify_at`, `delete_flag`)
 VALUES ('1', 'anhtayd27111997@gmail.com', '$2a$12$.Mfx0vhTiWRZL723RZD4.uROZM6QVKpYJ4ZM.JSuc54IJVMz7rJAi', '2022-12-31', 
 '2023-12-31 23:59:59', 0),
 ('2', 'hung', '$2a$12$.Mfx0vhTiWRZL723RZD4.uROZM6QVKpYJ4ZM.JSuc54IJVMz7rJAi', '2022-12-31', 
 '2023-12-31 23:59:59', 0);
 
INSERT INTO role (`id`, `name`, `create_at`,`modify_at`) VALUES 
('1', 'ROLE_ADMIN','2023-12-31','2023-12-31'),
('2', 'ROLE_EMPLOYEE','2023-12-31','2023-12-31');

INSERT INTO accounts_roles (`account_id`, `role_id`) VALUES
 ('1', '1'),
 ('2', '2');

INSERT INTO employees_projects (`employee_id`, `project_id`) VALUES 
('1', '2'),
('1', '3'),
('1', '1'),
('2', '2'),
('2', '3');

INSERT INTO employee_skills (`employee_id`, `skills_id`,`level_of_skill_id`) VALUES 
('1', '2','3'),
 ('1', '3','1'),
 ('1', '1','2');
 
 INSERT INTO education (`id`, `name_of_education_center`, `majors`, `description`,`employee_id`, `start_date`,`end_date`) VALUES 
('1', 'DHKH HUE','CNTT', 'Cu nhan CNTT', 1, '2021-12-31','2023-12-31'),
('2', 'DHBK DA NANG','CNTT', 'Ky Su CNTT', 2, '2021-12-31','2023-12-31');

 INSERT INTO employment_history (`id`, `job_title`, `employer`, `description`,`employee_id`, `start_date`,`end_date`) VALUES 
('1', 'Softword','PHP Developer', 'software developer', 1, '2021-12-31','2023-12-31'),
('2', 'Brycen','Java Developer', 'software developer', 2, '2022-12-31','2023-12-31');

SET FOREIGN_KEY_CHECKS = 1;

