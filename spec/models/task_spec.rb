require 'spec_helper'

describe Task do
  subject { task }

  let(:task) { FactoryGirl.build :task }

  its(:valid?) { should be_true }

  describe 'validations' do
    it 'requires a description' do
      expect { task.description = nil }.to change { task.valid? }.from(true).to(false)
    end

    it 'requires a project' do
      expect { task.project = nil }.to change { task.valid? }.from(true).to(false)
    end
  end
end
