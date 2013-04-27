require 'spec_helper'

describe 'Routes for expenses' do

  it 'should route GET /expenses/new to expenses#new' do
    expect(get: '/expenses/new')
    .to route_to(controller: 'expenses', action: 'new')
  end
end