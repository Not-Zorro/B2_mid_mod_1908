require 'rails_helper'

describe "Instuctor show page from students link" do
  it "can show Instructor name, students, average age of students" do
    meg = Instructor.create(name: 'Meg')
    david = Student.create(
      name: 'David',
      age: 19,
      cohort: 1908
    )
    graham = Student.create(
      name: 'Graham',
      age: 28,
      cohort: 1908
    )
    zac = Student.create(
      name: 'Zac',
      age: 31,
      cohort: 1908
    )
    meg.students << david
    meg.students << graham
    meg.students << zac

    visit '/students'

    within "#student-#{david.id}" do
      click_link('Meg')
    end

    expect(current_path).to eq("/instructors/#{meg.id}")

    within "#student-#{david.id}" do
      expect(page).to have_content("David")
    end

    within "#student-#{graham.id}" do
      expect(page).to have_content("Graham")
    end

    within "#student-#{zac.id}" do
      expect(page).to have_content("Zac")
    end

    expect(page).to have_content("Average Student Age: 26")
  end
end
