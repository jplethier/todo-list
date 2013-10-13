require 'spec_helper'

describe Project do
  subject { project }

  let(:project) { FactoryGirl.build :project }

  its(:valid?) { should be_true }

  describe 'validations' do
    it 'requires a name' do
      expect { project.name = nil }.to change { project.valid? }.from(true).to(false)
    end

    it 'requires a user' do
      expect { project.user = nil }.to change { project.valid? }.from(true).to(false)
    end
  end
end
