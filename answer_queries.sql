-- Retrieve all students from the Students table.
select * from students;

-- List all courses along with their department and credits.
SELECT 
    course_name, department, credits
FROM
    courses;
    
    
-- Find the students who are enrolled in the 'Database Management Systems' course.
select students.first_name,students.last_name 
from students 
join  enrollments 
on students.student_id=enrollments.student_id
join courses
on courses.course_id=enrollments.course_id;


-- Get the count of students enrolled in each course.
select courses.course_name,count(enrollments.student_id)
from courses
join enrollments
on courses.course_id=enrollments.course_id
group by courses.course_name;

-- Retrieve the student names along with their grades.
select students.first_name,students.last_name,enrollments.grade
from students
join enrollments
on students.student_id=enrollments.enrollment_id
join courses
on courses.course_id=enrollments.course_id;


-- ind students who have scored grade 'A'.
select students.first_name,students.last_name
from students
join enrollments
on students.student_id=enrollments.student_id
where enrollments.grade='A';

-- List all faculty members teaching courses with at least one enrolled student.
select distinct faculty.faculty_name,faculty.department
from faculty
join courses
on courses.department=faculty.department
join enrollments
on courses.course_id=enrollments.enrollment_id;

-- Find students who are enrolled in more than one course.
select students.first_name,students.last_name,count(enrollments.student_id) as c
from students
join enrollments 
on students.student_id=enrollments.student_id
group by students.first_name,students.last_name
having c>1;



-- Find courses that have  enrollments.
select distinct course_name
from courses
join enrollments
on courses.course_id=enrollments.course_id;

-- Find courses that have no enrollments.
select distinct course_name
from courses
join enrollments
on courses.course_id=enrollments.course_id
where enrollments.course_id is null;

-- Retrieve the latest assignment deadlines per course.
select assignments.due_date,courses.course_name
from assignments
join courses
on courses.course_id=assignments.course_id;

--  Count the number of students enrolled in each course.
select courses.course_name,count(enrollments.student_id)
from courses
join enrollments
on enrollments.course_id=courses.course_id
group by courses.course_name ;

--  Find faculty members who teach Computer Science courses.
select faculty.faculty_name
from faculty
where department="Computer Science";

-- Find the most popular course (course with the highest number of enrollments).
select courses.course_name,count(enrollments.student_id) as c
from courses
join enrollments
on enrollments.course_id=courses.course_id
group by courses.course_name
order by c desc
limit 1;

-- Get the student who has the highest number of enrollments.
select students.first_name,students.last_name,count(enrollments.student_id)as c
from students
join enrollments
on enrollments.student_id=students.student_id
group by students.first_name,students.last_name
order by c desc
limit 1;

