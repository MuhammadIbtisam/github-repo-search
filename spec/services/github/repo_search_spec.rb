require 'rails_helper'

describe Github::RepoSearch, type: :service do
  #repo name as search input
  let(:search_input) { 'github-repository-search' }
  # access token
  let(:access_token) { ENV['GITHUB_OAUTH_ACCESS_TOKEN'] }
  # initiating mock objects
  let(:client_object) { double("client") }
  let(:response) { double("repos") }
  #class instance using described class
  let(:class_instance) { described_class.new }

  before do
    allow(Octokit::Client).to receive(:new).and_return(client_object)
    allow(client_object).to receive(:search_repos).and_return(response)
  end

  it "Initialize Github clients with GITHUB_OAUTH_ACCESS_TOKEN" do
    expect(Octokit::Client).to receive(:new).with(access_token: access_token).and_return(client_object)
    class_instance.search_repository(search_input)
  end

  it "After intialization of Github client calling Github search_repo with an input search" do
    expect(client_object).to receive(:search_repos).with(search_input).and_return(response)
    class_instance.search_repository(search_input)
  end

  context 'Failure Cases' do

    it "Return nil when input is ''" do
      expect(class_instance.search_repository('')).to eq(nil)
    end

    it "Returns nil when input is nil" do
      expect(class_instance.search_repository('')).to eq(nil)
    end

  end

  context 'Success Case' do
    it "Returns list of Repos with their total count when input is correct" do
      expect(class_instance.search_repository(search_input)).to eq(response)
    end
  end
end