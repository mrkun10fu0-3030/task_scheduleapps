class Schedule < ApplicationRecord
    validates :title, :start_date, :end_date, presence: true
    validates :title, length: { maximum: 20}
    validates :content, length: {maximum: 500}

    validate :end_date_after_start_date
    
    private

    def end_date_after_start_date
        if start_date.present? && end_date.present? && end_date < start_date
            errors.add(:end_date, "は開始日以降の日付を入力してください")
        end
    end
end
