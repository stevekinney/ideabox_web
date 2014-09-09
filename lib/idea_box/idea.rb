class Idea
  include Comparable
  attr_reader :title,
              :description,
              :rank,
              :id,
              :tags

  def initialize(attributes)
    @title       = attributes["title"]
    @description = attributes["description"]
    @rank        = attributes["rank"] || 0
    @id          = attributes["id"]
    @tags        = attributes["tags"] || 0
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      "title" => title,
      "description" => description,
      "rank" => rank,
      "tags" => tags
    }
  end

  def like!
    @rank += 1
  end

  def <=>(other)
    other.rank <=> rank
  end

  def clean_tags(idea_tags)
    idea_tags['tags'] =
      (idea_tags['tags'] || "").split(", ")
  end

end
