module IntervalsHelper
    def format_time(time)
        time.strftime("%l:%M %p").strip
    end
end
