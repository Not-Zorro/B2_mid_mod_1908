require 'rails_helper'

describe InstructorStudent, type: :model do
  describe "relationships" do
    it { should belong_to :instructor }
    it { should belong_to :student }
  end
end
