module ApplicationHelper
    # If the test path is a prefix to our current path, returns true.
    # Otherwise, returns false.
    def current_route?(req, test_path)
        req.path.starts_with?(test_path)
    end

    def format_date(date)
        date.strftime("%a. %b. %-e, '%y")
    end

    def get_hours_from_duration(duration)
        (duration / 1.hour).round
    end

    def get_minutes_from_duration(duration)
        (duration / 1.minute).round
    end

    def get_remaining_minutes_from_duration(duration)
        get_minutes_from_duration(duration) % 60
    end

    def format_duration(duration)
        hours = get_hours_from_duration(duration)
        minutes = get_remaining_minutes_from_duration(duration)
        "#{hours}h #{minutes}m"
    end
end
