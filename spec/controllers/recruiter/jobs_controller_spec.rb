require 'spec_helper'

module Recruiter
  describe JobsController, type: :controller do
    include ControllersSpecHelpers
    routes { Recruiter::Engine.routes }

    describe "GET 'index'" do
      let(:job) { Job.make }

      before do
        chain = double(:query)
        expect(chain).to receive(:per).and_return([job])
        expect(chain).to receive(:page).and_return(chain)
        expect(Job).to receive(:open).and_return(chain)
      end

      it "returns http success" do
        get 'index'
        expect(response).to be_success
      end

      it "assigns jobs to @jobs" do
        get :index
        expect(assigns(:jobs)).to eq([job])
      end
    end

    describe "GET 'show'" do
      let(:job) { Job.make! }
      it_responds_with_success { get :show, id: job.to_param }

      it "assigns job" do
        get :show, id: job.to_param
        expect(assigns(:job)).to eq(job)
      end

      context 'when url is not canonical' do
        it 'redirects to the canonical' do
          get :show, id: job.id
          expect(response).to redirect_to([job])
        end
      end
    end
  end
end
