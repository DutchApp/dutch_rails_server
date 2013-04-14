require 'spec_helper'

describe 'Routes for User' , user: true do

  it 'should route GET /users to Users#Index' do
    expect(get: '/users')
    .to route_to(controller: 'users', action: 'index')
  end

  it 'should route POST /users to users#create' do
    expect(post: '/users')
    .to route_to(controller: 'users', action: 'create')
  end

  it 'should route GET /users/new to users#new' do
    expect(get: '/users/new')
    .to route_to(controller: 'users', action: 'new')
  end

  it 'should route GET /users/{id} to users#show' do
    expect(get: '/users/1')
    .to route_to(controller: 'users', action: 'show', id: '1')
  end

  it 'should route GET /users/{id}/edit to users#edit' do
    expect(get: '/users/1/edit')
    .to route_to(controller: 'users', action: 'edit', id: '1')
  end

  it 'should route PUT /users/{id} to users#update' do
    expect(put: '/users/1')
    .to route_to(controller: 'users', action: 'update', id: '1')
  end

  it 'should route DELETE /users/{id} to users#destroy' do
    expect(delete: '/users/1')
    .to route_to(controller: 'users', action: 'destroy', id: '1')
  end

  it 'should route POST /users/sign_in to users#login' do
    expect(post: '/users/sign_in')
    .to route_to(controller: 'users', action: 'login')
  end

end