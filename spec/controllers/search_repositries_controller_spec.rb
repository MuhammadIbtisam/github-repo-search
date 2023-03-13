require 'rails_helper'

RSpec.describe SearchRepositriesController, type: :controller do

  describe "list" do
    #repo name as search input
    let(:search_input) { 'github-repository-search' }
    let(:search_service) { double("search_service") }
    let(:get_repos) { double("repos") }
    let(:all_params)  { { repos: get_repos, search_input: search_input } }
    let(:empty_params) { { search_input: '' } }
    let(:empty_params_2) { { repos: nil, search_input: '' } }

    before do
      allow(Github::RepoSearch).to receive(:new).and_return(search_service)
      allow(search_service).to receive(:search_repository).and_return(get_repos)
    end

    describe "Provide all the required params" do
      it "returns success response on providing all required params" do
        get :list, params: all_params
        response.should be_successful
      end
    end


    describe "empty params" do
      it "returns success response on providing all empty search input" do
        get :list, params: empty_params
        response.should be_successful
      end

      it "returns success response on providing all empty params" do
        get :list, params: empty_params_2
        response.should be_successful
      end

    end

    it "pass all attributes to the Repo and get success response" do
      expect(Github::RepoSearch).to receive(:new).and_return(search_service)
      expect(search_service).to receive(:search_repository).and_return(get_repos)

      get :list, params: all_params
    end

  end
end
