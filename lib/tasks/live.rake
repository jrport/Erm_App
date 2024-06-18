namespace :dev do
  desc "Run server with tailwind build on watch, use this for development"
  task :start do
    commands = {
      "Tailwind CSS Watcher" => "bin/rails tailwindcss:watch",
      "Rails Server" => "bin/rails server"
    }

    threads = commands.map do |name, cmd|
      Thread.new do
        puts "Starting #{name} with command: #{cmd}"
        system(cmd)
        if $?.success?
          puts "#{name} ran successfully."
        else
          puts "#{name} failed with exit status: #{$?.exitstatus}."
          exit 1
        end
      end
    end

    # Join all threads to the main thread to ensure they run concurrently
    threads.each(&:join)
  end
end

