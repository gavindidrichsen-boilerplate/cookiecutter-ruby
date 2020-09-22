require "{{cookiecutter.dir_name}}"

describe "{{cookiecutter.dir_name | capitalize}}" do
  it "has a version number" do
    expect({{cookiecutter.dir_name | capitalize}}::VERSION).not_to be nil
  end

  it "should be a runner" do
    expect({{cookiecutter.dir_name | capitalize}}::Behaviours::Runner::WhoIs.awesome?).to eq("YOU ARE AN AWESOME RUNNER!!")
  end

  it "should be a quarterback" do
    expect({{cookiecutter.dir_name | capitalize}}::Behaviours::Quarterback::WhoIs.awesome?).to eq("YOU ARE AN AWESOME QUARTERBACK!!")
  end
end
