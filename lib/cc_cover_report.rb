require "cc_cover_report/version"
require 'rest_client'

class CcCoverReport
  def self.report(repo_key = nil)
    begin
      repo_key ||= ENV['CC_REPO_KEY']
      if repo_key.present?
        index_file = SimpleCov.coverage_path + "/index.html"
        if SimpleCov.running
          silence_stream(STDOUT) do
            SimpleCov::Formatter::HTMLFormatter.new.format(SimpleCov.result)
          end
        end
        if File.exist?(index_file)
          RestClient::Request.execute(:url => 'https://codecop.encore.io/api/coverage.json', :method => :post, :verify_ssl => false,
          :payload => {
            :commit => `git log --pretty=%P -n 1`.chomp,
            :repo_key => repo_key,
            :coverage_file => File.new(index_file)}
            )
            puts "Pushed coverage report to CC"
          end
        else
          # No index file found - cannot upload coverage report
        end
      rescue Exception
        # Don't break any builds - just fail
      end
    end
  end
  