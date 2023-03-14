module Github
  class RepoSearch

    #In search_repository method we are taking search_input and first validating if its nil, empty or ''
    # If yes then return nil Otherwise move forward and call search_repos method on Octokit Library
    # We can also use search_repositories Method as per ""octokit.rb/lib/octokit/client/search.rb"" search_repos is an alias of search_repositories
    #
    # Just for Information that was not the requirement
    # We can also pass an options = {} attribute to search_repos((query, options = {})) which will handle
    #       # @param options [Hash] Sort and pagination options
    #       # @option options [String] :sort Sort field
    #       # @option options [String] :order Sort order (asc or desc)
    #       # @option options [Integer] :page Page of paginated results
    #       # @option options [Integer] :per_page Number of items per page
    #search_repositories('abc', {:page => 1, :per_page => 1})
    def search_repository(search_input)
      return if search_input.blank?
      client.search_repos(search_input)
    end


    private

    #To call Github API's we are using Octokit
    #Octokit => Official clients for the GitHub API
    #To access Github api we are generating a client object and passiing access_token to it =
    def client
      @client ||= Octokit::Client.new(:access_token => ENV['GITHUB_OAUTH_ACCESS_TOKEN'])
    end
  end
end