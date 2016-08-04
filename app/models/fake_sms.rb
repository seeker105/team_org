class FakeSMS
  Message = Struct.new(:from, :to, :body)

  cattr_accessor :contents
  self.contents = []

  def initialize(_account_sid, _auth_token)
  end

  def messages
    self
  end

  def account
    self
  end

  def self.reset
    self.contents = []
  end

  def create(from:, to:, body:)
    self.class.contents << Message.new(from: from, to: to, body: body)
  end
end
