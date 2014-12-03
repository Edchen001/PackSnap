class AmazonClient
  class << self
    def search(item)
      Amazon::Ecs.item_search(item, search_index: "ALL")
    end
  end
end