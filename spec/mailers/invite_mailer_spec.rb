require "spec_helper"

describe InviteMailer do
  describe "email" do
    let(:mail) { InviteMailer.email }

    it "renders the headers" do
      mail.subject.should eq("Email")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
