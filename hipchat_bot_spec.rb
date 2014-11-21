require "hipchat_bot"
require "webmock"

describe HipchatBot do
  before(:each) do
    HipchatBot.configure do |config|
      config["room_id"] = 90210
      config["auth_token"] = "GATTACA"
      config["text_color"] = "green"
    end
  end

  it "#broadcasts" do
    WebMock.stub_request(:post, "https://api.hipchat.com/v2/room/90210/notification").
      with(:body => "{\"color\":\"green\",\"message_format\":\"text\",\"message\":\"Mic check check\"}",
           :headers => {'Authorization'=>'Bearer GATTACA'}).
      to_return(:status => 200)
    expect(HipchatBot.broadcast("Mic check check").code).to eq("200")
  end

  it "#receives" do
    WebMock.stub_request(:get, "http://api.hipchat.com:443/v2/room/90210/history/lastest?auth_token=GATTACA").
      to_return(:status => 200, :body => "some text")
    expect(HipchatBot.receive).to eq("some text")
  end
end
