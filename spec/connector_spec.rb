require 'spec_helper'



describe "Connector" do
	let(:connector) { Vakit::Connect }
	subject { connector }
	it { should respond_to(:new)}
end