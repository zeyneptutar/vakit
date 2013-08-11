require 'spec_helper'



describe "Connector#new" do
	let(:connector) { Vakit::Connect }
	subject { connector }
	it { should respond_to(:new)}


	context "Conect to samanyoluhaber.com" do
		let(:connector) { Vakit::Connect.shaber }
		subject { connector }

		describe "connected" do
			it { should be_a(Hash)}
			its(:length) { should == 6 }
		end

		describe "data" do
			
			it { should include(:imsak)}
			it { should include(:sabah)}
			it { should include(:oglen)}
			it { should include(:ikindi)}
			it { should include(:aksam)}
			it { should include(:yatsi)}

		end



	end
end
