require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "POST #create" do
        context "with invalid params" do
            it "validates the presence of users[:username] and [:password]" do
                post :create, params: {user:{username:"xxP01sonstingxx", password: ""}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present 
            end

            it "validates password is at least 6 characters long" do
                post :create, params: {user:{username:"xxP01sonstingxx", password: "short"}}
                expect(response).to render_template("new")
                expect(flash[:errors]).to be_present 
            end
        end

        context "with valid params" do
            it "redrects user to their show page" do
                post :create, params: {user:{username:"xxP01sonstingxx", password: "password"}}
                expect(response).to render_template("show")

            end
        end
    end

end
