describe "cli/rake", type: :aruba do
  it "should return --tasks" do
    run_command("bera --tasks")
    expect(all_stdout.to_s).to match(/rake spec\s+# Run RSpec code examples/)
  end
end
