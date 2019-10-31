class BuildJekyll
  def self.now
    source_dir = CurrentSite.site.git_repo_path

    if ENV['use_docker']
      Rails.logger.info "Starting the Docker compose!"
      output = system("/bin/bash --login -c \"cd #{source_dir}; docker-compose -p \"\\${PWD}\" -f ~/docker-compose.yml up\"")
      Rails.logger.info "Docker finished!"

      output
    else
      Bundler.with_clean_env do

        trap('SIGINT') { puts "OK, I'm Hyde-ing Now ;)"; exit }
        output = system("/bin/bash --login -c \"cd #{source_dir}; yarn run jekyllpreview\"")
  
        puts output
  
      end
    end
  end
end