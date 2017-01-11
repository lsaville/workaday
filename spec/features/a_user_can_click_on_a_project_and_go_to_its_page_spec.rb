require 'rails_helper'

describe 'user' do
  context 'visting a particular project from the projects index' do
    scenario 'they click on a projects title and are redirected to the project page' do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      projects = create_list(:project, 2)
      
      visit projects_path

      click_on(projects.first.title)

      expect(current_path).to eq(project_path(projects.first))
      expect(page).to have_content(project.first.title)
      expect(page).to_not have_contetn(project.last.title)
    end
  end
end
