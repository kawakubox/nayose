class CompanyName
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique
  property :word_count, type: Integer

  has_many :out, :words, type: :has, model_class: :Word, unique: true

  before_save do
    self.word_count = sanitize.split(/[ ]+/).size
  end

  def destructure
    self.words = sanitize.split(/[ ]+/).map
  end

  private

  def sanitize
    self.text.gsub(/[^0-9a-zA-Z]/, ' ')
  end
end
