require "spec_helper"

module Recruiter
  RSpec.describe HomeController, type: :controller do
    routes { Recruiter::Engine.routes }

    describe "GET index" do

      before do
        4.times do
          Job.make!
          Article.make!
        end

        get :index
      end

      it "responds with success" do
        expect(response).to be_success
      end

      it "assigns 3 jobs" do
        expect(assigns(:jobs).size).to eq(3)
        expect(assigns(:jobs).first).to be_a(Job)
      end

      it "assigns 3 articles" do
        expect(assigns(:articles).size).to eq(3)
        expect(assigns(:articles).first).to be_a(Article)
      end
    end
  end
end
