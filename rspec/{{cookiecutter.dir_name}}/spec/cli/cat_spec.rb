describe "features/cli/cat", :type => :aruba do
  let(:file) { "file.txt" }
  let(:content) { "Hello, Aruba!" }

  before(:each) { write_file file, content }
  before(:each) { run_command("cat file.txt") }

  it "should contain all file contents" do 
    expect(last_command_started).to have_output content
  end

  it "should contain a substring" do
    expect(last_command_started).to have_output(/Hello/)
  end
end