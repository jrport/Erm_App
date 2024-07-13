task :build do
  sh "bundle install"
  sh "bundle exec rake assets:precompile --trace"
  sh "bundle exec rake assets:clean --trace"
end
