class Post < ApplicationRecord
  validates :start, {presence: true}
  validates :stop, {presence: true}
  validates :tittle, {presence: true}
  validate :start_end_check
  validate :schedule_cannot_be_in_the_past

  def start_end_check
    errors.add(:stop, "は開始日より前の日付は登録できません。") unless
    self.start <= self.stop 
  end
  
  def schedule_cannot_be_in_the_past
    if self.start.past?
      errors.add(:start, "過去の日付は指定できません。")
    end
    if self.stop.past?
      errors.add(:stop, "過去の日付は指定できません。")
    end
  end
end
