class Lesson < ApplicationRecord
  belongs_to :section
  mount_uploader :video, VideoUploader
  has_many :embeds

  include RankedModel
  ranks :row_order, :with_same => :section_id

  def code
    self.embed.split("v=")[1]
  end

  def next_lesson
    lesson = section.lessons.where("row_order > ?", self.row_order).rank(:row_order).first
    if lesson.blank? && section.next_section
      return section.next_section.lessons.rank(:row_order).first
    end

    return lesson
  end


end
