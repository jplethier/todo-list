require 'spec_helper'
require "cancan/matchers"

describe Ability do
  context 'Guest user' do
    let(:guest_user)   { User.new }
    let(:ability)    { Ability.new(guest_user) }

    it 'can not manage any project' do
      project = stub_model(Project)
      expect(ability).to_not be_able_to :manage, project
    end
  end

  context 'Any User' do
    let(:user)         { stub_model(User) }
    let(:user_project) { stub_model(Project, user: user) }
    let(:ability)      { Ability.new(user) }

    it 'can manage your own projects' do
      expect(ability).to be_able_to :manage, user_project
    end

    it 'can not manage others projects' do
      another_user = stub_model(User)
      another_user_project = stub_model(Project, user: another_user)
      expect(ability).to_not be_able_to :manage, another_user_project
    end
  end
end
