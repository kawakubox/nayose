class CompanyName
  include Neo4j::ActiveNode

  property :text, type: String, constraint: :unique

  has_many :out, :words, type: :has, model_class: :Word

  before_save do
    self.text = text.underscore
    self.words = sanitize.split(/[ ]+/).map { |word| Word.find_or_create(text: word) }
  end

  private

  def sanitize
    self.text.gsub(/[^0-9a-zA-Z]/, ' ')
  end
end
