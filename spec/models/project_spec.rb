require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validations' do
    it 'validates lat' do
      project = build(:project, lat: nil)

      expect(project).to_not be_valid
    end

    it 'validates lng' do
      project = build(:project, lng: nil)

      expect(project).to_not be_valid
    end

    it 'validates details' do
      project = build(:project, details: nil)

      expect(project).to_not be_valid
    end

    it 'validates title' do
      project = build(:project, title: nil)

      expect(project).to_not be_valid
    end
  end
end
