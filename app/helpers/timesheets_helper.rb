module TimesheetsHelper
    def get_latest_timesheet(user)
        Timesheet.where(user).order(created_at: :desc).first
    end
end
