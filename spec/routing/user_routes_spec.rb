require 'spec_helper'

describe 'Routes for User' , user: true do

  it 'should route GET /users to Users#Index' do
    expect(get: '/users')
    .to route_to(controller: 'users', action: 'index')
  end

  it 'should route POST /users to users/registrations#create' do
    expect(post: '/users')
    .to route_to(controller: 'users/registrations', action: 'create')
  end

  it 'should not route GET /users/new' do
    expect(get: '/users/new')
    .not_to be_routable
  end

  it 'should not route GET /users/{id}' do
    expect(get: '/users/1')
    .not_to be_routable
    #.to route_to(controller: 'users', action: 'show', id: '1')
  end

  it 'should not route GET /users/{id}/edit' do
    expect(get: '/users/1/edit')
    .not_to be_routable
  end

  it 'should not route PUT /users/{id}' do
    expect(put: '/users/1')
    .not_to be_routable
  end

  it 'should not route DELETE /users/{id}' do
    expect(delete: '/users/1')
    .not_to be_routable
  end

end