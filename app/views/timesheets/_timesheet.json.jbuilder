json.extract! timesheet, :id, :user_id, :pay_period_id, :created_at, :updated_at
json.url timesheet_url(timesheet, format: :json)
