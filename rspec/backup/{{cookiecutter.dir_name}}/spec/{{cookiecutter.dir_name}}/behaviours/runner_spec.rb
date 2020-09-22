require "{{cookiecutter.dir_name}}/behaviours/runner"

describe "{{cookiecutter.dir_name | capitalize}}::Behaviours::Runner" do
  it "should be able to run" do
    expect({{cookiecutter.dir_name | capitalize}}::Behaviours::Runner::WhoIs.awesome?).to eq("YOU ARE AN AWESOME RUNNER!!")
  end
end
