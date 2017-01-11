require 'rails_helper'

describe 'user' do
  context 'visits a project page and uses autocomplete search bar' do
    xscenario 'they see the directions in the map_panel', :js => true do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      project = create(:project, lat: "40.748817", lng: "-73.985428")

      visit "/projects/#{project.id}"

      expect(current_path).to eq(project_path(project))

      save_screenshot('~/Desktop/poltegeist_shot.png')
      fill_in("origin-input", with: "Times Square")
    end
  end
end
