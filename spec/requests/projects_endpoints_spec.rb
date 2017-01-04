require 'rails_helper'

describe 'projects endpoint' do
  context 'GET /api/v1/projects' do
    it 'returns a collection of projects' do
      projects = create_list(:project, 3)

      get '/api/v1/projects'

      response_comments = JSON.parse(response.body)
      first = response_comments.first
      last  = response_comments.last

      expect(response).to be_success
      expect(response_comments.count).to eq(3)
      expect(first['lat']).to eq(projects.first.lat.to_s)
      expect(first['lng']).to eq(projects.first.lng.to_s)
      expect(first['title']).to eq(projects.first.title.to_s)
      expect(first['details']).to eq(projects.first.details.to_s)
      expect(last['title']).to eq(projects.last.title.to_s)
    end
  end
end
