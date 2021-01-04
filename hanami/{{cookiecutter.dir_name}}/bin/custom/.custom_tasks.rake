namespace :custom do
  desc "This take does something useful!"

  # depend on :environment because this sets the hanami application environment
  # and now you can use anything in the ./lib or ./apps directory
  task do_it: :environment do
    puts "Do something useful!"
    # call an interactor now, e.g., AddBook
    # AddBook.new.call({title: "Making Your Own Rake Tasks", author: "Gavin Didrichsen"})
  end
end