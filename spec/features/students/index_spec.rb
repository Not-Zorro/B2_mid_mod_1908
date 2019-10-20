require 'rails_helper'

describe "Student index page" do
  it "can list student name, age, cohord, and all instructors" do
    meg = Instructor.create(name: 'Meg')
    mike = Instructor.create(name: 'Mike')
    ian = Instructor.create(name: 'Ian')
    david = Student.create(
      name: 'David',
      age: 20,
      cohort: 1908
    )
    meg.students << david
    mike.students << david

    visit '/students'

    within "#student-#{david.id}" do
      expect(page).to have_content('David')
      expect(page).to_not have_content('20')
      expect(page).to have_content('1908')
      expect(page).to have_content('Instructors:')
      expect(page).to have_link('Meg')
      expect(page).to have_link('Mike')
      expect(page).to_not have_link('Ian')
    end
  end
end
