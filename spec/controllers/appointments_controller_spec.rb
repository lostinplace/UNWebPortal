require 'spec_helper'

describe AppointmentsController do
  include Devise::TestHelpers

  describe "GET index" do
    it "assigns @appointments" do
      appointment = FactoryGirl.build(:appointment)
      appointment.save
      get :index
      expect(assigns(:appointments)).to eq([appointment])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "POST create" do
    let(:auth_user) { build(:user) }
    let(:country) { build(:country) }
    let(:auth_appointment) { build(:appointment, user: auth_user, country: country, position: 'administrator') }

    it "should add an appointment" do
      auth_user.save
      country.save
      auth_appointment.save
      sign_in auth_user
      post :create, :appointment => { country_id: country.id, user_id: auth_user.id, position: 'citizen' }
      expect(Appointment.where( {user: auth_user, country: country, position: 'citizen' } ).count).to eql(1)

    end


    describe "when given non-standard arguments" do
      
      
      it "replaces a string user_id with a user_id of the specified email" do
        auth_user.save
        country.save
        auth_appointment.save

        sign_in auth_user
        post :create, :appointment => { country_id: country.id, user_id: auth_user.email, position: 'citizen' }
        
        expect(Appointment.where( {user: auth_user, country: country, position: 'citizen' } ).count).to eql(1)
      end
    end
    

    it "denies access to users without management permissions to the country" do
      new_country = create(:country)
      ua_user = create(:user)
      sign_in ua_user
      
      post :create, :appointment => { country_id: new_country.id, user_id: ua_user.id, position: 'administrator' }
      expect(response).to redirect_to action: :index, 
        alert:"You are not authorized to manage appointments for #{new_country.name}"      

      expect(Appointment.where( {user: ua_user, country: new_country} ).count).to eql(0)
      
    end

  end

end
