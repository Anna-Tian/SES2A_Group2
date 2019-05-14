package com.dao;

import com.bean.Student;
import com.bean.StudentProfile;

public interface StudentProfileDao {
	public Student getCurrentStudent(Integer student_id);
	public boolean saveStudentProfile(Student student,StudentProfile studentProfile);
}
