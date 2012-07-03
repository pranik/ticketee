require 'spec_helper'

describe ProjectsController do
  let(:user) { create_user! }
  let(:project) { FactoryGirl.create(:project) }

  context "standard users" do
    { "new" => "get",
      "create" => "post",
      "edit" => "get",
      "update" => "put",
      "destroy" => "delete" }.each do |action, method|
      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end
    end
  end

  context "not logged users" do
    { "show" => "get" }.each do |action, method|
      it "cannot access the #{action} action" do
        send(method, action.dup, :id => project.id)
        response.should redirect_to(new_user_session_path)
      end
    end
  end

  it "display an error for a missing project" do
    sign_in(:user, user)
    get :show, :id => "not-there"
    response.should redirect_to(projects_path)
    message = "The project you were looking for could not be found."
    flash.alert.should eql(message)
  end

  it "cannot access the show action" do
    sign_in(:user, user)
    get :show, :id => project.id
    response.should redirect_to(projects_path)
    flash.alert.should eql("The project you were looking for could not be found.")
  end

end
