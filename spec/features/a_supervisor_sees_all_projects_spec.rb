require 'rails_helper'

describe 'supervisor'do
  context 'visits projects index' do
    scenario 'and sees all exiting projects', :js => true do
      projects = create_list(:project, 3)
      supervisor = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor)
      visit projects_path

      expect(page).to have_content("All Projects")
      expect(page).to have_content(projects.first.title)
      expect(page).to have_content(projects.last.title)
      expect(page).to have_selector('div.project-card', count: 3)
    end
  end
end
