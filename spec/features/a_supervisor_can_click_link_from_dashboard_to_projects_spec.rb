require 'rails_helper'

describe 'supervisor' do
  context 'clicks projects link on dashboard' do
    scenario 'they end up on the projects index page', :js => true do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      projects = create_list(:project, 2)

      visit dashboard_path

      click_on('Projects')

      expect(current_path).to eq(projects_path)
      expect(page).to have_css('div.project-card', count: 2)
    end
  end
end
