describe "features/cli/aruba-test-cli", :type => :aruba do
  it "should contain all file contents" do 
    run_command("aruba-test-cli")
    expect(last_command_started).to have_output(/aruba-test-cli \[file\]: Filename is missing/)
  end

  it "should contain a substring" do
    run_command("aruba-test-cli file.does.not.exist")
    expect(last_command_started).to have_output(/aruba-test-cli \[file\]: File does not exist/)
  end
end