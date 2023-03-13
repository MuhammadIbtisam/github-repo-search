class SearchRepositriesController < ApplicationController
  def list
    render locals: { repos: get_repos, search_input: params[:search] }
  end

  private

  def get_repos
    Github::RepoSearch.new.search_repository(params[:search])
  end
end
