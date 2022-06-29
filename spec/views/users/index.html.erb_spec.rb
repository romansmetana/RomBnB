require 'rails_helper'

RSpec.describe 'users/index.html.erb', type: :view do
  before(:each) do
    
    @user = assign(:user, User.create!(
      email: 'test@test.com',
      password: 'password',
      first_name: 'Alex',
      last_name: 'Duoling'))

  end

  it "render main page" do
    render template: 'users/index'
    expect(rendered).to match(/Glad to see you Alex Duoling in RomBnB/)  
  end
end
