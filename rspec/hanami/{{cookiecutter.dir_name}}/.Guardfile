guard 'rspec', cmd: 'bundle exec rspec --color --format doc'  do
  # controllers, views, templates, routes, features
  # guard :rspec, cmd: 'bundle exec rspec' do
    # run all spec tests if the following changes
    watch('spec/spec_helper.rb')                         { "spec" }
    watch('apps/web/config/routes.rb')                   { "spec" }
    
    # run targetted spec tests
    watch(%r{^spec/.+_spec\.rb$})
    watch(%r{^apps/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
    watch(%r{^apps/(.*)(.html)(\.erb|\.haml|\.slim)$})   { |m| "spec/#{m[1].gsub('templates', 'views')}_spec.rb" }
    watch(%r{^lib/(.+)\.rb$})                            { |m| "spec/lib/#{m[1]}_spec.rb" }
    
    # TODO: run integration tests on specific changes
    # watch(%r{^apps/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
end


