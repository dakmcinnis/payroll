module ApplicationHelper
    # If the test path is a prefix to our current path, returns true.
    # Otherwise, returns false.
    def current_route?(req, test_path)
        req.path.starts_with?(test_path)
    end

    def format_date(date)
        date.strftime("%a. %b. %-e, '%y")
    end
end
