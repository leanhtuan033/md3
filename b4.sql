CREATE DATABASE IF NOT EXISTS QuanLySinhVien;
USE QuanLySinhVien;
CREATE TABLE class (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL
);

CREATE TABLE teacher (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    country VARCHAR(50)
);

CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT,
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES class(id)
);

CREATE TABLE subject (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    credit INT NOT NULL
);

CREATE TABLE mark (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    mark DOUBLE,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);
INSERT INTO class (id, name, start_date)
VALUES
(1, 'C0326G1', '2026-10-01'),
(2, 'C0326G2', '2026-12-01'),
(3, 'C0326G3', '2026-11-15'),
(4, 'C0426G1', '2026-12-10');

INSERT INTO teacher (id, name, age, country)
VALUES
(1, 'Nguyen Van An', 35, 'Vietnam'),
(2, 'Tran Thi Binh', 30, 'Vietnam'),
(3, 'Le Van Nam', 40, 'Vietnam');

INSERT INTO student (id, name, age, class_id)
VALUES
(1, 'Hung', 20, 1),
(2, 'Hoa', 21, 2),
(3, 'Huy', 20, 2),
(4, 'Nam', 22, 3),
(5, 'Ha', 21, 4),
(6, 'Lan', 20, 1),
(7, 'Hoang', 22, 4);

INSERT INTO subject (id, name, credit)
VALUES
(1, 'Java', 3),
(2, 'Database', 4),
(3, 'Web', 5),
(4, 'C++', 2),
(5, 'Python', 4);

INSERT INTO mark (id, student_id, subject_id, mark)
VALUES
(1, 1, 1, 8.5),
(2, 1, 2, 7.5),
(3, 2, 1, 9.0),
(4, 2, 3, 8.0),
(5, 3, 1, 7.0),
(6, 3, 2, 9.0),
(7, 4, 3, 6.5),
(8, 5, 1, 8.0),
(9, 6, 2, 7.5),
(10, 7, 5, 9.0);
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
USE QuanLySinhVien;
SELECT *
FROM student
WHERE name LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
SELECT *
FROM class
WHERE MONTH(start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
SELECT *
FROM subject
WHERE credit BETWEEN 3 AND 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
UPDATE student
SET class_id = 2
WHERE name = 'Hung';
SELECT *
FROM student
WHERE name = 'Hung';
-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT
    student.name AS StudentName,
    subject.name AS SubName,
    mark.mark AS Mark,
    student.class_id AS ClassID
FROM student
JOIN mark
    ON student.id = mark.student_id
JOIN subject
    ON subject.id = mark.subject_id
ORDER BY
    mark.mark DESC,
    student.name ASC;