module Common
  extend ActiveSupport::Concern

  private

  def tags_desc
    Task.tag_counts_on(:tags).order('count DESC') # order('count DESC')でカウントの多い順にタグを並べる
  end
end
