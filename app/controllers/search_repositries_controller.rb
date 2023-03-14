class SearchRepositriesController < ApplicationController

  # Rendering Repositories here
  def list
    render locals: { repos: get_repos, search_input: params[:search] }
  end

  private
  # Here we are calling Reposearch Service and passing search input
  def get_repos
    Github::RepoSearch.new.search_repository(params[:search])
  end
end
