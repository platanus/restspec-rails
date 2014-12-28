require 'rails_helper'

RSpec.describe :secrets, :type => :api do
  endpoint 'secrets/create' do
    test do
      it { should have_status(201) }
    end
  end
end
