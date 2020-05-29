guard 'rspec', cmd: 'bundle exec rspec --color --format doc'  do
  # watch /lib/ files
  watch(%r{^lib/(.+)\.rb$}) do |m|
    "spec/#{m[1]}_spec.rb"
  end

  # watch /spec/ files
  watch(%r{^spec/(.+)\.rb$}) do |m|
    "spec/#{m[1]}.rb"
  end
end

guard :shell do
  watch(%r{^profiles/(.+)\.rb$})  do |m|
    # n m[0], 'Changed'
    # `say -v cello #{m[0]}`
    `bundle exec inspec exec #{m[0]}`
  end
end
