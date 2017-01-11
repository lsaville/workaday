require 'rails_helper'

describe 'user' do
  context 'visting a particular project from the projects index' do
    scenario 'they click on a projects title and are redirected to the project page', :js => true do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      project1 = create(:project)
      project2 = create(:project)
      
      visit projects_path

      click_on(project1.title)

      expect(current_path).to eq(project_path(project1))
      expect(page).to have_content(project1.title)
      expect(page).to_not have_content(project2.title)
    end
  end
end
