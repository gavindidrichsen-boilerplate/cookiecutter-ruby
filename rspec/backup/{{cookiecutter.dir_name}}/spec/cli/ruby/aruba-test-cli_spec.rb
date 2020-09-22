describe "cli/ruby/aruba-test-cli.rb", type: :aruba do
  it "should fail if no file defined" do
    run_command("aruba-test-cli.rb")
    expect(last_command_started).to have_output(/aruba-test-cli \[file\]: Filename is missing/)
  end

  it "should fail if file is not present" do
    run_command("aruba-test-cli.rb file.does.not.exist")
    expect(last_command_started).to have_output(/aruba-test-cli \[file\]: File does not exist/)
  end
end
