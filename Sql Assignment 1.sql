use university_management;
show tables;

-- Basic Tasks
-- 1) Display all students with their FirstName, LastName, and Email.
select * from students;
select firstname,lastname,email from students;

-- 2) List all courses having Credits = 4.
select * from courses;
select * from courses where credits = 4;

-- 3)Show all professors belonging to the Computer Science department.
select * from professors;
select * from professors where Department = 'Computer Science';

-- 4) Find students born after 2000-01-01.
select * from students;
select * from students where DOB > '2000-01-01';

-- 5) Display all enrollments where Grade = 'A'.
select * from enrollments;
select * from enrollments where Grade = 'A';

-- 6) List distinct Departments from the Professors table.
select * from professors;
select distinct department from professors;

-- 7) Show top 10 students ordered by DOB (youngest first).
select * from students;
select * from students order by DOB desc limit 10;

-- 8) Count total number of students, courses, and professors.
select count(*) from students;
select count(*) from courses;
select count(*) from professors;

-- Intermediate Tasks

-- 9) Display Student Name, Course Name, and Grade.
select s.firstname,s.lastname,c.coursename,e.Grade from students as s natural join courses as c natural join enrollments as e;  -- (Method 1)

-- (Method 2)
select s.firstname,s.lastname,e.grade,c.coursename
from students s
join enrollments e
on s.studentid = e.studentid
join courses c
on e.courseid = c.courseid;

-- 10) List all students enrolled in Database Systems.
select * from students left join enrollments on students.studentid = enrollments.studentid;      -- (Method 1)

select s.firstname,s.lastname,e.enrollid
from students s
left join enrollments e
on s.studentid = e.studentid;     -- (Method 2)

select s.* from students s
left join enrollments e
on s.studentid = e.studentid;    -- (Method 3)

-- 11) Count how many students are enrolled in each course.
select count(*) from students left join enrollments on students.studentid = enrollments.studentid;

-- 12) Show courses having more than 10 students enrolled.
select c.coursename,count(e.studentid) as studentcount
from courses c
join enrollments e
on c.courseid = e.courseid
group by c.coursename
having count(e.studentid) >= 10;

-- 13) Find average number of credits per student (based on enrollments).
select e.studentid,avg(c.credits) as Avg_no from courses c
join enrollments e
on c.courseid = e.courseid
group by studentid
order by Avg_no desc;

-- 14) Display department name with its Head Professor name.
select d.deptname,p.profname
from departments d
join professors p
on d.headprofid = p.profid;

-- 15) List students who scored Grade A or B.
select s.Firstname,s.Lastname,e.Grade
from students s
join enrollments e
on s.studentid = e.studentid
Where e.Grade in ('A','B');

-- 16) Show departments that have more than 3 professors.
select p.department,count(p.profname) as No_of_Prof
from departments d
join professors p
on d.deptname = p.department
group by department
having count(profname) > 3;

-- 17) Display student first name, last name, and course name.
select s.Firstname,s.lastname,c.coursename
from students s
inner join enrollments e
on s.studentid = e.studentid
inner join courses c
on e.courseid = c.courseid;

-- 18) Show student name with grade for each enrollment.
select s.Firstname,s.Lastname,e.Grade
from students s
inner join enrollments e
on s.studentid = e.studentid
order by Grade;

-- 19)  Display courses that have at least one student enrolled.
select c.Coursename, count(e.studentid) as student_count
from courses c
inner join enrollments e
on c.courseid = e.courseid
Group by c.Coursename;

-- 20) Show professors who are department heads.
select p.profname,d.deptname
from professors p
inner join departments d
on p.profid = d.headprofid;

-- 21) List students enrolled in “Database Systems”
select s.Firstname,s.Lastname,c.Coursename
from students s
inner join enrollments e
on s.studentid = e.studentid
inner join courses c
on e.courseid = c.courseid
where coursename in ('Database Systems');

-- 22) List courses with credits ≥ 4 and their enrollments.
select *
from courses c
inner join enrollments e
on c.courseid = e.courseid
where credits >= 4;

-- Some more practices

-- Show distinct course names with LIMIT 5.
select distinct Coursename from courses
limit 5;

-- Find top 5 distinct students enrolled recently.
select s.Studentid,s.Firstname,s.Lastname
from students s
join enrollments e
on s.studentid = e.studentid
order by enrollid desc
limit 5;

-- Display distinct departments ordered alphabetically with LIMIT 3.
select distinct deptname from departments
order by deptname asc
limit 3;

-- Find top 10 students whose email contains ‘on’.
select * from students where email like '%on%'
order by studentid asc
limit 10;

-- List distinct courses starting with ‘C’ and having credits ≥ 3.
select distinct coursename from courses where coursename like 'c%'
And credits >= 3;

-- Show top 5 most common last names.
SELECT LastName, count(*) as Name_count
from students
group by lastname
order by Name_count desc
limit 5;

select firstname,lastname from students where lastname like '%smith%';