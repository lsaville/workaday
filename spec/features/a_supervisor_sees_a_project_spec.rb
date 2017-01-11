require 'rails_helper'
#as a supervisor when I visit a projects show page
#I see a map (untestable??)
#I see the project title
#I see the project details
#I see the project's homeowner
#I see a place to comment
#I see a button to submit a comment
#I see comments(if there are any, otherwise I see project has no comments)
#I see a button to edit
#I see a button to delete

describe 'supervisor' do
  context 'visits project page' do
    scenario 'and sees project', :js => true do
      supervisor = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(supervisor)
      project = create(:project)

      visit "/projects/#{project.id}"

      expect(page).to have_content(project.title)
      expect(page).to have_content(project.details)
      expect(page).to have_link('Edit')
      expect(page).to have_link('Delete')
      expect(page).to have_link('Post Comment')
    end
  end
end
