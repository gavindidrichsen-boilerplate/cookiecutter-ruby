describe "cli/rake", type: :aruba do
  it "should return --tasks" do
    run_command("bera --tasks")
    expect(last_command_started).to have_output(/rake spec  # Run RSpec code examples/)
  end
end
