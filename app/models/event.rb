class Event < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 60 }
  validates :description, length: { is: 100}, allow_blank: true
  validate :start_at_blank, :end_at_blank, :end_at_cannot_start_before_start_at
   
 end

#scope :already_started, Lambda {
#  where(["start_at < ?", Time.now])
#}
#scope :already_like, Lambda {
#	where(["name like ?", "%#{name}%"])
#}
#scope :description_like, Lambda {
#  where(["description like ?", "%#{description}%"])
#}

###Aplicando Scope

def self.for_today
  where(["DATE(start_at) = ? AND description = ?", Date.today, "hi"])

end



private

def start_at_blank
  if start_at.blank?
    errors.add(:start_at, "Start date can't be blank") 
  end
end

def end_at_blank
  if end_at.blank?
    errors.add(:end_at, "Expiration date can't be blank")
  end
end
def end_at_cannot_start_before_start_at
  if end_at.present? && start_at.present? && end_at < start_at
    errors.add(:end_at, "Can't be minor than start at")
  end
end
