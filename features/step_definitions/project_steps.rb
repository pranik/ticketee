Given /^there is a project called "([^\"]*)"$/ do |name|
  @project = FactoryGirl.create(:project, :name => name)
end
