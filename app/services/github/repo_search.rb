module Github
  class RepoSearch

    def search_repository(search_input)
      return if search_input.blank?
      client.search_repos(search_input)
    end


    private

    def client
      @client ||= Octokit::Client.new(:access_token => ENV['GITHUB_OAUTH_ACCESS_TOKEN'])
    end
  end
end