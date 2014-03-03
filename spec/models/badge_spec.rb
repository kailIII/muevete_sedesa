require 'spec_helper'

describe Badge do
  before do
    @badge = Badge.new(name: "Badge1", desc: "Lorem ipsum blbalba", points: 100 )
  end

  subject { @badge }

  it { should respond_to(:name) }
  it { should respond_to(:desc) }
  it { should respond_to(:points) }

  it { should respond_to(:user_relationships) }


end
