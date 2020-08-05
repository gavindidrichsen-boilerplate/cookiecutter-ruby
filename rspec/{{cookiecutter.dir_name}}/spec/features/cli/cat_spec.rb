describe "features/sign-in", :type => :aruba do
  let(:file) { "file.txt" }
  let(:content) { "Hello, Aruba!" }

  before(:each) { write_file file, content }
  before(:each) { run_command("cat file.txt") }

  # Full string
  it { expect(last_command_started).to have_output content }

  # Substring
  it { expect(last_command_started).to have_output(/Hello, Aruba!/) }
end