class EnhancedColumn
  attr_accessor :name, :title, :sortable, :filterable, :choices, :type, :editable, :hash_dig, :style

  def initialize(name:, title: nil, sortable: nil, filterable: nil, choices: nil, type: nil, editable: nil, hash_dig: nil, style: nil)
    @name = name
    @title = title
    @sortable = sortable
    @filterable = filterable
    @choices = choices
    @type = type
    @editable = editable
    @hash_dig = hash_dig
    @style = style
  end

  # column names: Lesson.columns.map(&:name)
  # association names: Lesson.reflect_on_all_associations.map(&:name)
  # take example here https://github.com/amoeba-rb/amoeba/blob/25a6a227088d2324685eebccfae53b6066b212f9/lib/amoeba/class_methods.rb
end
