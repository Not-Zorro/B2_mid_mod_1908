require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :instructor_students }
    it { should have_many :students }
  end

  describe "student_age_avg method" do
    it "can find the average of all instructors students' age" do
      meg = Instructor.create(name: 'Meg')
      david = Student.create(
        name: 'David',
        age: 14,
        cohort: 1908
      )
      graham = Student.create(
        name: 'Graham',
        age: 16,
        cohort: 1908
      )
      meg.students << david
      meg.students << graham
      expect(meg.student_age_avg).to eq(15)
    end
  end
end
