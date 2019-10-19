require 'rails_helper'

describe Instructor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "relationships" do
    it { should have_many :instructor_students }
    it { should have_many :students }
  end
end
