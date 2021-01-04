require "{{cookiecutter.dir_name}}/behaviours/quarterback"

describe "{{cookiecutter.dir_name | capitalize}}::Behaviours::Quarterback" do
  it "should be able to throw" do
    expect({{cookiecutter.dir_name | capitalize}}::Behaviours::Quarterback::WhoIs.awesome?).to eq("YOU ARE AN AWESOME QUARTERBACK!!")
  end
end
