-- Create database
DROP DATABASE IF EXISTS task; 
CREATE DATABASE task;

-- Create table student
CREATE TABLE `student` ( `StudentID` INT NOT NULL AUTO_INCREMENT , `FirstName` VARCHAR(50) NOT NULL , `LastName` VARCHAR(50) NOT NULL , PRIMARY KEY (`StudentID`));

-- Create table exam

CREATE TABLE `exam` ( `ID` INT NOT NULL AUTO_INCREMENT, `Name` VARCHAR(50) NOT NULL , `Points` INT NOT NULL, PRIMARY KEY (`ID`));

-- Create table student_exam

CREATE TABLE `student_exam` ( `StudentID` INT NOT NULL , `ExamID` INT NOT NULL ,  FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON UPDATE CASCADE ON DELETE CASCADE, 
FOREIGN KEY (ExamID) REFERENCES Exam(ID) ON UPDATE CASCADE ON DELETE CASCADE);

-- Insert value in table exam

INSERT INTO `exam` (`ID`, `Name`, `Points`) VALUES (NULL, 'Math', '6'),(NULL, 'Geometry', '5'),(NULL, 'Statistics', '6'), (NULL, 'Biology ', '4'),  (NULL, 'Physics ', '7');

-- Insert value in table students

INSERT INTO `student` (`StudentID`, `FirstName`, `LastName`) VALUES (NULL, 'Mika', 'Mikic'),(NULL, 'Pavle', 'Jocic'), (NULL, 'Joca', 'Peric'),  (NULL, 'Kol', 'Donver'), (NULL, 'John', 'Klor'), (NULL, 'Pera', 'Jocic'), (NULL, 'Mika', 'Jocic'), (NULL, 'Mak', 'Kler'), (NULL, 'Luka', 'Jocic'), (NULL, 'Mika', 'Lukic');


-- Insert value in table student_exam

INSERT INTO `student_exam` (`StudentID`, `ExamID`) VALUES ('3', '3'),('3', '4'),('1', '1'),('5', '2'),('1', '5'),('8', '3'),('7', '3'),('5', '4'),('2', '3'),('2', '4'),('9', '3'),('9', '4'),('9', '5'),('6', '1'),('10', '5'),('9', '1'),('3', '2'),('8', '5'),('1', '3'),('1', '4'); 

-- All student taking a specific exam

SELECT student.*, exam.Name AS Exam
FROM student JOIN student_exam ON student.StudentID = student_exam.StudentID JOIN exam ON student_exam.ExamID = exam.ID
ORDER BY student.FirstName ASC;

-- Shows all exams for a student with a specific student ID

SELECT exam.*, st_ex.StudentID FROM exam JOIN student_exam st_ex ON exam.ID = st_ex.ExamID ORDER BY exam.Name ASC;