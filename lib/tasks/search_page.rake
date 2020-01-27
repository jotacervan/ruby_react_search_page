namespace :search_page do
  desc "Initial Elastic Search Integration"
  task initial_task: :environment do
    SearchPage.reindex
  end
end
